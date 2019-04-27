package com.hh.util;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class orderStateChange {
    public static void stateChange(String foodsId, String stateType) throws SQLException {
        Statement stmt = Sql_tool.getCon().createStatement();
        ResultSet data_1 = stmt.executeQuery("select food.`name` as foodname,foods.food as food, orders.`user` as userid ,orders.id as orderid  from foods INNER JOIN food on foods.food=food.id INNER JOIN orders on foods.`order`=orders.id where foods.id=" + foodsId);
        data_1.next();
        String Mdata = data_1.getString("foodname");
        String userId = data_1.getString("userid");
        String orderid = data_1.getString("orderid");

        switch(stateType){
            case "1":
                stmt.executeUpdate("UPDATE foods set foods.state ="+stateType+" WHERE foods.id="+foodsId);
                addmsg.add_msg(orderid,userId,stateType,Mdata,foodsId);
                break;
            case "2":
                stmt.executeUpdate("UPDATE foods set foods.state ="+stateType+",foods.ispackage=1 WHERE foods.id="+foodsId);
                addmsg.add_msg(orderid,userId,stateType,Mdata,foodsId);
                if(chickOrder.chick(orderid).equals("1")){
                    stateChange(foodsId,"3");
                }else if(chickOrder.chick(orderid).equals("2")){
                    String allFoods = GetOrdersFoods.getdatasall(orderid);
                    addmsg.add_msg(orderid,userId,"0",allFoods,foodsId);
                }
                break;
            case "3":
                stmt.executeUpdate("UPDATE foods set foods.state ="+stateType+",foods.ispackage=1 WHERE foods.id="+foodsId);
                Mdata = GetOrdersFoods.getdatas(orderid);
                addmsg.add_msg(orderid,userId,stateType,Mdata,foodsId);
                break;
            case "4":
                stmt.executeUpdate("UPDATE foods set foods.state ="+stateType+"  WHERE foods.id="+foodsId);
                Mdata = GetOrdersFoods.getdatas(orderid);
                addmsg.add_msg(orderid,userId,stateType,Mdata,foodsId);
                break;
            case "5":
                stmt.executeUpdate("UPDATE foods set foods.state ="+stateType+" WHERE  foods.id="+foodsId);
                Mdata = GetOrdersFoods.getdatas(orderid);
                addmsg.add_msg(orderid,userId,stateType,Mdata,foodsId);
                break;
            case "6":
                stmt.executeUpdate("UPDATE foods set  foods.state ="+stateType+" WHERE foods.id="+foodsId);
                Mdata = GetOrdersFoods.getdatas(orderid);
                addmsg.add_msg(orderid,userId,stateType,Mdata,foodsId);
                break;
            default:break;
        }
        stmt.close();
    }
    public static void stateChange(String foodsId, String stateType,String n_orderid) throws SQLException {
        Statement stmt = Sql_tool.getCon().createStatement();
        ResultSet data_1 = stmt.executeQuery("select food.`name` as foodname,foods.food as food, orders.`user` as userid ,orders.id as orderid  from foods INNER JOIN food on foods.food=food.id INNER JOIN orders on foods.`order`=orders.id where foods.id=" + foodsId);
        data_1.next();
        String userId = data_1.getString("userid");
        String orderid = data_1.getString("orderid");
        String Mdata = data_1.getString("foodname");


        switch(stateType){
            case "1":
                stmt.executeUpdate("UPDATE foods set foods.order="+n_orderid+",foods.state ="+stateType+" WHERE foods.id="+foodsId);
                addmsg.add_msg(orderid,"4",stateType,Mdata,foodsId);
                break;
            case "2":
                stmt.executeUpdate("UPDATE foods set foods.state ="+stateType+",foods.ispackage=1 WHERE foods.id="+foodsId);
                addmsg.add_msg(orderid,userId,stateType,Mdata,foodsId);
                if(chickOrder.chick(orderid).equals("1")){
                    stateChange(foodsId,"3");
                }else if(chickOrder.chick(orderid).equals("2")){
                    String allFoods = GetOrdersFoods.getdatasall(orderid);
                    addmsg.add_msg(orderid,userId,"0",allFoods,foodsId);
                }
                break;
            case "3":
                stmt.executeUpdate("UPDATE foods set foods.state ="+stateType+",foods.ispackage=1 WHERE foods.id="+foodsId);
                Mdata = GetOrdersFoods.getdatas(orderid);
                addmsg.add_msg(orderid,userId,stateType,Mdata,foodsId);
                break;
            case "4":
                stmt.executeUpdate("UPDATE foods set foods.state ="+stateType+"  WHERE foods.id="+foodsId);
                Mdata = GetOrdersFoods.getdatas(orderid);
                addmsg.add_msg(orderid,userId,stateType,Mdata,foodsId);
                break;
            case "5":
                stmt.executeUpdate("UPDATE foods set foods.state ="+stateType+" WHERE  foods.id="+foodsId);
                Mdata = GetOrdersFoods.getdatas(orderid);
                addmsg.add_msg(orderid,userId,stateType,Mdata,foodsId);
                break;
            case "6":
                stmt.executeUpdate("UPDATE foods set  foods.state ="+stateType+" WHERE foods.id="+foodsId);
                Mdata = GetOrdersFoods.getdatas(orderid);
                addmsg.add_msg(orderid,userId,stateType,Mdata,foodsId);
                break;
            default:break;
        }
        stmt.close();
    }
}
