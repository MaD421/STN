package com.stn.helpers;

import com.stn.pojo.FileCategory;
import com.stn.utils.DBConnection;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FileCategoriesHelper extends DBConnection {

    public List<FileCategory> getFileCategories() throws ClassNotFoundException, SQLException {
        List<FileCategory> categories = new ArrayList<FileCategory>();

        query = "SELECT * FROM files_categories ORDER BY 2 ASC";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(this.getHost(), this.getUser(), this.getPassword());
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next()) {
                FileCategory fileCategory = new FileCategory();
                fileCategory.setFileCategoryId(resultSet.getInt(1));
                fileCategory.setName(resultSet.getString(2));
                fileCategory.setPicture(resultSet.getString(3));
                categories.add(fileCategory);
            }
        } finally {
            if (preparedStatement != null)
                preparedStatement.close();
            if (connection != null)
                connection.close();
        }

        return categories;
    }

}
