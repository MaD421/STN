package com.stn.helpers;

import com.stn.pojo.Category;
import com.stn.pojo.Topic;
import com.stn.pojo.User;
import com.stn.utils.DBConnection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryHelper extends DBConnection {

    public void addCategory(String categorie, String descriere, int idFacultate, int idSerie, int idGrupa, int pinned) throws ClassNotFoundException, SQLException {
        query = "INSERT INTO categories(categorie, descriere, idFacultate, idSerie, idGrupa, Pinned) VALUES(?,?,?,?,?,?)";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(this.getHost(), this.getUser(), this.getPassword());
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, categorie);
            preparedStatement.setString(2, descriere);
            preparedStatement.setInt(3, idFacultate);
            preparedStatement.setInt(4, idSerie);
            preparedStatement.setInt(5, idGrupa);
            preparedStatement.setInt(6, pinned);
            preparedStatement.executeUpdate();
        } finally {
            if (preparedStatement != null)
                preparedStatement.close();
            if (connection != null)
                connection.close();
        }
    }

    public List<Category> getCategories(int idFacultate) throws SQLException {

        List<Category> category1 = new ArrayList<>();

        query = "SELECT ct.IdCat,Categorie,Pinned,Descriere,ct.idFacultate, ct.idSerie, ct.idGrupa, (SELECT COUNT(*) FROM topics WHERE GroupId = IdCat)," +
                "(SELECT COUNT(*) FROM comments WHERE IdPost IN (SELECT TopicId FROM topics WHERE GroupId = IdCat)),t.TopicId,t.Name,c.Data,us.Id,us.Username,us.Class " +
                "FROM categories ct " +
                "LEFT JOIN (SELECT t2.GroupId, MAX(c2.Id) AS Id " +
                "           FROM comments c2 " +
                "           JOIN topics t2 ON c2.IdPost = t2.TopicId " +
                "           GROUP BY t2.GroupId) maxp ON ct.IdCat = maxp.GroupId " +
                "LEFT JOIN comments c ON maxp.Id = c.Id " +
                "LEFT JOIN topics t ON t.GroupId = ct.IdCat AND c.IdPost = t.TopicId " +
                "LEFT JOIN users us ON us.Id = c.IdUser " +
                "WHERE ct.idFacultate = ? " +
                "ORDER BY ct.IdCat;";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(this.getHost(), this.getUser(), this.getPassword());
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, idFacultate);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Category category = new Category();
                category.setId(resultSet.getInt(1));
                category.setCategorie(resultSet.getString(2));
                category.setPinned(resultSet.getInt(3));
                category.setDescriere(resultSet.getString(4));
                category.setIdFacultate(idFacultate);
                category.setIdSerie(resultSet.getInt(6));
                category.setIdGrupa(resultSet.getInt(7));
                category.setTotalTopics(resultSet.getInt(8));
                category.setTotalPosts(resultSet.getInt(9));

                Topic topic = new Topic();
                User user = new User();
                String topicId = resultSet.getString(10);
                if(topicId != null) {
                    topic.setTopicId(resultSet.getInt(10));
                    topic.setName(resultSet.getString(11));
                    category.setLastPostDate(resultSet.getTimestamp(12));
                    user.setId(resultSet.getInt(13));
                    user.setUserName(resultSet.getString(14));
                    user.setUserClass(resultSet.getInt(15));
                }

                category.setLastPoster(user);
                category.setLastTopic(topic);
                category1.add(category);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            if (preparedStatement != null)
                preparedStatement.close();
            if (connection != null)
                connection.close();
            if (resultSet != null)
                resultSet.close();
        }
        return category1;
    }

    public Category getCategoryByTopic(int idCat,int idFacultate) throws SQLException {

        Category category = new Category();

        query = "SELECT IdCat, categorie, pinned, descriere, idFacultate, idSerie, idGrupa, (SELECT COUNT(*) FROM topics WHERE GroupId = IdCat)," +
                "(SELECT COUNT(*) FROM comments WHERE IdPost IN (SELECT TopicId FROM topics WHERE GroupId = IdCat)) " +
                "FROM categories " +
                "WHERE idFacultate = ? AND IdCat = ?";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(this.getHost(), this.getUser(), this.getPassword());
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, idFacultate);
            preparedStatement.setInt(2,idCat);
            resultSet = preparedStatement.executeQuery();
            resultSet.next();
            category.setId(resultSet.getInt(1));
            category.setCategorie(resultSet.getString(2));
            category.setPinned(resultSet.getInt(3));
            category.setDescriere(resultSet.getString(4));
            category.setIdFacultate(idFacultate);
            category.setIdSerie(resultSet.getInt(6));
            category.setIdGrupa(resultSet.getInt(7));
            category.setTotalTopics(resultSet.getInt(8));
            category.setTotalPosts(resultSet.getInt(9));
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            if (preparedStatement != null)
                preparedStatement.close();
            if (connection != null)
                connection.close();
            if (resultSet != null)
                resultSet.close();
        }

        return category;

    }

    public int countTotalCategories() throws ClassNotFoundException, SQLException {
        int cnt = 0;

        query = "SELECT COUNT(*) FROM categories";

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

    public Category getCategory(int idCat) throws SQLException {

        Category category = new Category();

        query = "SELECT IdCat, categorie, pinned, descriere, idFacultate, idSerie, idGrupa, (SELECT COUNT(*) FROM topics WHERE GroupId = IdCat)," +
                "(SELECT COUNT(*) FROM comments WHERE IdPost IN (SELECT TopicId FROM topics WHERE GroupId = IdCat)) " +
                "FROM categories " +
                "WHERE IdCat = ?";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(this.getHost(), this.getUser(), this.getPassword());
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1,idCat);
            resultSet = preparedStatement.executeQuery();
            resultSet.next();
            category.setId(resultSet.getInt(1));
            category.setCategorie(resultSet.getString(2));
            category.setPinned(resultSet.getInt(3));
            category.setDescriere(resultSet.getString(4));
            category.setIdSerie(resultSet.getInt(6));
            category.setIdGrupa(resultSet.getInt(7));
            category.setTotalTopics(resultSet.getInt(8));
            category.setTotalPosts(resultSet.getInt(9));
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            if (preparedStatement != null)
                preparedStatement.close();
            if (connection != null)
                connection.close();
            if (resultSet != null)
                resultSet.close();
        }

        return category;

    }

}
