package com.hh.util;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class chickOrder {
    public static String chick(String orderid) throws SQLException {
        Statement stmt = Sql_tool.getCon().createStatement();
        ResultSet data_1 = stmt.executeQuery("SELECT * From foods WHERE foods.`order`="+orderid+" ORDER BY foods.ispackage ASC");
        data_1.next();
        String ispackage = data_1.getString("ispackage");
        if(ispackage.equals("0")){
            stmt.close();
            return "0"; // 0订单未处理完整 1 订单处理完整 2 订单商品全被拒绝
        }else if(ispackage.equals("1")){
            Statement stmt2 = Sql_tool.getCon().createStatement();
            ResultSet data_2 = stmt2.executeQuery("SELECT * From foods WHERE foods.`order`="+orderid+" ORDER BY foods.state DESC");
            while(data_2.next()){
                if (!data_2.getString("state").equals("2")){
                    stmt2.close();
                    return "1";
                }
            }
            stmt2.close();
            return "2";
        }else {
            return "0";
        }
    }
}
