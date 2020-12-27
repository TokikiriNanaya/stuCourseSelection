package com.kiriya.util;

import com.kiriya.entity.Student;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Kirito
 * 登录拦截
 * @date 2020/12/25 22:01 <br>
 */
public class Interceptor implements HandlerInterceptor {
    //不拦截的页面
    private static final String[] IGNORE_URI = {"login"};

    @Override
    public void afterCompletion(HttpServletRequest request,
                                HttpServletResponse response, Object arg2, Exception arg3){
    }

    @Override
    public void postHandle(HttpServletRequest arg0, HttpServletResponse response,
                           Object arg2, ModelAndView arg3){
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
                             Object arg2) throws Exception {
        //对请求路径进行判断
        String servletPath = request.getServletPath();
        boolean flag = false;
        //判断请求是否需要拦截
        for (String s : IGNORE_URI) {
            if (servletPath.contains(s)) {
                flag = true;
                break;
            }
        }
        //拦截请求
        if (!flag) {
            Student student = (Student) request.getSession().getAttribute("student");
            if (student == null) {
                System.out.println("Interceptor拦截请求："+servletPath);
                request.getRequestDispatcher("/login").forward(request, response);
            } else {
                //用户登陆过，验证通过，放行
                System.out.println("Interceptor放行请求："+servletPath);
                flag = true;
            }
        }
        return flag;
    }
}