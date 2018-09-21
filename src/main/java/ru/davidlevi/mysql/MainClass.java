package ru.davidlevi.mysql;

import ru.davidlevi.mysql.dao.MysqlConnector;

public class MainClass {
    public static void main(String[] args) throws Exception {
        MysqlConnector dao = new MysqlConnector();
        dao.readData();
        /*
        The connection is established

        User: David
        Website: https://davidlevi.ru
        summary: Summary
        Date: 2018-09-18
        Comment: My first comment

        User: David
        Website: https://davidlevi.ru
        summary: Summary
        Date: 2018-09-18
        Comment: My first comment

        User: Test
        Website: TestWebpage
        summary: TestSummary
        Date: 3910-01-10
        Comment: TestComment

        The columns in the table are:
        Table: comments
        Column 1 id
        Column 2 MYUSER
        Column 3 EMAIL
        Column 4 WEBPAGE
        Column 5 DATUM
        Column 6 SUMMARY
        Column 7 COMMENTS

        Process finished with exit code 0
         */
    }
}
