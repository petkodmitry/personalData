package by.petko.servlets.admin;

import by.petko.UserService;
import org.hibernate.HibernateException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "delete", urlPatterns = "/admin/delete")
public class DeleteUserServlet extends HttpServlet {
    private static UserService userService = UserService.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String login = request.getParameter("login");
            userService.deleteUser(login);
        } catch (HibernateException e) {
            String errorMessage = e.getMessage();
            if (errorMessage == null) {
                request.setAttribute("errorMessage", "Some problem with DB connection occurred.");
            } else request.setAttribute("errorMessage", errorMessage);
        }
        response.sendRedirect(request.getContextPath() + "/admin/allusers");
    }
}
