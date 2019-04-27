package com.hh.controller;

import com.hh.model.foodSimple;
import com.hh.model.shop;
import com.hh.util.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


@Controller
@RequestMapping("/main")
public class storemain {
    @RequestMapping("/index")
    public String index(HttpServletRequest request) throws SQLException {
        Statement stmt = Sql_tool.getCon().createStatement();
        ResultSet data_count = stmt.executeQuery("SELECT * FROM food order by id desc LIMIT 0,8");
        ArrayList<foodSimple> newfoods = new ArrayList<foodSimple>();
        while(data_count.next()) {
            foodSimple tempdata = new foodSimple();
            tempdata.setName(data_count.getString("name"));
            tempdata.setImg(data_count.getString("img"));
            tempdata.setDescribe(data_count.getString("describe"));
            tempdata.setFoodid(data_count.getString("id"));
            tempdata.setStore(data_count.getString("store"));
            tempdata.setPrice(data_count.getString("price"));
            newfoods.add(tempdata);
        }
        request.setAttribute("newfoods",newfoods);
        stmt.close();
        return "index";
    }

    @RequestMapping("/product")//搜索页面
    public String product(HttpServletRequest request) throws SQLException {
        String s_name = "";
        s_name = request.getParameter("findtext");
        Statement stmt = Sql_tool.getCon().createStatement();
        ResultSet data_count = stmt.executeQuery("SELECT * FROM food WHERE food.name LIKE '"+s_name+"'");
        data_count.next();
        foodSimple tempdata = new foodSimple();
        tempdata.setPrice(data_count.getString("price"));
        tempdata.setName(data_count.getString("name"));
        tempdata.setImg(data_count.getString("img"));
        tempdata.setDescribe(data_count.getString("describe"));
        tempdata.setFoodid(data_count.getString("id"));
        tempdata.setStore(data_count.getString("store"));
        request.setAttribute("data",tempdata);
        stmt.close();
        return "products";
    }
@RequestMapping("/product_details")//详情
    public String product_details(HttpServletRequest request) throws SQLException {
        String foodid = "";
        foodid = request.getParameter("foodid");
    Statement stmt = Sql_tool.getCon().createStatement();
    ResultSet data_count = stmt.executeQuery("SELECT * FROM food WHERE food.id = "+foodid);
    data_count.next();
    foodSimple tempdata = new foodSimple();
    tempdata.setFoodid(data_count.getString("id"));
    tempdata.setStore(data_count.getString("store"));
    tempdata.setPrice(data_count.getString("price"));
    tempdata.setName(data_count.getString("name"));
    tempdata.setImg(data_count.getString("img"));
    tempdata.setDescribe(data_count.getString("describe"));

    request.setAttribute("data",tempdata);
    stmt.close();
        return "product_details";
    }
    @RequestMapping("/add_shoping")
    public String add_shoping(HttpServletRequest request, HttpSession httpSession) throws SQLException {
        String foodid = request.getParameter("foodid");
        String userid="";
        try {
             userid = httpSession.getAttribute("id").toString();
        }catch (NullPointerException e){
            e.printStackTrace();
            return "redirect:../backstage/login";
        }
        String s_foodsid = foodsInster.inster(foodid,"1");
        tempShop.addshop(s_foodsid,userid);
        return "redirect:index";
    }
    @RequestMapping("/product_summary")//购物车
    public String product_summary(HttpServletRequest request,HttpSession httpSession) throws SQLException {
        String foodid = request.getParameter("foodid");
        String userid="";
        try {
            userid = httpSession.getAttribute("id").toString();
        }catch (NullPointerException e){
            e.printStackTrace();
            return "redirect:../backstage/login";
        }
        ArrayList<shop> shoplist = new ArrayList<shop>();
        Statement stmt2 = Sql_tool.getCon().createStatement();
        ResultSet data_count2 = stmt2.executeQuery("SELECT food.img as img,food.`name` as `name`,food.price as price,foods.amount as `num` ,foods.id as foodsid FROM shoping INNER JOIN foods on shoping.foods=foods.id INNER JOIN food on foods.food=food.id WHERE shoping.`user`="+userid);
        while (data_count2.next()){
            shop tp_shop = new shop();
            tp_shop.setFoodsid(data_count2.getString("foodsid"));
            tp_shop.setImg(data_count2.getString("img"));
            tp_shop.setName(data_count2.getString("name"));
            tp_shop.setPrice(data_count2.getString("price"));
            tp_shop.setNum(data_count2.getString("num"));
            shoplist.add(tp_shop);
        }
        stmt2.close();
        request.setAttribute("dataset",shoplist);
        return "product_summary";
    }
    @RequestMapping("/food-cc")
    public String food_cc(HttpServletRequest request,HttpSession httpSession) throws SQLException {
        String num ="";
        String id = "";
        String foodsid = "";
        num = request.getParameter("num");
        id = httpSession.getAttribute("id").toString();
        foodsid = request.getParameter("foodsid");
        if(num.equals("-5")){
            Statement stmt2 = Sql_tool.getCon().createStatement();
            stmt2.execute("delete from shoping where user ="+id+" and foods="+foodsid);
            stmt2.close();
            Statement stmt3 = Sql_tool.getCon().createStatement();
            stmt3.execute("delete from foods where id="+foodsid);
            stmt3.close();
        }else{
            Statement stmt3 = Sql_tool.getCon().createStatement();
            stmt3.execute("UPDATE  foods SET foods.amount = "+num+" where id="+foodsid);
            stmt3.close();
        }
        return "redirect:product_summary";
    }
    @RequestMapping("/pay")
    public String pay(HttpServletRequest request,HttpSession httpSession) throws SQLException {
        String id = "";
        id = httpSession.getAttribute("id").toString();
        ArrayList<shop> shoplist = new ArrayList<shop>();
        Statement stmt2 = Sql_tool.getCon().createStatement();
        ResultSet data_count2 = stmt2.executeQuery("SELECT food.store as store,food.img as img,food.`name` as `name`,food.price as price,foods.amount as `num` ,foods.id as foodsid FROM shoping INNER JOIN foods on shoping.foods=foods.id INNER JOIN food on foods.food=food.id WHERE shoping.`user`="+id);
        while (data_count2.next()){
            shop tp_shop = new shop();
            tp_shop.setName(data_count2.getString("name"));
            tp_shop.setPrice(data_count2.getString("price"));
            tp_shop.setNum(data_count2.getString("num"));
            tp_shop.setFoodsid(data_count2.getString("foodsid"));
            tp_shop.setImg(data_count2.getString("img"));
            tp_shop.setStore(data_count2.getString("store"));
            shoplist.add(tp_shop);
        }
        stmt2.close();
        String new_orderid= newOrder.newO(id,shoplist.get(0).getStore());
        for(shop i:shoplist){
            orderStateChange.stateChange(i.getFoodsid(),"1",new_orderid);
        }
        tempShop.cleanshop(id);
        return "redirect:../backstage/vieworder";
    }

}
