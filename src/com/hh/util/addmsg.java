package com.hh.util;

import java.sql.SQLException;
import java.sql.Statement;

public class addmsg {
    public static String add_msg(String orderid,String userId,String msgtype,String Mdata,String foodsId) throws SQLException {

        Statement stmt = Sql_tool.getCon().createStatement();
        switch(msgtype){
            case "0":
                stmt.executeUpdate("insert into msg set msg.user="+userId+", msg.msgtype="+msgtype+", msg.readmark=0, msg.orderid="+orderid+",msg.foodsid="+foodsId+",msg.msgtime='"+getTime.gettime()+"', msg.msgs='商家取消订单:"+Mdata+"'");
                break;
            case "1":
                stmt.executeUpdate("insert into msg set msg.user="+userId+", msg.msgtype="+msgtype+", msg.readmark=0, msg.orderid="+orderid+",msg.foodsid="+foodsId+",msg.msgtime='"+getTime.gettime()+"', msg.msgs='有新商品订单了:"+Mdata+"'");
                break;
            case "2":
                stmt.executeUpdate("insert into msg set msg.user="+userId+", msg.msgtype="+msgtype+", msg.readmark=0, msg.orderid="+orderid+",msg.foodsid="+foodsId+",msg.msgtime='"+getTime.gettime()+"',msg.msgs='您的订单商品被商家拒绝:"+Mdata+"'");
                break;
            case "3":
                stmt.executeUpdate("insert into msg set msg.user="+userId+", msg.msgtype="+msgtype+", msg.readmark=0, msg.orderid="+orderid+",msg.foodsid="+foodsId+",msg.msgtime='"+getTime.gettime()+"', msg.msgs='您的订单商品被商家接受:"+Mdata+"'");
                break;
            case "4":
                stmt.executeUpdate("insert into msg set msg.user="+userId+", msg.msgtype="+msgtype+", msg.readmark=0, msg.orderid="+orderid+",msg.foodsid="+foodsId+",msg.msgtime='"+getTime.gettime()+"', msg.msgs='您的订单商品被商家送出:"+Mdata+"'");
                break;
            case "5":
                stmt.executeUpdate("insert into msg set msg.user="+userId+", msg.msgtype="+msgtype+", msg.readmark=0, msg.orderid="+orderid+",msg.foodsid="+foodsId+",msg.msgtime='"+getTime.gettime()+"', msg.msgs='买家接收订单:"+Mdata+"'");
                break;
            case "6":
                stmt.executeUpdate("insert into msg set msg.user="+userId+", msg.msgtype="+msgtype+", msg.readmark=0, msg.orderid="+orderid+",msg.foodsid="+foodsId+",msg.msgtime='"+getTime.gettime()+"', msg.msgs='买家评论了你的商品:"+Mdata+"'");
                break;
            default:return "0";
        }
        stmt.close();
        return "1";
    }
}
