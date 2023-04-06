package com.ruoyi.system.mapper;

import com.ruoyi.common.mybatis.core.mapper.BaseMapperPlus;
import com.ruoyi.system.domain.SysPost;
import com.ruoyi.system.domain.bo.SysPostBo;
import com.ruoyi.system.domain.vo.SysPostVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 岗位信息 数据层
 *
 * @author Lion Li
 */
public interface SysPostMapper extends BaseMapperPlus<SysPostMapper, SysPost, SysPostVo> {

    /**
     * 根据用户ID获取岗位选择框列表
     *
     * @param userId 用户ID
     * @return 选中岗位ID列表
     */
    List<Long> selectPostListByUserId(@Param("userId") Long userId);

    /**
     * 查询用户所属岗位组
     *
     * @param userName 用户名
     * @return 结果
     */
    List<SysPostVo> selectPostsByUserName(@Param("userName") String userName);

    /**
     * 查询岗位信息列表
     *
     * @param bo bo对象
     * @return {@link SysPost}
     */
    List<SysPostVo> queryList(SysPostBo bo);
}
