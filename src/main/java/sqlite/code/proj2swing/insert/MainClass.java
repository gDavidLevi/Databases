package sqlite.code.proj2swing.insert;

import sqlite.code.proj2swing.TCellRenderer;

import java.awt.Cursor;
import java.awt.Desktop;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.MouseMotionAdapter;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import javax.swing.JFrame;
import javax.swing.JScrollPane;
import javax.swing.JTable;

/**
 * Вставка данных из массива в JTable
 */
public class MainClass {
    // Точка входа
    public static void main(String[] args) {
        // Массив с названиями столбцов
        Object[] columnHeaders = {"Фамилия", "Имя", "Отчество", "email"};
        // Массив с данными
        Object[][] data = {
                {"Иванов", "Иван", "Иванович", "test1@mail.ru"},
                {"Петров", "Олег", "Петрович", "test2@mail.ru"},
                {"Алексеев", "Алексей", "Алексеевич", "test3@mail.ru"},
                {"Сидоров", "Сидор", "Сидорович", "test4@mail.ru"},
                {"Олегов", "Олег", "Олегович", "test5@mail.ru"}
        };

        // Окно
        JFrame frame = new JFrame("Пример данных из массива");
        frame.setSize(500, 300);
        frame.setLocationRelativeTo(null);
        frame.getContentPane().setLayout(new FlowLayout());
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        // Таблица
        final JTable table = new JTable(data, columnHeaders);
        table.setRowHeight(30); // высота ячейки в px
        table.setDefaultRenderer(Object.class, new TCellRenderer()); // отрисовщик ячеек
        table.setPreferredScrollableViewportSize(new Dimension(400, 200)); // размеры прокручиваемой области
        // Слушатель на клик мышкой
        table.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                if (e.getClickCount() == 1) {
                    JTable target = (JTable) e.getSource();
                    String value = target.getValueAt(target.getSelectedRow(), target.getSelectedColumn()).toString();
                    try {
                        if (value.contains("@")) // если есть символ @, то
                            /*
                            The Desktop class allows a Java application to launch associated applications registered on
                            the native desktop to handle.

                            Method mail() launches the mail composing window of the user default mail client, filling
                            the message fields specified by a URI.
                             */
                            Desktop.getDesktop().mail(new URI("mailto:" + value + "?SUBJECT=Служебное%20письмо&body=Текст%20письма"));
                    } catch (IOException | URISyntaxException e1) {
                        e1.printStackTrace();
                    }
                }
            }
        });
        // Слушатель на перемещение мыши
        table.addMouseMotionListener(new MouseMotionAdapter() {
            @Override
            public void mouseMoved(MouseEvent e) {
                JTable target = (JTable) e.getSource();
                if (target.columnAtPoint(e.getPoint()) == 3)
                    target.setCursor(new Cursor(Cursor.HAND_CURSOR)); // этот тип курсора над гиперссылкой
                else
                    target.setCursor(new Cursor(Cursor.DEFAULT_CURSOR));
            }
        });

        // Поместить таблицу на панель и отобразить её
        JScrollPane scrollPane = new JScrollPane(table);
        frame.getContentPane().add(scrollPane);
        frame.setVisible(true);
    }
}
