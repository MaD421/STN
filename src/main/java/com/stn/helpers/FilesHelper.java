package com.stn.helpers;

import com.mysql.jdbc.Statement;
import com.stn.pojo.File;
import com.stn.pojo.FileCategory;
import com.stn.pojo.User;
import com.stn.utils.DBConnection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FilesHelper extends DBConnection {

    public int addFile(File file) throws ClassNotFoundException, SQLException {
        int id = 0;

        query = "INSERT INTO files(Name,Description,Link,OwnerId,IdFacultate,FileCategoryId) VALUES (?,?,?,?,?,?)";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(this.getHost(), this.getUser(), this.getPassword());
            preparedStatement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1, file.getName());
            preparedStatement.setString(2, file.getDescription());
            preparedStatement.setString(3, file.getLink());
            preparedStatement.setInt(4, file.getUser().getId());
            preparedStatement.setInt(5, file.getIdFacultate());
            preparedStatement.setInt(6,file.getFileCategory().getFileCategoryId());
            preparedStatement.executeUpdate();
            resultSet = preparedStatement.getGeneratedKeys();
            resultSet.next();
            id = resultSet.getInt(1);
        } finally {
            if (preparedStatement != null)
                preparedStatement.close();
            if (connection != null)
                connection.close();
        }
        return id;
    }

    public List<File> getFiles(int idFacultate,int pageNumber) throws ClassNotFoundException, SQLException {
        List<File> files = new ArrayList<File>();
        int itemsPerPage = 30;

        query = "SELECT f.FileId,f.Name,f.Date,Views,fc.FileCategoryId,fc.Name,fc.Picture,u.Id,u.Username,u.Class " +
                "FROM files f " +
                "JOIN files_categories fc ON f.FileCategoryId = fc.FileCategoryId " +
                "JOIN users u ON f.OwnerId = u.Id " +
                "WHERE f.IdFacultate = ? ORDER BY 1 DESC LIMIT ?,?";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(this.getHost(), this.getUser(), this.getPassword());
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1,idFacultate);
            preparedStatement.setInt(2,itemsPerPage * pageNumber - itemsPerPage);
            preparedStatement.setInt(3,itemsPerPage);
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next()) {
                File file = new File();
                FileCategory fileCategory = new FileCategory();
                User user = new User();

                file.setFileId(resultSet.getInt(1));
                file.setName(resultSet.getString(2));
                file.setDate(resultSet.getTimestamp(3));
                file.setViews(resultSet.getInt(4));

                fileCategory.setFileCategoryId(resultSet.getInt(5));
                fileCategory.setName(resultSet.getString(6));
                fileCategory.setPicture(resultSet.getString(7));
                file.setFileCategory(fileCategory);

                user.setId(resultSet.getInt(8));
                user.setUserName(resultSet.getString(9));
                user.setUserClass(resultSet.getInt(10));
                file.setUser(user);
                files.add(file);
            }
        } finally {
            if (preparedStatement != null)
                preparedStatement.close();
            if (connection != null)
                connection.close();
        }

        return files;
    }

    public int countFiles(int idFacultate) throws ClassNotFoundException, SQLException {
        int cnt = 0;

        query = "SELECT COUNT(*) FROM files WHERE IdFacultate = ?";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(this.getHost(), this.getUser(), this.getPassword());
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1,idFacultate);
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

    public List<File> getFilesBySearch(int idFacultate,int pageNumber,String text,int searchType,int category) throws ClassNotFoundException, SQLException {
        List<File> files = new ArrayList<File>();
        int itemsPerPage = 30;

        query = "SELECT f.FileId,f.Name,f.Date,Views,fc.FileCategoryId,fc.Name,fc.Picture,u.Id,u.Username,u.Class " +
                "FROM files f " +
                "JOIN files_categories fc ON f.FileCategoryId = fc.FileCategoryId " +
                "JOIN users u ON f.OwnerId = u.Id " +
                "WHERE f.IdFacultate = ? ";
                if(searchType == 1)
                    query = query + "AND f.Name LIKE ? ";
                else
                    query = query + "AND (f.Name LIKE ? OR f.Description LIKE ?) ";
                if(category != 0)
                    query = query + "AND fc.FileCategoryId = ? ";
                query = query + "ORDER BY 1 DESC LIMIT ?,?";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(this.getHost(), this.getUser(), this.getPassword());
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1,idFacultate);
            if(searchType == 1) {
                preparedStatement.setString(2,"%"+text+"%");
                if(category != 0) {
                    preparedStatement.setInt(3,category);
                    preparedStatement.setInt(4,itemsPerPage * pageNumber - itemsPerPage);
                    preparedStatement.setInt(5,itemsPerPage);
                } else {
                    preparedStatement.setInt(3,itemsPerPage * pageNumber - itemsPerPage);
                    preparedStatement.setInt(4,itemsPerPage);
                }
            } else {
                if(category != 0) {
                    preparedStatement.setString(2,"%"+text+"%");
                    preparedStatement.setString(3,"%"+text+"%");
                    preparedStatement.setInt(4,category);
                    preparedStatement.setInt(5,itemsPerPage * pageNumber - itemsPerPage);
                    preparedStatement.setInt(6,itemsPerPage);
                } else {
                    preparedStatement.setString(2,"%"+text+"%");
                    preparedStatement.setString(3,"%"+text+"%");
                    preparedStatement.setInt(4,itemsPerPage * pageNumber - itemsPerPage);
                    preparedStatement.setInt(5,itemsPerPage);
                }
            }
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next()) {
                File file = new File();
                FileCategory fileCategory = new FileCategory();
                User user = new User();

                file.setFileId(resultSet.getInt(1));
                file.setName(resultSet.getString(2));
                file.setDate(resultSet.getTimestamp(3));
                file.setViews(resultSet.getInt(4));

                fileCategory.setFileCategoryId(resultSet.getInt(5));
                fileCategory.setName(resultSet.getString(6));
                fileCategory.setPicture(resultSet.getString(7));
                file.setFileCategory(fileCategory);

                user.setId(resultSet.getInt(8));
                user.setUserName(resultSet.getString(9));
                user.setUserClass(resultSet.getInt(10));
                file.setUser(user);
                files.add(file);
            }
        } finally {
            if (preparedStatement != null)
                preparedStatement.close();
            if (connection != null)
                connection.close();
        }

        return files;
    }

    public int countFilesBySearch(int idFacultate,String text,int searchType,int category) throws ClassNotFoundException, SQLException {
        int cnt = 0;

        query = "SELECT COUNT(*) FROM files WHERE IdFacultate = ? ";

        if(searchType == 1)
            query = query + "AND Name LIKE ?";
        else
            query = query + "AND (Name LIKE ? OR Description LIKE ?)";
        if(category != 0)
            query = query + " AND FileCategoryId = ?";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(this.getHost(), this.getUser(), this.getPassword());
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1,idFacultate);
            preparedStatement.setString(2,"%"+text+"%");
            if(searchType == 2 && category == 0)
                preparedStatement.setString(3,"%"+text+"%");
            else if(searchType == 2 && category != 0){
                preparedStatement.setString(3,"%"+text+"%");
                preparedStatement.setInt(4,category);
            } else if(category != 0) {
                preparedStatement.setInt(3,category);
            }
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

    public int countTotalFiles() throws ClassNotFoundException, SQLException {
        int cnt = 0;

        query = "SELECT COUNT(*) FROM files";

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

    public File getFile(int idFile) throws ClassNotFoundException, SQLException {
        File file = new File();

        query = "SELECT f.Name,Description,Link,f.Date,Views,fc.FileCategoryId,fc.Name,fc.Picture,u.Id,u.Username,u.Class " +
                "FROM files f " +
                "JOIN files_categories fc ON f.FileCategoryId = fc.FileCategoryId " +
                "JOIN users u ON f.OwnerId = u.Id " +
                "WHERE f.FileId = ?";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(this.getHost(), this.getUser(), this.getPassword());
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1,idFile);
            resultSet = preparedStatement.executeQuery();
            resultSet.next();
            FileCategory fileCategory = new FileCategory();
            User user = new User();

            file.setName(resultSet.getString(1));
            file.setDescription(resultSet.getString(2));
            file.setLink(resultSet.getString(3));
            file.setDate(resultSet.getTimestamp(4));
            file.setViews(resultSet.getInt(5));

            fileCategory.setFileCategoryId(resultSet.getInt(6));
            fileCategory.setName(resultSet.getString(7));
            fileCategory.setPicture(resultSet.getString(8));
            file.setFileCategory(fileCategory);

            user.setId(resultSet.getInt(9));
            user.setUserName(resultSet.getString(10));
            user.setUserClass(resultSet.getInt(11));
            file.setUser(user);
        } finally {
            if (preparedStatement != null)
                preparedStatement.close();
            if (connection != null)
                connection.close();
        }

        return file;

    }

    public void updateFile(int idFile,File file) throws SQLException, ClassNotFoundException {
        query = "UPDATE files SET Name = ? , Description = ? , Link = ? , FileCategoryId = ? WHERE FileId = ?";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(this.getHost(), this.getUser(), this.getPassword());
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, file.getName());
            preparedStatement.setString(2, file.getDescription());
            preparedStatement.setString(3, file.getLink());
            preparedStatement.setInt(4, file.getFileCategory().getFileCategoryId());
            preparedStatement.setInt(5,idFile);
            preparedStatement.executeUpdate();
        } finally {
            if (preparedStatement != null)
                preparedStatement.close();
            if (connection != null)
                connection.close();
        }
    }

    public void updateView(int idFile) throws SQLException, ClassNotFoundException {
        query = "UPDATE files SET Views = Views + 1 WHERE FileId = ?";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(this.getHost(), this.getUser(), this.getPassword());
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1,idFile);
            preparedStatement.executeUpdate();
        } finally {
            if (preparedStatement != null)
                preparedStatement.close();
            if (connection != null)
                connection.close();
        }
    }

}
