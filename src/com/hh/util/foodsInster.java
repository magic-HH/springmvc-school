package com.hh.util;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class foodsInster {
    public static String inster(String foodid,String amount) throws SQLException {
        Statement stmt = Sql_tool.getCon().createStatement();
        stmt.execute("INSERT into foods set foods.order=1000 ,foods.food = "+foodid+", foods.state=7,foods.amount="+amount+";");
        Statement stmt2 = Sql_tool.getCon().createStatement();
        ResultSet data_count2 = stmt2.executeQuery("select foods.id from foods ORDER BY foods.id DESC;;");
        data_count2.next();
        String foodsid = data_count2.getString("id");
        stmt.close();
        stmt2.close();
        return foodsid;
    }
}
