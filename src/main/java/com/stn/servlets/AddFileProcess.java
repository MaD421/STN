package com.stn.servlets;

import com.stn.helpers.FileCategoriesHelper;
import com.stn.helpers.FilesHelper;
import com.stn.helpers.UserHelper;
import com.stn.pojo.File;
import com.stn.pojo.FileCategory;
import com.stn.pojo.User;
import com.stn.utils.Validator;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/AddFileProcess")
public class AddFileProcess extends HttpServlet {

    private void setTempFields(HttpServletRequest request,File file) {
        HttpSession session= request.getSession();
        session.setAttribute("fname", file.getName());
        session.setAttribute("fdescription", file.getDescription());
        session.setAttribute("flink", file.getLink());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();

        String error ="";
        String url = "add_file.jsp";
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        UserHelper userHelper = new UserHelper();
        User user = userHelper.getUserInfo((int) session.getAttribute("userId"));

        File file = new File();
        FileCategory fileCategory = new FileCategory();
        fileCategory.setFileCategoryId(Integer.parseInt(request.getParameter("type")));

        file.setName(request.getParameter("name"));
        file.setDescription(request.getParameter("description"));
        file.setLink(request.getParameter("link"));
        file.setIdFacultate(user.getIdFacultate());
        file.setUser(user);
        file.setFileCategory(fileCategory);

        if(Validator.isEmpty(file.getName(),file.getDescription(),file.getLink())) {
            error = "You must fill all the requiered fields!";
            this.setTempFields(request,file);
        } else if(file.getFileCategory().getFileCategoryId() == 0) {
            error = "No category was specified!";
            this.setTempFields(request,file);
        } else {

            FilesHelper filesHelper = new FilesHelper();

            try {
                int id = filesHelper.addFile(file);
                url = "view_file.jsp?id="+id;
            } catch (ClassNotFoundException | SQLException e) {
                out.println(e);
                return;
            }
        }

        session.setAttribute("error", error+"<br/><br/>");
        response.sendRedirect(url);
    }
}
