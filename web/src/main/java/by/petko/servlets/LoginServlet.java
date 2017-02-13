package by.petko.servlets;

import by.petko.UserService;
import by.petko.entity.UserEntity;
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
                request.getServletContext().getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
            } else {
                request.getSession().setAttribute("user", user);
                switch (user.getRole().toUpperCase()) {
                    case "ADMIN":
                        response.sendRedirect(request.getContextPath() + "/admin");
                        break;
                    case "USER":
                        response.sendRedirect(request.getContextPath() + "/user");
                        break;
                }
            }
        } catch (HibernateException e) {
            String errorMessage = e.getMessage();
            if (errorMessage == null) {
                request.setAttribute("errorMessage", "Some problem with DB connection occurred.");
            } else request.setAttribute("errorMessage", errorMessage);
            request.getServletContext().getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
        }
    }
}
