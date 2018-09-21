package ru.davidlevi.mysql.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

public class MysqlConnector {
    private static final String URL = "jdbc:mariadb://localhost:33061/mysqldb?"
            + "user=david&password=david&"
            + "disableMariaDbDriver&"
            + "serverTimezone=UTZ&"
            + "useSSL=false&"
            + "autoReconnect=true&maxReconnects=5&"
            + "characterEncoding=UTF-8";
    private static final String USER = "david";
    private static final String PASSWORD = "david";

    private Connection connect = null;
    private Statement statement = null;
    private PreparedStatement preparedStatement = null;
    private ResultSet resultSet = null;

    /**
     * Открыть подключение
     */
    private void connect() {
        try {
            connect = DriverManager.getConnection(URL, USER, PASSWORD);
            if (!connect.isClosed())
                System.out.println("The connection is established");
        } catch (SQLException e1) {
            System.err.println("The connection is not established");
            e1.printStackTrace();
            return;
        } finally {
            if (connect != null) {
                try {
                    connect.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    /**
     * Чтение данных
     *
     * @throws Exception Exception
     */
    public void readData() throws Exception {
        // Установка соединения с БД
        connect();
        // Операторы позволяют выдавать запросы SQL к базе данных
        try {
            // Получение результата SQL-запроса
            statement = connect.createStatement();
            resultSet = statement.executeQuery("select * from mysqldb.comments");
            showResult(resultSet);

            // PreparedStatements может использовать переменные более эффективно
            preparedStatement = connect.prepareStatement("insert into  mysqldb.comments values (default, ?, ?, ?, ? , ?, ?)");
            // "myuser, webpage, datum, summary, COMMENTS from feedback.comments");
            // Нумерация параметров идет с единицы
            preparedStatement.setString(1, "Test");
            preparedStatement.setString(2, "TestEmail");
            preparedStatement.setString(3, "TestWebpage");
            preparedStatement.setDate(4, new java.sql.Date(2009, 12, 11));
            preparedStatement.setString(5, "TestSummary");
            preparedStatement.setString(6, "TestComment");
            preparedStatement.executeUpdate();

            preparedStatement = connect.prepareStatement("SELECT myuser, webpage, datum, summary, COMMENTS from mysqldb.comments");
            resultSet = preparedStatement.executeQuery();
            showResult(resultSet);

            preparedStatement = connect.prepareStatement("delete from mysqldb.comments where myuser= ? ; ");
            preparedStatement.setString(1, "Test");
            preparedStatement.executeUpdate();
            resultSet = statement.executeQuery("select * from mysqldb.comments");
            writeMetaData(resultSet);
        } catch (Exception e) {
            throw e;
        } finally {
            close();
        }
    }

    /**
     * @param resultSet
     * @throws SQLException
     */
    private void writeMetaData(ResultSet resultSet) throws SQLException {
        //  Now get some metadata from the database
        // Result set get the result of the SQL query
        System.out.println("The columns in the table are: ");
        System.out.println("Table: " + resultSet.getMetaData().getTableName(1));
        for (int i = 1; i <= resultSet.getMetaData().getColumnCount(); i++)
            System.out.println("Column " + i + " " + resultSet.getMetaData().getColumnName(i));
    }

    /**
     * @param resultSet
     * @throws SQLException
     */
    private void showResult(ResultSet resultSet) throws SQLException {
        // ResultSet is initially before the first data set
        while (resultSet.next()) {
            // It is possible to get the columns via name
            // also possible to get the columns via the column number
            // which starts at 1
            // e.g. resultSet.getSTring(2);
            String user = resultSet.getString("myuser");
            String website = resultSet.getString("webpage");
            String summary = resultSet.getString("summary");
            Date date = resultSet.getDate("datum");
            String comment = resultSet.getString("comments");
            System.out.println("User: " + user);
            System.out.println("Website: " + website);
            System.out.println("summary: " + summary);
            System.out.println("Date: " + date);
            System.out.println("Comment: " + comment);
        }
    }

    /**
     * Закрыть подключение, запросы, набор результатов
     */
    private void close() {
        try {
            if (resultSet != null) resultSet.close();
            if (statement != null) statement.close();
            if (connect != null) connect.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
