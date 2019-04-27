package com.hh.util;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class GetOrdersFoods {
    public static String getdatas(String ordersid) throws SQLException {
        String datas = "(";
        Statement stmt = Sql_tool.getCon().createStatement();
        ResultSet data_1 = stmt.executeQuery("SELECT food.`name` as foodname FROM  foods  INNER JOIN food ON food.id = foods.food WHERE  foods.state!=2 and foods.`order`=" + ordersid);
        while (data_1.next()){
            datas+=data_1.getString("foodname")+"&nbsp";
        }
        datas+=")";
        stmt.close();
        return datas;
    }
    public static String getdatasall(String ordersid) throws SQLException {
        String datas = "(";
        Statement stmt = Sql_tool.getCon().createStatement();
        ResultSet data_1 = stmt.executeQuery("SELECT food.`name` as foodname FROM  foods  INNER JOIN food ON food.id = foods.food WHERE  foods.`order`=" + ordersid);
        while (data_1.next()){
            datas+=data_1.getString("foodname")+"&nbsp";
        }
        datas+=")";
        stmt.close();
        return datas;
    }
}
