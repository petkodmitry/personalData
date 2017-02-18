package by.petko.servlets.user;

import by.petko.UserService;
import by.petko.entity.UserEntity;
import org.hibernate.HibernateException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.ConstraintViolationException;
import java.io.IOException;

@WebServlet(name = "changepassword", urlPatterns = "/user/changepassword")
public class ChangePasswordServlet extends HttpServlet {
    private static UserService userService = UserService.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getServletContext().getRequestDispatcher("/WEB-INF/jsp/changepassword.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserEntity user = (UserEntity) session.getAttribute("user");
        if (user != null) {
            try {
                String currentPassword = request.getParameter("current");
                String repeatedPassword = request.getParameter("repeat");
                String desiredPassword = request.getParameter("new");
                user = userService.changePassword(user, currentPassword, repeatedPassword, desiredPassword);
                session.setAttribute("user", user);
                request.getServletContext().getRequestDispatcher("/WEB-INF/jsp/mainuser.jsp").forward(request, response);
            } catch (HibernateException | ConstraintViolationException e) {
                String errorMessage = e.getMessage();
                if (errorMessage == null) {
                    if (e instanceof ConstraintViolationException) {
                        request.setAttribute("errorMessage", "Database rejected your request for some reason.");
                    } else request.setAttribute("errorMessage", "Some problem with DB connection occurred.");
                } else request.setAttribute("errorMessage", errorMessage);
                request.getServletContext().getRequestDispatcher("/WEB-INF/jsp/changepassword.jsp").forward(request, response);
            }
        }
    }
}
