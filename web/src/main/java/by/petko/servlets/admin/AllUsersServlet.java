package by.petko.servlets.admin;

import by.petko.UserService;
import by.petko.entity.UserEntity;
import org.hibernate.HibernateException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

@WebServlet(name = "allusers", urlPatterns = "/admin/allusers")
public class AllUsersServlet extends HttpServlet {
    private static UserService userService = UserService.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            String sortBy = request.getParameter("sortBy");
            String orderType = request.getParameter("orderType");
            String filterRemove = request.getParameter("filterRemove");
            HashMap<String, String> filters = (HashMap<String, String>) session.getAttribute("filters");
            filters = filters == null ? new HashMap<>() : filters;
            if (filterRemove != null) filters.remove(filterRemove);
            session.setAttribute("filters", filters);

            if (sortBy != null) session.setAttribute("sortBy", sortBy);
            else sortBy = (String) session.getAttribute("sortBy");
            if (orderType != null) session.setAttribute("orderType", orderType);
            else orderType = (String) session.getAttribute("orderType");
            List<UserEntity> usersList = userService.getAll(sortBy, orderType, filters);

            session.setAttribute("userList", usersList);
            session.setAttribute("totalToShow", usersList.size());
            session.setAttribute("total", userService.getTotalCount());
        } catch (Exception e) {
            String errorMessage = e.getMessage();
            if (errorMessage == null) {
                request.setAttribute("errorMessage", "Some problem with DB connection occurred.");
            } else request.setAttribute("errorMessage", errorMessage);
        }
        request.getServletContext().getRequestDispatcher("/WEB-INF/jsp/allusers.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            String filterSet = request.getParameter("filterSet");
            String filterText = request.getParameter("filterText");
            HashMap<String, String> filters = (HashMap<String, String>) session.getAttribute("filters");
            if (filterSet != null && filterText != null && !filterText.equals("")) {
                filters.put(filterSet, filterText);
            }
            List<UserEntity> usersList = userService.getAll(null, null, filters);
            session.setAttribute("totalToShow", usersList.size());
            session.setAttribute("usersList", usersList);
        } catch (Exception e) {
//            e.printStackTrace();
            String errorMessage = e.getMessage();
            if (errorMessage == null) {
                request.setAttribute("errorMessage", "Some problem with DB connection occurred.");
            } else request.setAttribute("errorMessage", errorMessage);
        }
        response.sendRedirect(request.getContextPath() + "/admin/allusers");
    }
}
