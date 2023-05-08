package org.dromara.common.security.config;

import cn.dev33.satoken.interceptor.SaInterceptor;
import cn.dev33.satoken.router.SaRouter;
import cn.dev33.satoken.stp.StpLogic;
import cn.hutool.core.collection.CollUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.dromara.common.core.domain.model.BaseUser;
import org.dromara.common.satoken.config.MultipleSaTokenConfig;
import org.dromara.common.satoken.config.MultipleSaTokenProperties;
import org.dromara.common.satoken.context.SaSecurityContext;
import org.dromara.common.satoken.stp.DynamicStpLogic;
import org.dromara.common.satoken.utils.MultipleStpUtil;
import org.dromara.common.security.config.properties.SecurityProperties;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.Map;

/**
 * 权限安全配置
 *
 * @author Lion Li
 */
@Slf4j
@AutoConfiguration
@EnableConfigurationProperties(SecurityProperties.class)
@RequiredArgsConstructor
public class SecurityConfig implements WebMvcConfigurer {

    private final SecurityProperties securityProperties;
    private final MultipleSaTokenProperties multipleSaTokenProperties;

    /**
     * 注册sa-token的拦截器
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // 使用注解的方式精细控制权限
        // 注册路由拦截器，自定义验证规则
        registry.addInterceptor(new SaInterceptor(handler -> {
                for (Map.Entry<String, MultipleSaTokenConfig> entry : multipleSaTokenProperties.getMultiple().entrySet()) {
                    String type = entry.getKey();
                    MultipleSaTokenConfig config = entry.getValue();
                    if (CollUtil.isNotEmpty(config.getMatch())) {
                        StpLogic logic = DynamicStpLogic.getDynamicStpLogic(type);
                        SaRouter
                            .match(config.getMatch())
                            .check(logic::checkLogin)
                            .check(() -> {
                                BaseUser user = (BaseUser) logic.getTokenSession().get(MultipleStpUtil.LOGIN_USER_KEY);
                                SaSecurityContext.setContext(user);
                            });
                    }
                }
            /*AllUrlHandler allUrlHandler = SpringUtils.getBean(AllUrlHandler.class);
            // 登录验证 -- 排除多个路径
            SaRouter
                // 获取所有的
                .match(allUrlHandler.getUrls())
                // 对未排除的路径进行检查
                .check(() -> {
                    // 检查是否登录 是否有token
                    MultipleStpUtil.SYSTEM.checkLogin();

                    // 有效率影响 用于临时测试
                    // if (log.isDebugEnabled()) {
                    //     log.debug("剩余有效时间: {}", StpUtil.getTokenTimeout());
                    //     log.debug("临时有效时间: {}", StpUtil.getTokenActivityTimeout());
                    // }

                });*/
            })).addPathPatterns("/**")
            // 排除不需要拦截的路径
            .excludePathPatterns(securityProperties.getExcludes());
    }

}
