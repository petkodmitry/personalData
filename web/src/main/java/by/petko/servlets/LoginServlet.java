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
                request.setAttribute("errorMessage", "Please enter valid username and password.");
                doGet(request, response);
            } else {
                String userRole = user.getRole().toUpperCase();
                try {
                    UserRole.valueOf(userRole);
                    request.getSession().setAttribute("user", user);
                    response.sendRedirect(request.getContextPath() + "/" + userRole.toLowerCase());
                } catch (IllegalArgumentException e) {
                    request.setAttribute("errorMessage", "User's role is " + userRole + ", which is not allowed.");
                    doGet(request, response);
                }
            }
        } catch (HibernateException e) {
            String errorMessage = e.getMessage();
            if (errorMessage == null) {
                request.setAttribute("errorMessage", "Some problem with DB connection occurred.");
            } else request.setAttribute("errorMessage", errorMessage);
            doGet(request, response);
        }
    }
}
