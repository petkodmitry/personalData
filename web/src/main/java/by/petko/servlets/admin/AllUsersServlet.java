package by.petko.servlets.admin;

import by.petko.UserService;
import by.petko.entity.UserEntity;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "allusers", urlPatterns = "/admin/allusers")
public class AllUsersServlet extends HttpServlet {
    private static UserService userService = UserService.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

//        session.setAttribute("sortBy", "");
//        session.setAttribute("orderType", "");
        request.getServletContext().getRequestDispatcher("/WEB-INF/jsp/allusers.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String filterSet = request.getParameter("filterSet");
        String filterText = request.getParameter("filterText");
//        String filterRemove = request.getParameter("filterRemove");
//        String sortBy = request.getParameter("sortBy");
//        String orderType = request.getParameter("orderType");
        HashMap<String, String> filters = (HashMap<String, String>) session.getAttribute("filters");
//        filters = filters == null ? new HashMap<>() : filters;
        if (filterSet != null && filterText != null && !filterText.equals("")) {
            filters.put(filterSet, filterText);
        }
//        if (filterRemove != null) filters.remove(filterRemove);
//        session.setAttribute("filters", filters);
//        if (sortBy != null) session.setAttribute("sortBy", sortBy);
//        if (orderType != null) session.setAttribute("orderType", orderType);

        List<UserEntity> usersList = userService.getAll(null, null, filters);
        session.setAttribute("totalToShow", usersList.size());
        session.setAttribute("usersList", usersList);
//        request.getServletContext().getRequestDispatcher("/WEB-INF/jsp/allusers.jsp").forward(request, response);
        response.sendRedirect(request.getContextPath() + "/admin/allusers");
    }
}
