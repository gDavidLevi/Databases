package ru.davidlevi.mariadb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class MainClass {
    public static void main(String[] args) {
        try {
            // CREATE SCHEMA `mariadb` DEFAULT CHARACTER SET utf8 ;
            /*
            https://mariadb.com/kb/en/library/about-mariadb-connector-j/

            Connection Strings
             jdbc:mariadb:[replication:|failover:|sequential:|aurora:]//<hostDescription>[,<hostDescription>...]/[database][?<key1>=<value1>[&<key2>=<value2>]]
             */
            Connection connection = DriverManager.getConnection("jdbc:mariadb://localhost:3306/mariadb?user=david&password=david");

            // Создание таблицы
            Statement stmt = connection.createStatement();
            stmt.executeUpdate("CREATE TABLE a (id int not null primary key, value varchar(20))");
            stmt.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
