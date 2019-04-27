package com.hh.util;

import java.sql.SQLException;
import java.sql.Statement;

public class msgRead {
    public static void eraseMark(String msgId) throws SQLException {
        Statement stmt = Sql_tool.getCon().createStatement();
        stmt.executeUpdate("UPDATE msg set msg.readmark=1 where msg.id="+msgId);
        stmt.close();

    }
}
