package com.stn.helpers;

import com.stn.pojo.Log;
import com.stn.utils.DBConnection;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LogHelper extends DBConnection {

    public void addLog(String content, int type) throws SQLException, ClassNotFoundException {
        query = "INSERT INTO logs(content,type) VALUES (?,?)";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(this.getHost(), this.getUser(), this.getPassword());
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, content);
            preparedStatement.setInt(2, type);
            preparedStatement.executeUpdate();
        } finally {
            if (preparedStatement != null)
                preparedStatement.close();
            if (connection != null)
                connection.close();
        }
    }

    public List<Log> getLogs(int pageNumber) throws ClassNotFoundException, SQLException {
        List<Log> logs = new ArrayList<Log>();
        int itemsPerPage = 15;

        query = "SELECT id,content,type,date FROM logs ORDER BY 1 DESC LIMIT ?,?";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(this.getHost(), this.getUser(), this.getPassword());
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1,itemsPerPage * pageNumber - itemsPerPage);
            preparedStatement.setInt(2,itemsPerPage);
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next()) {
                Log logtemp = new Log();
                logtemp.setIdLog(resultSet.getInt(1));
                logtemp.setContent(resultSet.getString(2));
                logtemp.setType(resultSet.getInt(3));
                logtemp.setDate(resultSet.getTimestamp(4));
                logs.add(logtemp);
            }
        } finally {
            if (preparedStatement != null)
                preparedStatement.close();
            if (connection != null)
                connection.close();
        }

        return logs;
    }

    public List<Log> getLogsbySearch(int pageNumber,String text) throws ClassNotFoundException, SQLException {
        List<Log> logs = new ArrayList<Log>();
        int itemsPerPage = 15;

        query = "SELECT id,content,type,date FROM logs WHERE content LIKE ? ORDER BY 1 DESC LIMIT ?,?";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(this.getHost(), this.getUser(), this.getPassword());
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1,"%"+text+"%");
            preparedStatement.setInt(2,itemsPerPage * pageNumber - itemsPerPage);
            preparedStatement.setInt(3,itemsPerPage);
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next()) {
                Log logtemp = new Log();
                logtemp.setIdLog(resultSet.getInt(1));
                logtemp.setContent(resultSet.getString(2));
                logtemp.setType(resultSet.getInt(3));
                logtemp.setDate(resultSet.getTimestamp(4));
                logs.add(logtemp);
            }
        } finally {
            if (preparedStatement != null)
                preparedStatement.close();
            if (connection != null)
                connection.close();
        }

        return logs;
    }

    public int countLogs() throws ClassNotFoundException, SQLException {
        int cnt = 0;

        query = "SELECT COUNT(*) FROM logs";

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

    public int countLogsbySearch(String text) throws ClassNotFoundException, SQLException {
        int cnt = 0;

        query = "SELECT COUNT(*) FROM logs WHERE content LIKE ?";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(this.getHost(), this.getUser(), this.getPassword());
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1,"%"+text+"%");
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

}
