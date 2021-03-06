package ru.davidlevi.sqlite.code.proj2swing.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Коннектер
 */
public class SqliteConnector2 {
    private static Connection connection;

    /**
     * @return Connection
     */
    public static Connection getConnection() {
        try {
            if (connection == null)
                connection = DriverManager.getConnection("jdbc:ru.davidlevi.sqlite:carshop.ru.davidlevi.sqlite");
            return connection;
        } catch (SQLException e) {
            Logger.getLogger(SqliteConnector2.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }
}
