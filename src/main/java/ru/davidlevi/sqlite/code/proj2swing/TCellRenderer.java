package ru.davidlevi.sqlite.code.proj2swing;

import java.awt.Color;
import java.awt.Component;
import javax.swing.JTable;
import javax.swing.table.DefaultTableCellRenderer;

/**
 * Параметры отрисовки ячейки таблицы
 */
public class TCellRenderer extends DefaultTableCellRenderer {
    /**
     * Returns the default table cell renderer.
     * <p>
     * During a printing operation, this method will be called with
     * <code>isSelected</code> and <code>hasFocus</code> values of
     * <code>false</code> to prevent selection and focus from appearing
     * in the printed output. To do other customization based on whether
     * or not the table is being printed, check the return value from
     * {@link javax.swing.JComponent#isPaintingForPrint()}.
     *
     * @param table      the <code>JTable</code>
     * @param value      the value to assign to the cell at  <code>[row, column]</code>
     * @param isSelected true if cell is selected
     * @param hasFocus   true if cell has focus
     * @param row        the row of the cell to render
     * @param column     the column of the cell to render
     * @return the default table cell renderer
     * @see javax.swing.JComponent#isPaintingForPrint()
     */
    @Override
    public Component getTableCellRendererComponent(JTable table, Object value, boolean isSelected, boolean hasFocus, int row, int column) {
        setText(value.toString());
        if (isSelected) { // если выделена строка
            setBackground(Color.ORANGE); // фон: ОРАНЖЕВЫЙ
            setForeground(Color.BLACK); // текст: ЧЕРНЫЙ
        } else {
            setBackground(Color.WHITE);
            setForeground(Color.BLACK);
        }
        // Если строка содержит @, то обернуть value в гиперссылку
        if (value.toString().contains("@"))
            setValue("<html><a href=\"#\">" + value + "</href></html>");
        return this;
    }
}