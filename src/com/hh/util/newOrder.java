package com.hh.util;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class newOrder
{
      public static String newO(String user,String store) throws SQLException {
          Statement stmt = Sql_tool.getCon().createStatement();
          stmt.execute("INSERT into orders set user="+user+",store="+store+",time='"+getTime.gettime()+"',remarks='无',ordertype=0");
          Statement stmt2 = Sql_tool.getCon().createStatement();
          ResultSet data_count2 = stmt2.executeQuery("select orders.id from orders ORDER BY orders.id DESC;;");
          data_count2.next();
          String orderid = data_count2.getString("id");
          stmt.close();
          stmt2.close();
          return orderid;
      }
}
