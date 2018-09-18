package sqlite.code.proj2swing.show;

import sqlite.code.proj2swing.SQLiteConnection;
import sqlite.code.proj2swing.TCellRenderer;

import java.sql.*;
import java.util.Comparator;

import javax.swing.*;
import javax.swing.table.TableModel;
import javax.swing.table.TableRowSorter;

/**
 * Отображение данных в JTable
 */
public class MainClass {
    public static void main(String[] args) {
        try (Connection connection = SQLiteConnection.getConnection()) {
            /*
            CarBrand - это представление созданное:

            CREATE VIEW [CarBrand] AS
              select m.name_ru as Модель, t.name_ru as Трансмиссия, transport.price as Цена, b.name_ru as Бренд
              from Car c
                     inner join spr_Model m on c.model_id = m.id
                     inner join spr_Transmission t on c.transmission_id = t.id
                     inner join Transport transport on c.transport_id = transport.id
                     inner join spr_Brand b on transport.brand_id = b.id;
             */
            TableModel tableModel = new TModel(connection, "CarBrand");

            // Таблица
            JTable jtable = new JTable(tableModel);
            //show.setAutoCreateRowSorter(true);

            // Сортировщик
            TableRowSorter<TableModel> rowSorter = new TableRowSorter<>(tableModel);

            /**
             * Компаратор необходим для сортировки таблицы
             */
            class ThisComparator implements Comparator {
                @Override
                public int compare(Object o1, Object o2) {
                    Double x = Double.parseDouble(o1.toString());
                    Double y = Double.parseDouble(o2.toString());
                    return (x < y) ? -1 : ((x.equals(y)) ? 0 : 1);
                }
            }

            // Установим сортировщик к колонку 2
            rowSorter.setComparator(2, new ThisComparator());
            jtable.setRowSorter(rowSorter);

            // Отрисовка
            TCellRenderer tableRenderer = new TCellRenderer();
            jtable.setDefaultRenderer(Object.class, tableRenderer);

            // Устанавливаем на панели скроллинга таблицу
            JScrollPane scrollPane = new JScrollPane(jtable, ScrollPaneConstants.VERTICAL_SCROLLBAR_AS_NEEDED, ScrollPaneConstants.HORIZONTAL_SCROLLBAR_AS_NEEDED);

            // Создаем окно
            JFrame frame = new JFrame("Загрузка данных в JTable");
            frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
            frame.getContentPane().add(scrollPane); // дабавим в окно панель скроллинга
            frame.pack();
            frame.setVisible(true);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
