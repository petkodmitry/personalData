package by.petko.servlets.user;

import by.petko.entity.ContactData;
import by.petko.entity.UserEntity;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

@WebServlet(name = "user", urlPatterns = "/user")
public class UserServlet extends HttpServlet {

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

                request.getServletContext().getRequestDispatcher("/WEB-INF/jsp/mainuser.jsp").forward(request, response);

            } catch (ParseException e) {
                String errorMessage = e.getMessage();
                if (errorMessage == null) {
                    request.setAttribute("errorMessage", "Couldn't parse a string to date.");
                } else request.setAttribute("errorMessage", errorMessage);
                request.getServletContext().getRequestDispatcher("/WEB-INF/jsp/mainuser.jsp").forward(request, response);
            }
        }
    }
}
