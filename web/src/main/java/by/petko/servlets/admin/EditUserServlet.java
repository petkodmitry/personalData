package by.petko.servlets.admin;

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

@WebServlet(name = "edit", urlPatterns = "/admin/edit")
public class EditUserServlet extends HttpServlet {
    private static UserService userService = UserService.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("login");
        try {
            UserEntity userEntity = userService.getByLogin(username);
            request.setAttribute("userEntity", userEntity);
            request.setAttribute("roleTypes", UserRole.values());
            request.getServletContext().getRequestDispatcher("/WEB-INF/jsp/edituser.jsp").forward(request, response);
        } catch (HibernateException e) {
            String errorMessage = e.getMessage();
            if (errorMessage == null) {
                request.setAttribute("errorMessage", "Some problem with DB connection occurred.");
            } else request.setAttribute("errorMessage", errorMessage);
            request.getServletContext().getRequestDispatcher("/WEB-INF/jsp/allusers.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
