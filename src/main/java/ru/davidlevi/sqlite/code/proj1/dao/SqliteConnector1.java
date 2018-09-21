package ru.davidlevi.sqlite.code.proj1.dao;

import ru.davidlevi.sqlite.code.proj1.model.Spr;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Контроллер базы данных (организация подключения, выполнение запросов)
 */
public class SqliteConnector1 {
    private static Connection connection;

    /**
     * Метод открывает соединение с БД
     *
     * @param path String путь к файлу
     */
    public static void openConnection(String path) {
        try {
            if (connection == null)
                connection = DriverManager.getConnection("jdbc:ru.davidlevi.sqlite:" + path);
        } catch (SQLException e) {
            Logger.getLogger(SqliteConnector1.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    /**
     * Вывод в консоль результата запроса
     * select * from spr_Model WHERE name_ru = 'Прадо' or name_en='Golf'
     */
    public static void showSpr_Model() {
        System.out.println("spr_Model:");
        try (PreparedStatement statement = connection.prepareStatement("select * from spr_Model WHERE name_ru = ? or name_en=?")) {
            statement.setString(1, "Прадо");
            statement.setString(2, "Golf");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next())
                System.out.print(String.format("%s %s (%s)%n", resultSet.getInt("id"), resultSet.getString("name_ru"), resultSet.getString("name_en")));
            System.out.println();
            resultSet.close();
        } catch (SQLException ex) {
            Logger.getLogger(SqliteConnector1.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Возвращает список
     *
     * @param sql запрос
     * @return ArrayList<Spr>
     */
    public static ArrayList<Spr> getResultList(String sql) {
        ArrayList<Spr> list = new ArrayList<>();
        // все объявленные ресурсы в скобках try будут закрываться автоматически после выполнения блока
        try (Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(sql);) {
            while (resultSet.next()) {
                Spr spr = new Spr();
                spr.setId(resultSet.getInt("id"));
                spr.setName_ru(resultSet.getString("name_ru"));
                spr.setName_en(resultSet.getString("name_en"));
                list.add(spr);
            }
        } catch (SQLException e) {
            Logger.getLogger(SqliteConnector1.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    /**
     * Закрытие подключения
     */
    public static void closeConnection() {
        try {
            if (connection != null) connection.close();
        } catch (SQLException e) {
            Logger.getLogger(SqliteConnector1.class.getName()).log(Level.SEVERE, null, e);
        }
    }
}