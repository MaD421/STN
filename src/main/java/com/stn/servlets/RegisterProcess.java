package com.stn.servlets;

import com.stn.utils.DBConnection;
import com.stn.utils.PasswordHelper;
import com.stn.utils.Validator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.*;

@WebServlet("/RegisterProcess")
public class RegisterProcess extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String error ="";
        String url = "index.jsp";
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        //Setam toti parametrii pe care ii primim din form
        String user = request.getParameter("user");
        String password1 = request.getParameter("password1");
        String password2 = request.getParameter("password2");
        String email = request.getParameter("email");
        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String terms = request.getParameter("terms");
        String faq= request.getParameter("faq");

        String encryptedPassword = "";
        byte[] salt = new byte[16];
        Boolean queryResult = false;

        if(Validator.isEmpty(user, password1, password2, email, firstName, lastName)) {
            error = "You must fill all the requiered fields!";
            url = "register.jsp";
        }
        else if(!Validator.isEmail(email)) { //verificare email daca este valid
            error = "Invalid email addres!";
            url = "register.jsp";
        }
        else if(!password1.equals(password2)) {
            error = "The passwords are not matching!";
            url = "register.jsp";
        }
        else if(terms == null || faq == null ) { // verificare daca au fost bifate casutele cu terms si faq
            error = "You must agree to the conditions!";
            url = "register.jsp";
        } else {
            PreparedStatement preparedStatement = null;
            Connection connection = null;
            DBConnection db = new DBConnection();
            ResultSet rs = null;
            String query = "SELECT 1 FROM users WHERE Username = ? OR Email = ?";

            //Verificare daca username-ul sau email-ul se gaseste deja in baza de date
            try {
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection(db.getHost(), db.getUser(), db.getPassword());
                preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, user);
                preparedStatement.setString(2, email);
                rs = preparedStatement.executeQuery();
                if (rs.next()) {
                    queryResult = true;
                }
            } catch (ClassNotFoundException | SQLException e) {
                out.println(e);
                return;
            } finally {
                try {
                    if (preparedStatement != null)
                        preparedStatement.close();
                    if (connection != null)
                        connection.close();
                    if (rs != null)
                        rs.close();
                } catch (SQLException e) {
                    out.println(e);
                }
            }

            if(!queryResult) { //daca nu avem rezultate,inseamna ca user-ul sau parola nu exista in baza de date
                //Introducere utilizator in baza de date
                query = "INSERT INTO users(Username, Password, Salt, Email, FirstName, LastName) VALUES (?,?,?,?,?,?)";

                PasswordHelper passwordHelper = new PasswordHelper();
                try {
                    passwordHelper.generateSalt();
                    salt = passwordHelper.getSalt();
                    encryptedPassword = passwordHelper.getPassword(password1);
                } catch (NoSuchAlgorithmException e) {
                    out.println(e);
                }

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    connection = DriverManager.getConnection(db.getHost(), db.getUser(), db.getPassword());
                    preparedStatement = connection.prepareStatement(query);
                    preparedStatement.setString(1, user);
                    preparedStatement.setString(2, encryptedPassword);
                    preparedStatement.setBytes(3, salt);
                    preparedStatement.setString(4, email);
                    preparedStatement.setString(5, firstName);
                    preparedStatement.setString(6, lastName);
                    preparedStatement.executeUpdate();
                } catch (ClassNotFoundException | SQLException e) {
                    out.println(e);
                    return;
                } finally {
                    try {
                        if (preparedStatement != null)
                            preparedStatement.close();
                        if (connection != null)
                            connection.close();
                    } catch (SQLException e) {
                        out.println(e);
                    }
                }
            }
            else
            {
                error = "Username or email already in use!";
                url = "register.jsp";
            }
        }

        //Redirectionare catre o anumita pagina (este data de string-ul url)
        request.setAttribute("error", error);
        RequestDispatcher dispatcher = request.getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
}
