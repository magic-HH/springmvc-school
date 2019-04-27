package com.hh.util;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class tempShop {
    public static  void addshop(String foodsid, String userid) throws SQLException {
        Statement stmt = Sql_tool.getCon().createStatement();
        stmt.execute("INSERT into shoping set shoping.user ="+userid+","+"shoping.foods="+foodsid);
        stmt.close();
    }
    public static  void cleanshop(String userid) throws SQLException {
        Statement stmt = Sql_tool.getCon().createStatement();
        stmt.execute("delete from shoping where shoping.user="+userid);
        stmt.close();
    }

}
