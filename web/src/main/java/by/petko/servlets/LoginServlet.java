package by.petko.servlets;

import by.petko.UserService;
import by.petko.entity.UserEntity;
import by.petko.entity.UserRole;
import org.hibernate.HibernateException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Locale;
import java.util.ResourceBundle;

@WebServlet(name = "login", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    private static UserService userService = UserService.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getServletContext().getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        try {
            UserEntity user;
            if (username == null || username.isEmpty() ||
                    password == null || password.isEmpty() ||
                    (user = userService.login(username, password)) == null) {
                String msg = getBundle(request).getString("password.wrong");
                request.setAttribute("errorMessage", msg);
                doGet(request, response);
            } else {
                String userRole = user.getRole().toUpperCase();
                try {
                    UserRole.valueOf(userRole);
                    request.getSession().setAttribute("user", user);
                    response.sendRedirect(request.getContextPath() + "/" + userRole.toLowerCase());
                } catch (IllegalArgumentException e) {
                    String msg = getBundle(request).getString("error.userrole");
                    request.setAttribute("errorMessage", String.format(msg, userRole));
                    doGet(request, response);
                }
            }
        } catch (HibernateException e) {
            String errorMessage = e.getMessage();
            if (errorMessage == null) {
                String msg = getBundle(request).getString("error.db.connection");
                request.setAttribute("errorMessage", msg);
            } else request.setAttribute("errorMessage", errorMessage);
            doGet(request, response);
        }
    }

    private ResourceBundle getBundle(HttpServletRequest request) {
        String localeParam = request.getParameter("locale");
        Locale locale = !"".equals(localeParam) ? new Locale(localeParam) : request.getLocale();
        return ResourceBundle.getBundle("i18n/messages", locale);
    }
}
