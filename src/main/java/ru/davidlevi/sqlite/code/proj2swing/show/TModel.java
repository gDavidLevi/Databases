package ru.davidlevi.sqlite.code.proj2swing.show;

import javax.swing.table.*;
import java.sql.*;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Модель таблицы
 */
public class TModel extends AbstractTableModel {
    private static Connection connection;

    // Содержимое таблицы
    private String[] columnNames; // имена столбцов
    private Class[] columnTypes; // типы столбцов
    private Object[][] data; // данные

    /**
     * Конструктор
     *
     * @param con       Connection
     * @param tableName String
     * @throws SQLException SQLException
     */
    public TModel(Connection con, String tableName) throws SQLException {
        super();
        connection = con;
        getTableContents(tableName);

    }

    /**
     * Метод возвращает содержимое таблицы
     *
     * @param tableName String
     * @throws SQLException SQLException
     */
    private void getTableContents(String tableName) throws SQLException {
        DatabaseMetaData metaData = connection.getMetaData();
        // Получить методанные
        ArrayList columnsNames = new ArrayList(); // список имен столбцов
        ArrayList columnsTypes = new ArrayList(); // список типов столбцов
        ResultSet resultSet = metaData.getColumns(null, null, tableName, null);
        while (resultSet.next()) {
            // Добавить в список имя столбца
            columnsNames.add(resultSet.getString("COLUMN_NAME"));
            // Добавить в список тип столбца
            int type = resultSet.getInt("DATA_TYPE");
            switch (type) {
                case Types.INTEGER:
                    columnsTypes.add(Integer.class);
                    break;
                case Types.FLOAT:
                    columnsTypes.add(Float.class);
                    break;
                case Types.DOUBLE:
                case Types.REAL:
                    columnsTypes.add(Double.class);
                    break;
                case Types.DATE:
                case Types.TIME:
                case Types.TIMESTAMP:
                    columnsTypes.add(java.sql.Date.class); // именно java.sql.Date.class
                    break;
                default:
                    columnsTypes.add(String.class);
                    break;
            }
        }

        // Имена столбцов сохранить в отдельный массив columnNames
        columnNames = new String[columnsNames.size()];
        columnsNames.toArray(columnNames);

        // Типы столбцов сохранить в отдельный массив columnTypes
        columnTypes = new Class[columnsTypes.size()];
        columnsTypes.toArray(columnTypes);

        Statement statement = connection.createStatement();
        resultSet = statement.executeQuery("SELECT * FROM " + tableName);

        // Хранит записи из таблицы
        ArrayList rowList = new ArrayList();

        while (resultSet.next()) {
            ArrayList cellList = new ArrayList(); // Хранит данные по каждому столбцу (ячейки)
            for (int i = 0; i < columnTypes.length; i++) {
                Object cellValue = null;
                if (columnTypes[i] == String.class) {
                    cellValue = resultSet.getString(columnNames[i]);
                } else if (columnTypes[i] == Integer.class) {
                    cellValue = resultSet.getInt(columnNames[i]);
                } else if (columnTypes[i] == Float.class) {
                    cellValue = (float) resultSet.getInt(columnNames[i]);
                } else if (columnTypes[i] == Double.class) {
                    cellValue = resultSet.getDouble(columnNames[i]);
                } else if (columnTypes[i] == java.sql.Date.class) {
                    cellValue = resultSet.getDate(columnNames[i]);
                } else {
                    System.out.println("Не могу определить тип поля " + columnNames[i]);
                }
                cellList.add(cellValue);
            }
            Object[] cells = cellList.toArray();
            rowList.add(cells);
        }

        data = new Object[rowList.size()][];
        for (int i = 0; i < data.length; i++)
            data[i] = (Object[]) rowList.get(i);

        if (resultSet != null) resultSet.close();
        if (statement != null) statement.close();
    }

    /**
     * Обновить данные в таблице
     *
     * @param tableName
     * @return
     */
    public boolean updateDB(String tableName) {
        ArrayList<String> sqlList = new ArrayList();
        for (int i = 0; i < data.length; i++) {
            Object[] objects = data[i];
            sqlList.add("update " + tableName + " set name_ru='" + objects[1] + "', name_en='" + objects[2] + "' where id=" + objects[0] + ";");
        }
        Statement statement = null;
        try {
            statement = connection.createStatement();
            for (String sql : sqlList) {
                statement.executeUpdate(sql);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TModel.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } finally {
            try {
                if (statement != null) statement.close();
            } catch (SQLException ex) {
                Logger.getLogger(TModel.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return true;
    }


    /**
     * Returns the number of rows in the model. A
     * <code>JTable</code> uses this method to determine how many rows it
     * should display.  This method should be quick, as it
     * is called frequently during rendering.
     *
     * @return int
     */
    @Override
    public int getRowCount() {
        return data.length;
    }

    /**
     * Returns the number of columns in the model. A
     * <code>JTable</code> uses this method to determine how many columns it
     * should create and display by default.
     *
     * @return
     */
    @Override
    public int getColumnCount() {
        if (data.length == 0) {
            return 0;
        } else {
            return data[0].length;
        }
    }

    /**
     * Returns the value for the cell at <code>columnIndex</code> and
     * <code>rowIndex</code>.
     *
     * @param row
     * @param column
     * @return
     */
    @Override
    public Object getValueAt(int row, int column) {
        return data[row][column];
    }

    /**
     * Sets the value in the cell at <code>columnIndex</code> and
     * <code>rowIndex</code> to <code>aValue</code>.
     *
     * @param aValue
     * @param rowIndex
     * @param columnIndex
     */
    @Override
    public void setValueAt(Object aValue, int rowIndex, int columnIndex) {
        data[rowIndex][columnIndex] = aValue;
        fireTableCellUpdated(rowIndex, columnIndex);
    }

    /**
     * Returns the most specific superclass for all the cell values
     * in the column.  This is used by the <code>JTable</code> to set up a
     * default renderer and editor for the column.
     *
     * @param col
     * @return
     */
    @Override
    public Class getColumnClass(int col) {
        return columnTypes[col];
    }

    /**
     * Returns the name of the column at <code>columnIndex</code>.  This is used
     * to initialize the table's column header name.  Note: this name does
     * not need to be unique; two columns in a table can have the same name.
     *
     * @param col
     * @return
     */
    @Override
    public String getColumnName(int col) {
        return columnNames[col];
    }

    /**
     * Returns true if the cell at <code>rowIndex</code> and
     * <code>columnIndex</code>
     * is editable.  Otherwise, <code>setValueAt</code> on the cell will not
     * change the value of that cell.
     *
     * @param rowIndex
     * @param columnIndex
     * @return
     */
    @Override
    public boolean isCellEditable(int rowIndex, int columnIndex) {
        if (columnIndex == 0) {
            return false;
        }
        return true;
    }
}