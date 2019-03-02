package com.stn.servlets;

import com.stn.helpers.LogHelper;
import com.stn.helpers.SecurityHelper;
import com.stn.helpers.UserHelper;
import com.stn.pojo.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.*;

@WebServlet("/LoginProcess")
public class LoginProcess extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("login.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String error ="";
        String url = "index.jsp";
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String username = request.getParameter("user");
        String password = request.getParameter("password");
        String rememberMe = request.getParameter("remember_me");
        int userId ;

        HttpSession session = request.getSession();

        SecurityHelper securityHelper = new SecurityHelper();
        LogHelper logHelper = new LogHelper();
        String ip = securityHelper.getClientIpAddress(request);

        if(username.isEmpty() || password.isEmpty()) {
            error = "Fill all the requiered spaces!";
            url = "login.jsp";
        } else if(securityHelper.getAttempts(request) > 9) { // se verifica cate incercari pentru login mai avem
            error = "You are out of login attempts!";
            url = "login.jsp";
        } else {
            UserHelper userHelper = new UserHelper();
            try {
                if( ( userId = userHelper.authenticateUser(username, password) ) > 0 ) {
                    User user = userHelper.getUserInfo(userId);
                    String text = "<div style='color: green; display: inline'>Succesful</div> login attempt on <a target='_blank' href='/userdetails.jsp?id="+
                            userId+"' style='text-decoration: none'><b style='color: "+userHelper.classColor(user.getUserClass())+"'>"+user.getUserName()+
                            "</b></a> from <a target='_blank' class='ui' href='https://db-ip.com/"+ip+"' style='color: #7ADC94;'>"+ip+"</a>.";
                    logHelper.addLog(text,1);
                    session.setAttribute("userId", userId); // setam sesiune pe user-ul curent
                    userHelper.updateIp(userId,ip);
                    if(rememberMe != null) {
                        String token = securityHelper.generateRandomString(28);
                        Cookie cookie = new Cookie("token", token);
                        cookie.setMaxAge(60 * 60 * 24 * 365 );
                        userHelper.updateLoginToken(userId,token,ip);
                        response.addCookie(cookie);
                    }
                } else {
                    if(userId < 0) {
                        error = "Invalid username or password!";
                    } else {
                        error = "Account disabled";
                    }
                    url = "login.jsp";
                    User user = userHelper.getUserInfo(-userId);
                    String text = "<div style='color: red; display: inline'>Failed</div> login attempt on <a target='_blank' href='/userdetails.jsp?id="+-
                            userId+"' style='text-decoration: none'><b style='color: "+userHelper.classColor(user.getUserClass())+"'>"+user.getUserName()+
                            "</b></a> from <a target='_blank' class='ui' href='https://db-ip.com/"+ip+"' style='color: #7ADC94;'>"+ip+"</a>.";
                    logHelper.addLog(text,1);
                    securityHelper.updateAttempts(ip);
                }
            } catch (ClassNotFoundException | SQLException | NoSuchAlgorithmException e) {
                out.println(e);
                return;
            }
        }

        //Redirectionare catre o anumita pagina (este data de string-ul url)
        session.setAttribute("error", error);
        response.sendRedirect(url);
    }
}
