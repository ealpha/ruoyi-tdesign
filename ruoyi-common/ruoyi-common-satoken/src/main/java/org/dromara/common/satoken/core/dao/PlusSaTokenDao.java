package org.dromara.common.satoken.core.dao;

import cn.dev33.satoken.dao.SaTokenDao;
import cn.dev33.satoken.util.SaFoxUtil;
import org.dromara.common.redis.utils.RedisUtils;

import java.time.Duration;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * Sa-Token持久层接口(使用框架自带RedisUtils实现 协议统一)
 *
 * @author Lion Li
 */
public class PlusSaTokenDao implements SaTokenDao {

    /**
     * 获取Value，如无返空
     */
    @Override
    public String get(String key) {
        return RedisUtils.getObject(key);
    }

    /**
     * 写入Value，并设定存活时间 (单位: 秒)
     */
    @Override
    public void set(String key, String value, long timeout) {
        if (timeout == 0 || timeout <= NOT_VALUE_EXPIRE) {
            return;
        }
        // 判断是否为永不过期
        if (timeout == NEVER_EXPIRE) {
            RedisUtils.setObject(key, value);
        } else {
            RedisUtils.setObject(key, value, Duration.ofSeconds(timeout));
        }
    }

    /**
     * 修修改指定key-value键值对 (过期时间不变)
     */
    @Override
    public void update(String key, String value) {
        if (RedisUtils.hasKey(key)) {
            RedisUtils.setObject(key, value, true);
        }
        RedisUtils.setObject(key, value, true);
    }

    /**
     * 删除Value
     */
    @Override
    public void delete(String key) {
        RedisUtils.deleteObject(key);
    }

    /**
     * 获取Value的剩余存活时间 (单位: 秒)
     */
    @Override
    public long getTimeout(String key) {
        long timeout = RedisUtils.getTimeToLive(key);
        return timeout < 0 ? timeout : timeout / 1000;
    }

    /**
     * 修改Value的剩余存活时间 (单位: 秒)
     */
    @Override
    public void updateTimeout(String key, long timeout) {
        RedisUtils.expire(key, Duration.ofSeconds(timeout));
    }


    /**
     * 获取Object，如无返空
     */
    @Override
    public Object getObject(String key) {
        return RedisUtils.getObject(key);
    }

    /**
     * 写入Object，并设定存活时间 (单位: 秒)
     */
    @Override
    public void setObject(String key, Object object, long timeout) {
        if (timeout == 0 || timeout <= NOT_VALUE_EXPIRE) {
            return;
        }
        // 判断是否为永不过期
        if (timeout == NEVER_EXPIRE) {
            RedisUtils.setObject(key, object);
        } else {
            RedisUtils.setObject(key, object, Duration.ofSeconds(timeout));
        }
    }

    /**
     * 更新Object (过期时间不变)
     */
    @Override
    public void updateObject(String key, Object object) {
        if (RedisUtils.hasKey(key)) {
            RedisUtils.setObject(key, object, true);
        }
    }

    /**
     * 删除Object
     */
    @Override
    public void deleteObject(String key) {
        RedisUtils.deleteObject(key);
    }

    /**
     * 获取Object的剩余存活时间 (单位: 秒)
     */
    @Override
    public long getObjectTimeout(String key) {
        long timeout = RedisUtils.getTimeToLive(key);
        return timeout < 0 ? timeout : timeout / 1000;
    }

    /**
     * 修改Object的剩余存活时间 (单位: 秒)
     */
    @Override
    public void updateObjectTimeout(String key, long timeout) {
        RedisUtils.expire(key, Duration.ofSeconds(timeout));
    }


    /**
     * 搜索数据
     */
    @Override
    public List<String> searchData(String prefix, String keyword, int start, int size, boolean sortType) {
        Collection<String> keys = RedisUtils.keys(prefix + "*" + keyword + "*");
        List<String> list = new ArrayList<>(keys);
        return SaFoxUtil.searchList(list, start, size, sortType);
    }
}
