package com.stn.helpers;

import com.mysql.jdbc.Statement;
import com.stn.pojo.Comments;
import com.stn.utils.DBConnection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CommentsHelper extends DBConnection {
    public List<Comments> getComments(int idPost,int pageNumber) throws ClassNotFoundException, SQLException {
        List<Comments> comm = new ArrayList<Comments>();
        int itemsPerPage = 25;

        query = "SELECT n.Id,Continut,Data,IdPost,n.IdUser,Username,Class,LastEdit FROM comments n " +
                "JOIN users u ON u.Id = n.IdUser " +
                "WHERE n.IdPost = ? ORDER BY Data LIMIT ?,?";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(this.getHost(), this.getUser(), this.getPassword());
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1,idPost);
            preparedStatement.setInt(2,itemsPerPage * pageNumber - itemsPerPage);
            preparedStatement.setInt(3,itemsPerPage);
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next()) {
                Comments commtemp = new Comments();
                commtemp.setId(resultSet.getInt(1));
                commtemp.setCont(resultSet.getString(2));
                commtemp.setDop(resultSet.getTimestamp(3));
                commtemp.setIdPost(resultSet.getInt(4));
                commtemp.setIdUser(resultSet.getInt(5));
                commtemp.setUsername(resultSet.getString(6));
                commtemp.setUserClass(resultSet.getInt(7));
                commtemp.setLastEdit(resultSet.getTimestamp(8));
                comm.add(commtemp);
            }
        } finally {
            if (preparedStatement != null)
                preparedStatement.close();
            if (connection != null)
                connection.close();
        }

        return comm;
    }

    public int countComments(int idTopic) throws ClassNotFoundException, SQLException {
        int cnt = 0;

        query = "SELECT COUNT(*) FROM comments WHERE IdPost = ?";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(this.getHost(), this.getUser(), this.getPassword());
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1,idTopic);
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next()) {
                cnt = resultSet.getInt(1);
            }
        } finally {
            if (preparedStatement != null)
                preparedStatement.close();
            if (connection != null)
                connection.close();
        }

        return cnt;

    }

    public int countTotalComments() throws ClassNotFoundException, SQLException {
        int cnt = 0;

        query = "SELECT COUNT(*) FROM comments";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(this.getHost(), this.getUser(), this.getPassword());
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next()) {
                cnt = resultSet.getInt(1);
            }
        } finally {
            if (preparedStatement != null)
                preparedStatement.close();
            if (connection != null)
                connection.close();
        }

        return cnt;

    }

    public Comments getComment(Integer idComment)throws ClassNotFoundException, SQLException{
        Comments comm=new Comments();

        query="SELECT n.Id,Continut,Data,IdPost,IdUser,Username,Class,n.LastEdit FROM comments n JOIN users u ON n.IdUser = u.Id WHERE n.Id=?";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(this.getHost(), this.getUser(), this.getPassword());
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1,idComment);
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next()) {
                Comments commtemp = new Comments();
                commtemp.setId(resultSet.getInt(1));
                commtemp.setCont(resultSet.getString(2));
                commtemp.setDop(resultSet.getTimestamp(3));
                commtemp.setIdPost(resultSet.getInt(4));
                commtemp.setIdUser(resultSet.getInt(5));
                commtemp.setUsername(resultSet.getString(6));
                commtemp.setUserClass(resultSet.getInt(7));
                commtemp.setLastEdit(resultSet.getTimestamp(8));
                comm=commtemp;
            }
        } finally {
            if (preparedStatement != null)
                preparedStatement.close();
            if (connection != null)
                connection.close();
        }

        return comm;
    }

    public int addComment(Integer idPost, Integer idUser, String body) throws SQLException, ClassNotFoundException {
        int last_inserted_id = 0;
        java.sql.Timestamp date = new java.sql.Timestamp((new java.util.Date().getTime()));
        query = "INSERT INTO comments(IdPost,IdUser,Continut,Data) VALUES(?,?,?,?)";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(this.getHost(), this.getUser(), this.getPassword());
            preparedStatement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setInt(1, idPost);
            preparedStatement.setInt(2, idUser);
            preparedStatement.setString(3, body);
            preparedStatement.setTimestamp(4, date);
            preparedStatement.executeUpdate();
            resultSet = preparedStatement.getGeneratedKeys();
            resultSet.next();
            last_inserted_id = resultSet.getInt(1);
        } finally {
            if (preparedStatement != null)
                preparedStatement.close();
            if (connection != null)
                connection.close();
        }
        return last_inserted_id;
    }

    public void deleteComment(Integer id) throws SQLException, ClassNotFoundException {
        query = "DELETE FROM comments WHERE Id=?";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(this.getHost(), this.getUser(), this.getPassword());
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } finally {
            if (preparedStatement != null)
                preparedStatement.close();
            if (connection != null)
                connection.close();
        }
    }

    public void editComment(Integer id, String body) throws SQLException, ClassNotFoundException {
        java.sql.Timestamp date = new java.sql.Timestamp((new java.util.Date().getTime()));
        query = "UPDATE comments SET Continut=?,LastEdit=? WHERE Id=?";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(this.getHost(), this.getUser(), this.getPassword());
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, body);
            preparedStatement.setTimestamp(2, date);
            preparedStatement.setInt(3, id);
            preparedStatement.executeUpdate();
        } finally {
            if (preparedStatement != null)
                preparedStatement.close();
            if (connection != null)
                connection.close();
        }
    }

}
