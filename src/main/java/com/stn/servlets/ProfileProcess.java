package com.stn.servlets;

import com.stn.helpers.LogHelper;
import com.stn.helpers.UserHelper;
import com.stn.pojo.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/ProfileProcess")
public class ProfileProcess extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("/index.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();

        String error ="";
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        int userId = Integer.parseInt(request.getParameter("userid"));
        int userClass;
        if(request.getParameter("userclass") != null) {
            userClass = Integer.parseInt(request.getParameter("userclass"));
        } else {
            userClass = -1;
        }

        int donor = Integer.parseInt(request.getParameter("donor"));

        UserHelper userHelper = new UserHelper();
        LogHelper logHelper = new LogHelper();

        if((int) userClass < 0) {
            error = "<b style='color: red; display: inline'>No userclass selected!</b>";
        } else {

            try {
                User user = userHelper.getUserInfo(userId);
                int idUser = (int) session.getAttribute("userId");
                User user2 = userHelper.getUserInfo(idUser);

                if(userClass == 0) {
                    String text = "User <a target='_blank' href='/userdetails.jsp?id="+
                            userId+"' style='text-decoration: none'><b style='color: "+userHelper.classColor(user.getUserClass())+"'>"+user.getUserName()+
                            "</b></a> was disabled ( <img src='/img/disabled_small.png' alt='Disabled' style='display: inline; vertical-align: bottom; ' title='Disabled'>) by <a target='_blank' href='/userdetails.jsp?id="+idUser+
                            "' style='text-decoration: none'><b style='color: "+userHelper.classColor(user2.getUserClass())+"'>"+user2.getUserName()+"</b></a>.";
                    logHelper.addLog(text,3);
                } else if(userClass > user.getUserClass()) {
                    String text = "User <a target='_blank' href='/userdetails.jsp?id="+
                            userId+"' style='text-decoration: none'><b style='color: "+userHelper.classColor(user.getUserClass())+"'>"+user.getUserName()+
                            "</b></a> was promoted to <b style='color: "+userHelper.classColor(userClass)+"'>"+userHelper.className(userClass)+"</b> by <a target='_blank' href='/userdetails.jsp?id="+idUser+
                            "' style='text-decoration: none'><b style='color: "+userHelper.classColor(user2.getUserClass())+"'>"+user2.getUserName()+"</b></a>.";
                    logHelper.addLog(text,3);
                } else if(userClass < user.getUserClass()) {
                    String text = "User <a target='_blank' href='/userdetails.jsp?id="+
                            userId+"' style='text-decoration: none'><b style='color: "+userHelper.classColor(user.getUserClass())+"'>"+user.getUserName()+
                            "</b></a> was demoted to <b style='color: "+userHelper.classColor(userClass)+"'>"+userHelper.className(userClass)+"</b> by <a target='_blank' href='/userdetails.jsp?id="+idUser+
                            "' style='text-decoration: none'><b style='color: "+userHelper.classColor(user2.getUserClass())+"'>"+user2.getUserName()+"</b></a>.";
                    logHelper.addLog(text,3);
                }

                userHelper.updateProfile(userId,userClass,donor);
            } catch (ClassNotFoundException | SQLException e) {
                out.println(e);
                return;
            }

            error = "<b style='color: green; display: inline'>Profile updated!</b>";

        }


        String url = "userdetails.jsp?id=" + userId;
        session.setAttribute("error2",error);
        response.sendRedirect(url);
    }
}
