package com.stn.servlets;

import com.stn.helpers.FilesHelper;
import com.stn.pojo.File;
import com.stn.pojo.FileCategory;
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

@WebServlet("/EditFileProcess")
public class EditFileProcess extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();

        String error ="";
        int fileId = Integer.parseInt(request.getParameter("fileId"));
        String url = "edit_file.jsp?id=" + fileId;
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        File file = new File();
        FileCategory fileCategory = new FileCategory();
        fileCategory.setFileCategoryId(Integer.parseInt(request.getParameter("type")));

        file.setName(request.getParameter("name"));
        file.setDescription(request.getParameter("description"));
        file.setLink(request.getParameter("link"));
        file.setFileCategory(fileCategory);

        if(Validator.isEmpty(file.getName(),file.getDescription(),file.getLink())) {
            error = "You must fill all the requiered fields!";
        } else if(fileCategory.getFileCategoryId() == 0) {
            error = "No category was specified!";
        } else {

            FilesHelper filesHelper = new FilesHelper();

            try {
                filesHelper.updateFile(fileId,file);
                url = "view_file.jsp?id="+fileId;
            } catch (ClassNotFoundException | SQLException e) {
                out.println(e);
                return;
            }
        }

        session.setAttribute("error", error+"<br/><br/>");
        response.sendRedirect(url);
    }
}
