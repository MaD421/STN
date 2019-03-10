package com.stn.servlets;

import com.stn.helpers.CommentsHelper;
import com.stn.helpers.UserHelper;
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

@WebServlet("/AddComment")
public class AddComment extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
        HttpSession session=request.getSession();
        PrintWriter out=response.getWriter();

        CommentsHelper commentsHelper=new CommentsHelper();
        UserHelper userHelper = new UserHelper();
        String error="";
        String url="";

        int idPost = Integer.parseInt(request.getParameter("idPost"));
        int page = Integer.parseInt(request.getParameter("page"));
        int idUser = (int) session.getAttribute("userId");
        String body = request.getParameter("body");

        int commentId = 0;

        if(Validator.isEmpty(body)){
            error="<br/><b>Nu ai scris nimic</b>";
        }
        else{
            if(idPost>0)
            try {
                commentId = commentsHelper.addComment(idPost,idUser,body);
                userHelper.updatePosts(idUser);
                url="/view_topic.jsp?id="+idPost+"&p="+page+"#add_comment";
            } catch (SQLException|ClassNotFoundException e){
                out.println(e);
            }
        }
        session.setAttribute("error",error);
        response.sendRedirect(url);
    }
}
