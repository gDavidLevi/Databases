package ru.davidlevi.sqlite.code.proj1;

import ru.davidlevi.sqlite.code.proj1.dao.SqliteConnector1;
import ru.davidlevi.sqlite.code.proj1.model.Spr;

import java.io.*;
import java.util.ArrayList;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;

public class MainClass {
    /**
     * Выгрузка в файл
     *
     * @param data String
     */
    private static void saveToFile(String data) {
        try (FileWriter fileWriter = new FileWriter("result_sqlite.txt")) {
            fileWriter.write(data);
            fileWriter.flush();
        } catch (IOException e) {
            Logger.getLogger(MainClass.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    // Точка входа
    public static void main(String[] args) {
        try {
            // Считываем из файла commands_sqlite.txt инструкции
            Scanner scanner = new Scanner(new FileInputStream("commands_sqlite.txt"), "UTF-8");

            // Путь к БД
            String databaseName = scanner.nextLine(); // строка 1 - имя базы данных
            System.out.println("База данных: " + databaseName + "\n");

            if (!new File(databaseName).exists()) {
                System.out.println("Файл базы данных не найден!");
                return;
            }

            // Открыть подключение
            SqliteConnector1.openConnection(databaseName);

            // Отобразить содержимое справочника spr_Model
            //SqliteConnector1.showSpr_Model();

            // Сформируем список запросов из файла commands_sqlite.txt
            ArrayList<String> listQueries = new ArrayList<>();
            try {
                while (scanner.hasNextLine())
                    listQueries.add(scanner.nextLine());
            } finally {
                scanner.close();
            }

            // Обработаем listQueries
            StringBuilder result = new StringBuilder();
            for (String query : listQueries) {
                result.append("Query: ").append(query).append("\n");
                ArrayList<Spr> resultQuery = SqliteConnector1.getResultList(query);
                for (Spr spr : resultQuery)
                    result.append(String.format("%s %s (%s)%n", spr.getId(), spr.getName_ru(), spr.getName_en()));
                result.append("\n");
            }
            System.out.println(result.toString());

            // Сохраним результат в файл
            saveToFile(result.toString());

            // Закроем подключение
            SqliteConnector1.closeConnection();
        } catch (IOException e) {
            Logger.getLogger(MainClass.class.getName()).log(Level.SEVERE, null, e);
        }
    }
}
