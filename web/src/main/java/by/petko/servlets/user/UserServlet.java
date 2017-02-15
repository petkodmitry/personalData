package by.petko.servlets.user;

import by.petko.UserService;
import by.petko.entity.ContactData;
import by.petko.entity.UserEntity;
import org.hibernate.HibernateException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolationException;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

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
        UserEntity user = (UserEntity) request.getSession().getAttribute("user");
        if (user != null) {
            try {
                user.setName(request.getParameter("name"));
                user.setSurname(request.getParameter("surname"));
                user.setMiddleName(request.getParameter("middlename"));
                String birthDate = request.getParameter("birthdate");
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                user.setBirthDate(dateFormat.parse(birthDate));
                ContactData contactData = user.getContactData();
                contactData.setCity(request.getParameter("city"));
                contactData.setStreet(request.getParameter("street"));
                contactData.setBuilding(request.getParameter("building"));
                contactData.setFlat(request.getParameter("flat"));
                contactData.setPhone(request.getParameter("phone"));
                contactData.setEmail(request.getParameter("email"));
                userService.saveOrUpdate(user);
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
