package ru.davidlevi.mysql;

import ru.davidlevi.mysql.dao.MysqlConnector;

public class MainClass {
    public static void main(String[] args) throws Exception {
        MysqlConnector dao = new MysqlConnector();
        dao.readData();
    }
}
