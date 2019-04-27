package com.hh.util;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class countShopingCar {
    public static String countprice(String userid){
        //SELECT food.img as img,food.`name` as `name`,food.price as price,foods.amount as `num` ,foods.id as foodsid FROM shoping INNER JOIN foods on shoping.foods=foods.id INNER JOIN food on foods.food=food.id WHERE shoping.`user`=3
        return "";

    }
    public static String countnum(String userid) throws SQLException {
        Statement stmt2 = Sql_tool.getCon().createStatement();
        ResultSet data_count2 = stmt2.executeQuery("SELECT count(*) as count FROM shoping INNER JOIN foods on shoping.foods=foods.id INNER JOIN food on foods.food=food.id WHERE shoping.`user`="+userid);
        data_count2.next();
        String count = data_count2.getString("count");
        return count;
    }

}
