package cn.com.konyo.core.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.resource.ResourceHttpRequestHandler;

import cn.com.konyo.user.domain.LoginUser;

public class SessionHandlerInterceptor extends HandlerInterceptorAdapter {

    private static final Logger logger = LoggerFactory.getLogger(SessionHandlerInterceptor.class);

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        boolean handle = true;

        String uri = request.getRequestURI();

        // logger.info("uri : {}",uri);
        logger.debug("handler class : {}", handler.getClass());

        LoginUser loginUser = (LoginUser) request.getSession().getAttribute("loginUser");

        if (null == loginUser && !(handler instanceof ResourceHttpRequestHandler)) {
            StringBuffer out = new StringBuffer();
            out.append("<script type='text/javascript'>");
            out.append("window.top.location.href = '");
            out.append(request.getContextPath());
            out.append("/admin");
            out.append("';</script>");
            response.getWriter().print(out.toString());
            handle = false;
        }
        return handle;
    }
}
