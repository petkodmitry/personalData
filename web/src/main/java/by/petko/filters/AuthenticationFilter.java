package by.petko.filters;

import by.petko.entity.UserEntity;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(urlPatterns = "/*")
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
            String userRole = user.getRole().toUpperCase();
            if (!uri.toUpperCase().contains(userRole)) {
                switch (userRole) {
                    case "USER":
                        response.sendRedirect(request.getContextPath() + "/user");
                        break;
                    case "ADMIN":
                        response.sendRedirect(request.getContextPath() + "/admin");
                        break;
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
