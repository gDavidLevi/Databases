package sqlite.code.proj2swing.edit;

import sqlite.code.proj2swing.SQLiteConnection;
import sqlite.code.proj2swing.show.TModel;
import sqlite.code.proj2swing.TCellRenderer;

import java.awt.HeadlessException;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.*;
import javax.swing.event.TableModelEvent;
import javax.swing.event.TableModelListener;
import javax.swing.table.TableModel;
import javax.swing.table.TableRowSorter;

/**
 * Редактирование данных в БД через JTable
 */
public class MainClass {
    private static final String TABLE_NAME = "spr_Model"; // редактируемая таблица

    // Точка входа
    public static void main(String[] args) {
        try {
            // Подключение к БД и таблице
            final Connection con = SQLiteConnection.getConnection();
            final TModel mod = new TModel(con, TABLE_NAME);

            // Таблица
            JTable table = new JTable(mod);
            //show.setAutoCreateRowSorter(true);
            // Сортировщик
            TableRowSorter<TableModel> rowSorter = new TableRowSorter<TableModel>(mod);
            table.setRowSorter(rowSorter);
            // Отрисовщик
            TCellRenderer cellRenderer = new TCellRenderer();
            table.setDefaultRenderer(Object.class, cellRenderer);
            // Панель прокрутки
            JScrollPane scrollPane = new JScrollPane(table, ScrollPaneConstants.VERTICAL_SCROLLBAR_AS_NEEDED, ScrollPaneConstants.HORIZONTAL_SCROLLBAR_AS_NEEDED);
            // Рамка
            JFrame frame = new JFrame("Обновление данных в JTable");
            frame.setSize(500, 400);
            frame.setLocationRelativeTo(null);
            frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
            // Кнопка "Обновить"
            JButton updateButton = new JButton("Обновить");
            // Панель
            JPanel panel = new JPanel();
            panel.add(updateButton);
            panel.add(scrollPane);
            //...
            frame.getContentPane().add(panel);
            // Слушатель состояния окна приложения
            frame.addWindowStateListener(new WindowAdapter() {

                @Override
                public void windowClosed(WindowEvent e) {
                    if (con != null) try {
                        con.close();
                    } catch (SQLException e1) {
                        Logger.getLogger(MainClass.class.getName()).log(Level.SEVERE, null, e1);
                    }
                }

            });
            // ...
            updateButton.addActionListener(new ActionListener() {
                @Override
                public void actionPerformed(ActionEvent e) {
                    if (mod.updateDB(TABLE_NAME))
                        /*
                        JOptionPane - dialog box
                         */
                        JOptionPane.showMessageDialog(null, "Данные обновлены!");
                    else
                        JOptionPane.showMessageDialog(null, "Ошибка обновления данных!");
                }
            });
            // ...
            table.getModel().addTableModelListener(new TableModelListener() {
                @Override
                public void tableChanged(TableModelEvent e) {
                    int row = e.getFirstRow();
                    int column = e.getColumn();
                    System.out.println(row + " " + column);
                    TableModel model = (TableModel) e.getSource();
                    String columnName = model.getColumnName(column);
                    Object data = model.getValueAt(row, column);
                }
            });
            frame.setVisible(true);
            //con.close();
        } catch (HeadlessException | SQLException e2) {
            e2.printStackTrace();
        }
    }
}
