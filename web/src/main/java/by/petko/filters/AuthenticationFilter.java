package by.petko.filters;

import by.petko.UserService;
import by.petko.entity.UserEntity;
import by.petko.entity.UserRole;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;

@WebFilter(urlPatterns = {"/login/*", "/user/*", "/admin/*"})
public class AuthenticationFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        String uri = request.getRequestURI();
        UserEntity user = (UserEntity) request.getSession().getAttribute("user");
        if (user != null) {
            UserService.getInstance().refresh(user);
            String userRole = user.getRole().toUpperCase();
            if (!uri.toUpperCase().contains(userRole)) {
                try {
                    UserRole.valueOf(userRole);
                    response.sendRedirect(request.getContextPath() + "/" + userRole.toLowerCase());
                } catch (IllegalArgumentException e) {
                    filterChain.doFilter(servletRequest, servletResponse);
                }
            } else {
                filterChain.doFilter(servletRequest, servletResponse);
            }
        } else {
            if (!uri.toUpperCase().contains("LOGIN")) {
                response.sendRedirect(request.getContextPath() + "/login");
            } else {
                filterChain.doFilter(servletRequest, servletResponse);
            }
        }
    }

    @Override
    public void destroy() {
    }
}
