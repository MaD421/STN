package com.stn.servlets;

import com.stn.helpers.CommentsHelper;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/EditComment")
public class EditComment extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();

        int idPost = Integer.parseInt(request.getParameter("idp"));
        int page = Integer.parseInt(request.getParameter("page"));

        String url = "/view_topic.jsp?id="+idPost+"&p="+page;
        response.setContentType("text/html");
        CommentsHelper commHelper = new CommentsHelper();

        int idComment = Integer.parseInt(request.getParameter("id"));

        try {
            commHelper.deleteComment(idComment);
        } catch (SQLException | ClassNotFoundException e) {
            out.println(e);
        }

        response.sendRedirect(url);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PrintWriter out = response.getWriter();

        int idTopic = Integer.parseInt(request.getParameter("idTopic"));
        int idComment = Integer.parseInt(request.getParameter("comm_id_temp"));
        int page = Integer.parseInt(request.getParameter("page"));
        String body = "";
        body = request.getParameter("comm_body_temp");

        String url = "/view_topic.jsp?id="+idTopic+"&p="+page+"#"+idComment;
        response.setContentType("text/html");

        CommentsHelper commHelper = new CommentsHelper();
        try {
            commHelper.editComment(idComment,body);
        } catch (SQLException | ClassNotFoundException e) {
            out.println(e);
        }

        response.sendRedirect(url);
    }
}
