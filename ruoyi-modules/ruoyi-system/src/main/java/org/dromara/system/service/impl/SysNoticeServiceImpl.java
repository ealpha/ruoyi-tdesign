package org.dromara.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.dromara.common.core.utils.MapstructUtils;
import org.dromara.common.mybatis.core.page.PageQuery;
import org.dromara.common.mybatis.core.page.TableDataInfo;
import org.dromara.system.domain.SysNotice;
import org.dromara.system.domain.bo.SysNoticeBo;
import org.dromara.system.domain.dto.SysNoticeQuery;
import org.dromara.system.domain.vo.SysNoticeVo;
import org.dromara.system.mapper.SysNoticeMapper;
import org.dromara.system.service.ISysNoticeService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.List;

/**
 * 公告 服务层实现
 *
 * @author Lion Li
 */
@Service
public class SysNoticeServiceImpl extends ServiceImpl<SysNoticeMapper, SysNotice> implements ISysNoticeService {

    @Override
    public TableDataInfo<SysNoticeVo> selectPageNoticeList(SysNoticeQuery notice) {
        return PageQuery.of(() -> baseMapper.queryList(notice));
    }

    /**
     * 查询公告信息
     *
     * @param noticeId 公告ID
     * @return 公告信息
     */
    @Override
    public SysNoticeVo selectNoticeById(Long noticeId) {
        return baseMapper.selectVoById(noticeId);
    }

    /**
     * 查询公告列表
     *
     * @param notice 公告信息
     * @return 公告集合
     */
    @Override
    public List<SysNoticeVo> selectNoticeList(SysNoticeQuery notice) {
        return baseMapper.queryList(notice);
    }

    /**
     * 新增公告
     *
     * @param bo 公告信息
     * @return 结果
     */
    @Override
    public Boolean insertNotice(SysNoticeBo bo) {
        SysNotice notice = MapstructUtils.convert(bo, SysNotice.class);
        return save(notice);
    }

    /**
     * 修改公告
     *
     * @param bo 公告信息
     * @return 结果
     */
    @Override
    public Boolean updateNotice(SysNoticeBo bo) {
        SysNotice notice = MapstructUtils.convert(bo, SysNotice.class);
        return updateById(notice);
    }

    /**
     * 删除公告对象
     *
     * @param noticeId 公告ID
     * @return 结果
     */
    @Override
    public int deleteNoticeById(Long noticeId) {
        return baseMapper.deleteById(noticeId);
    }

    /**
     * 批量删除公告信息
     *
     * @param noticeIds 需要删除的公告ID
     * @return 结果
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int deleteNoticeByIds(Long[] noticeIds) {
        return baseMapper.deleteBatchIds(Arrays.asList(noticeIds));
    }
}