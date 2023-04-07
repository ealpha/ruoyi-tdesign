package com.ruoyi.system.service.impl;

import cn.hutool.core.convert.Convert;
import cn.hutool.core.util.ObjectUtil;
import com.baomidou.dynamic.datasource.annotation.DS;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.core.constant.CacheNames;
import com.ruoyi.common.core.constant.UserConstants;
import com.ruoyi.common.core.exception.ServiceException;
import com.ruoyi.common.core.service.ConfigService;
import com.ruoyi.common.core.utils.MapstructUtils;
import com.ruoyi.common.core.utils.StreamUtils;
import com.ruoyi.common.core.utils.StringUtils;
import com.ruoyi.common.core.utils.funtion.BiOperator;
import com.ruoyi.common.core.utils.spring.SpringUtils;
import com.ruoyi.common.mybatis.core.page.PageQuery;
import com.ruoyi.common.mybatis.core.page.TableDataInfo;
import com.ruoyi.common.redis.utils.CacheUtils;
import com.ruoyi.common.tenant.helper.TenantHelper;
import com.ruoyi.system.domain.SysConfig;
import com.ruoyi.system.domain.bo.SysConfigBo;
import com.ruoyi.system.domain.vo.SysConfigVo;
import com.ruoyi.system.mapper.SysConfigMapper;
import com.ruoyi.system.service.ISysConfigService;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * 参数配置 服务层实现
 *
 * @author Lion Li
 */
@Service
public class SysConfigServiceImpl extends ServiceImpl<SysConfigMapper, SysConfig> implements ISysConfigService, ConfigService {

    @Override
    public TableDataInfo<SysConfigVo> selectPageConfigList(SysConfigBo config) {
        return PageQuery.of(() -> baseMapper.queryList(config));
    }

    /**
     * 查询参数配置信息
     *
     * @param configId 参数配置ID
     * @return 参数配置信息
     */
    @Override
    @DS("master")
    public SysConfigVo selectConfigById(Long configId) {
        return baseMapper.selectVoById(configId);
    }

    /**
     * 根据键名查询参数配置信息
     *
     * @param configKey 参数key
     * @return 参数键值
     */
    @Cacheable(cacheNames = CacheNames.SYS_CONFIG, key = "#configKey")
    @Override
    public String selectConfigByKey(String configKey) {
        Optional<SysConfig> oneOpt = lambdaQuery()
            .eq(SysConfig::getConfigKey, configKey)
            .select(SysConfig::getConfigId, SysConfig::getConfigValue)
            .oneOpt();
        if (oneOpt.isPresent()) {
            return oneOpt.get().getConfigValue();
        }
        return StringUtils.EMPTY;
    }

    /**
     * 获取注册开关
     *
     * @param tenantId 租户id
     * @return true开启，false关闭
     */
    @Override
    public boolean selectRegisterEnabled(String tenantId) {
        SysConfig retConfig = baseMapper.selectOne(new LambdaQueryWrapper<SysConfig>()
            .eq(SysConfig::getConfigKey, "sys.account.registerUser")
            .eq(TenantHelper.isEnable(), SysConfig::getTenantId, tenantId));
        if (ObjectUtil.isNull(retConfig)) {
            return false;
        }
        return Convert.toBool(retConfig.getConfigValue());
    }

    /**
     * 获取验证码开关
     *
     * @return true开启，false关闭
     */
    @Override
    public boolean selectCaptchaEnabled() {
        String captchaEnabled = SpringUtils.getAopProxy(this).selectConfigByKey("sys.account.captchaEnabled");
        if (StringUtils.isEmpty(captchaEnabled)) {
            return true;
        }
        return Convert.toBool(captchaEnabled);
    }

    /**
     * 查询参数配置列表
     *
     * @param config 参数配置信息
     * @return 参数配置集合
     */
    @Override
    public List<SysConfigVo> selectConfigList(SysConfigBo config) {
        return baseMapper.queryList(config);
    }

    /**
     * 新增参数配置
     *
     * @param bo 参数配置信息
     * @return 结果
     */
    @CachePut(cacheNames = CacheNames.SYS_CONFIG, key = "#bo.configKey")
    @Override
    public String insertConfig(SysConfigBo bo) {
        SysConfig config = MapstructUtils.convert(bo, SysConfig.class);
        int row = baseMapper.insert(config);
        if (row > 0) {
            return config.getConfigValue();
        }
        throw new ServiceException("操作失败");
    }

    /**
     * 修改参数配置
     *
     * @param bo 参数配置信息
     * @return 结果
     */
    @CachePut(cacheNames = CacheNames.SYS_CONFIG, key = "#bo.configKey")
    @Override
    public String updateConfigs(SysConfigBo bo) {
        int row = 0;
        SysConfig config = MapstructUtils.convert(bo, SysConfig.class);
        if (config.getConfigId() != null) {
            SysConfig temp = baseMapper.selectById(config.getConfigId());
            if (!StringUtils.equals(temp.getConfigKey(), config.getConfigKey())) {
                CacheUtils.evict(CacheNames.SYS_CONFIG, temp.getConfigKey());
            }
            row = baseMapper.updateById(config);
        } else {
            row = baseMapper.update(config, new LambdaQueryWrapper<SysConfig>()
                .eq(SysConfig::getConfigKey, config.getConfigKey()));
        }
        if (row > 0) {
            return config.getConfigValue();
        }
        throw new ServiceException("操作失败");
    }

    /**
     * 批量删除参数信息
     *
     * @param configIds 需要删除的参数ID
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteConfigByIds(Long[] configIds) {
        for (Long configId : configIds) {
            SysConfig config = baseMapper.selectById(configId);
            if (StringUtils.equals(UserConstants.YES, config.getConfigType())) {
                throw new ServiceException(String.format("内置参数【%1$s】不能删除 ", config.getConfigKey()));
            }
            CacheUtils.evict(CacheNames.SYS_CONFIG, config.getConfigKey());
        }
        baseMapper.deleteBatchIds(Arrays.asList(configIds));
    }

    /**
     * 重置参数缓存数据
     */
    @Override
    public void resetConfigCache() {
        CacheUtils.clear(CacheNames.SYS_CONFIG);
    }

    /**
     * 校验参数键名是否唯一
     *
     * @param config 参数配置信息
     * @return 结果
     */
    @Override
    public boolean checkConfigKeyUnique(SysConfigBo config) {
        long configId = ObjectUtil.isNull(config.getConfigId()) ? -1L : config.getConfigId();
        SysConfig info = baseMapper.selectOne(new LambdaQueryWrapper<SysConfig>().eq(SysConfig::getConfigKey, config.getConfigKey()));
        if (ObjectUtil.isNotNull(info) && !Objects.equals(info.getConfigId(), configId)) {
            return false;
        }
        return true;
    }

    /**
     * 查询多个参数
     *
     * @param keys
     * @return
     */
    @Override
    public Map<String, Object> queryConfigs(List<String> keys) {
        List<SysConfig> list = lambdaQuery().in(SysConfig::getConfigKey, keys).list();
        return list.stream().collect(Collectors.toMap(SysConfig::getConfigKey, SysConfig::getConfigValue, BiOperator::last));
    }

    /**
     * 更新配置
     *
     * @param configs
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateConfigs(Map<String, String> configs) {
        List<SysConfig> list = lambdaQuery().in(SysConfig::getConfigKey, configs.keySet()).list();
        Map<String, SysConfig> map = StreamUtils.toIdentityMap(list, SysConfig::getConfigKey);
        configs.forEach((key, value) -> {
            SysConfig config;
            if (map.containsKey(key)) {
                config = map.get(key);
            } else {
                config = new SysConfig();
                config.setConfigKey(key);
                list.add(config);
            }
            config.setConfigValue(value);
        });
        saveOrUpdateBatch(list);
        // 更新缓存
        for (SysConfig sysConfig : list) {
            CacheUtils.put(CacheNames.SYS_CONFIG, sysConfig.getConfigKey(), sysConfig.getConfigValue());
        }
    }

    /**
     * 根据参数 key 获取参数值
     *
     * @param configKey 参数 key
     * @return 参数值
     */
    @Override
    @Cacheable(cacheNames = CacheNames.SYS_CONFIG, key = "#configKey")
    public String getConfigValue(String configKey) {
        return selectConfigByKey(configKey);
    }

}
