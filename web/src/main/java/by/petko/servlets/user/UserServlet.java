package by.petko.servlets.user;

import by.petko.UserService;
import by.petko.entity.UserEntity;
import by.petko.handlers.UserHandler;
import org.hibernate.HibernateException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.ConstraintViolationException;
import java.io.IOException;
import java.text.ParseException;

@WebServlet(name = "user", urlPatterns = "/user")
public class UserServlet extends HttpServlet {
    private static UserService userService = UserService.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getServletContext().getRequestDispatcher("/WEB-INF/jsp/mainuser.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserEntity user = (UserEntity) session.getAttribute("user");
        if (user != null) {
            try {
                String login = request.getParameter("login");
                String password = request.getParameter("password");
                String name = request.getParameter("name");
                String surname = request.getParameter("surname");
                String middleName = request.getParameter("middlename");
                String role = request.getParameter("role");
                String department = request.getParameter("department");
                String position = request.getParameter("position");
                String birthDate = request.getParameter("birthdate");
                String entryDate = request.getParameter("entrydate");
                String city = request.getParameter("city");
                String street = request.getParameter("street");
                String building = request.getParameter("building");
                String flat = request.getParameter("flat");
                String phone = request.getParameter("phone");
                String email = request.getParameter("email");

                user = UserHandler.getInstance().fillUserData(user, login, password, name, surname,
                        middleName, role, department, position, birthDate, entryDate, city, street, building, flat, phone, email);

                userService.saveOrUpdate(user);
                session.setAttribute("user", user);
                doGet(request, response);
            } catch (ParseException | HibernateException | ConstraintViolationException e) {
                String errorMessage = e.getMessage();
                if (errorMessage == null) {
                    if (e instanceof ParseException) {
                        request.setAttribute("errorMessage", "Couldn't parse a string to date.");
                    } else if (e instanceof ConstraintViolationException) {
                        request.setAttribute("errorMessage", "Database rejected your request for some reason.");
                    } else request.setAttribute("errorMessage", "Some problem with DB connection occurred.");
                } else request.setAttribute("errorMessage", errorMessage);
                request.getServletContext().getRequestDispatcher("/WEB-INF/jsp/mainuser.jsp").forward(request, response);
            }
        }
    }
}
