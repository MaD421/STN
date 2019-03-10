package com.stn.helpers;

import com.mysql.jdbc.Statement;
import com.stn.pojo.Topic;
import com.stn.pojo.User;
import com.stn.utils.DBConnection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TopicHelper extends DBConnection {

    public int addTopic(String title, String body, int idUser, int idGroup) throws SQLException, ClassNotFoundException {
        int last_inserted_id = 0;

        query = "INSERT INTO topics(Name,Author,GroupId) VALUES (?,?,?)";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(this.getHost(), this.getUser(), this.getPassword());
            preparedStatement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1, title);
            preparedStatement.setInt(2, idUser);
            preparedStatement.setInt(3, idGroup);
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

        query = "INSERT INTO comments(IdPost,IdUser,Continut) VALUES (?,?,?)";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(this.getHost(), this.getUser(), this.getPassword());
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, last_inserted_id);
            preparedStatement.setInt(2, idUser);
            preparedStatement.setString(3, body);
            preparedStatement.executeUpdate();
        } finally {
            if (preparedStatement != null)
                preparedStatement.close();
            if (connection != null)
                connection.close();
        }

        return last_inserted_id;
    }

    public Topic getTopic(int id) throws ClassNotFoundException, SQLException {
        Topic t = new Topic();

        query = "SELECT TopicId,Name,GroupId,t.Author,u.Username,u.Class, (SELECT COUNT(*) FROM comments WHERE IdPost = TopicId)" +
                " FROM topics t JOIN users u ON t.Author = u.Id  WHERE TopicId = ?";


        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(this.getHost(), this.getUser(), this.getPassword());
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, id);
            resultSet = preparedStatement.executeQuery();
            resultSet.next();
            t.setTopicId(resultSet.getInt(1));
            t.setName(resultSet.getString(2));
            t.setGroupId(resultSet.getInt(3));
            t.setAuthorId(resultSet.getInt(4));
            t.setAuthorName(resultSet.getString(5));
            t.setAuthorClass(resultSet.getInt(6));
            t.setTotalposts(resultSet.getInt(7));
        } finally {
            if (preparedStatement != null)
                preparedStatement.close();
            if (connection != null)
                connection.close();
        }

        return t;
    }

    public List<Topic> getTopics(int catId,int pageNumber) throws ClassNotFoundException, SQLException {
        List<Topic> topic = new ArrayList<Topic>();
        int itemsPerPage = 25;

        query = "SELECT TopicId,Name,GroupId,t.Author,u.Username,u.Class, (SELECT COUNT(*) FROM comments WHERE IdPost = TopicId),Views" +
                ",(SELECT Data FROM comments c WHERE IdPost = TopicId ORDER BY c.Id DESC LIMIT 1)" +
                ",(SELECT uc.Id FROM comments c JOIN users uc ON c.IdUser = uc.Id WHERE IdPost = TopicId ORDER BY c.Id DESC LIMIT 1)" +
                ",(SELECT ud.Username FROM comments c JOIN users ud ON c.IdUser = ud.Id WHERE IdPost = TopicId ORDER BY c.Id DESC LIMIT 1)" +
                ",(SELECT ue.Class FROM comments c JOIN users ue ON c.IdUser = ue.Id WHERE IdPost = TopicId ORDER BY c.Id DESC LIMIT 1)" +
                " FROM topics t JOIN users u ON t.Author = u.Id  WHERE GroupId = ? ORDER BY 9 DESC LIMIT ?,?";

        String query2 = "";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(this.getHost(), this.getUser(), this.getPassword());
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, catId);
            preparedStatement.setInt(2,itemsPerPage * pageNumber - itemsPerPage);
            preparedStatement.setInt(3,itemsPerPage);
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next()) {
                Topic t = new Topic();
                User user = new User();
                t.setTopicId(resultSet.getInt(1));
                t.setName(resultSet.getString(2));
                t.setGroupId(resultSet.getInt(3));
                t.setAuthorId(resultSet.getInt(4));
                t.setAuthorName(resultSet.getString(5));
                t.setAuthorClass(resultSet.getInt(6));
                t.setTotalposts(resultSet.getInt(7));
                t.setViews(resultSet.getInt(8));
                t.setLastPostDate(resultSet.getTimestamp(9));

                user.setId(resultSet.getInt(10));
                user.setUserName(resultSet.getString(11));
                user.setUserClass(resultSet.getInt(12));
                t.setLastPoster(user);

                topic.add(t);
            }
        } finally {
            if (preparedStatement != null)
                preparedStatement.close();
            if (connection != null)
                connection.close();
        }

        return topic;
    }

    public void deleteTopic(int idTopic) throws ClassNotFoundException, SQLException {
        query = "DELETE FROM topics WHERE TopicId = ?";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(this.getHost(), this.getUser(), this.getPassword());
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, idTopic);
            preparedStatement.executeUpdate();
        } finally {
            if (preparedStatement != null)
                preparedStatement.close();
            if (connection != null)
                connection.close();
        }
    }

    public int countTotalTopics() throws ClassNotFoundException, SQLException {
        int cnt = 0;

        query = "SELECT COUNT(*) FROM topics";

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

    public int countTopics(int idCategory) throws ClassNotFoundException, SQLException {
        int cnt = 0;

        query = "SELECT COUNT(*) FROM topics WHERE GroupId = ?";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(this.getHost(), this.getUser(), this.getPassword());
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1,idCategory);
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

    public void updateView(int idTopic) throws SQLException, ClassNotFoundException {
        query = "UPDATE topics SET Views = Views + 1 WHERE TopicId = ?";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(this.getHost(), this.getUser(), this.getPassword());
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1,idTopic);
            preparedStatement.executeUpdate();
        } finally {
            if (preparedStatement != null)
                preparedStatement.close();
            if (connection != null)
                connection.close();
        }
    }

    public void updateTopic(Topic topic) throws SQLException, ClassNotFoundException {
        query = "UPDATE topics SET Name = ? , GroupId = ? WHERE TopicId = ?";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(this.getHost(), this.getUser(), this.getPassword());
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1,topic.getName());
            preparedStatement.setInt(2,topic.getGroupId());
            preparedStatement.setInt(3,topic.getTopicId());
            preparedStatement.executeUpdate();
        } finally {
            if (preparedStatement != null)
                preparedStatement.close();
            if (connection != null)
                connection.close();
        }
    }

}
