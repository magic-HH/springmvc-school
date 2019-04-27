package com.hh.controller;

import com.hh.model.u_f;
import com.hh.util.Sql_tool;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import java.sql.*;
import java.util.ArrayList;
//        return "home";
//        //转发方式2
//        return "forward:index";
//        //重定向方式  hello指的是requsrmapping
//        return "redirect:hello";


@Controller
@RequestMapping("/book")//静态文件路径设置
public class UDon extends HttpServlet {
    @RequestMapping("/index")
    public String say(HttpServletRequest req) {
        Statement stmt;
        try {
            stmt = Sql_tool.getCon().createStatement();
            ResultSet data_1 = stmt.executeQuery("select * from book");
            ArrayList<u_f> books = new ArrayList<u_f>();
            while (data_1.next()) {
                String id = data_1.getString("id");
                String name = data_1.getString("name");
                String author = data_1.getString("author");
                String price = data_1.getString("price");
                u_f temp_book = new u_f(id, name, author, price);
                books.add(temp_book);
            }

            req.setAttribute("books", books);
            stmt.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return "old/index";
    }

    @RequestMapping("/add")
    public String add(HttpServletRequest req) {
        return "old/add";
    }

    @RequestMapping("/add_do")
    public String add_do(HttpServletRequest req) {
        try {
            Statement stmt = Sql_tool.getCon().createStatement();
            String name = req.getParameter("name");
            String author = req.getParameter("author");
            String price = req.getParameter("price");
            stmt.executeUpdate("insert into book set name='" + name + "', author='" + author + "',price=" + price);
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "redirect:index";
    }

    @RequestMapping("/del")
    public String del(HttpServletRequest req) {
        try {
            Statement stmt = Sql_tool.getCon().createStatement();
            String id = req.getParameter("id");
            stmt.executeUpdate("DELETE FROM book where id = " + id);
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "redirect:index";
    }

    @RequestMapping("/change")
    public String change() {
        return "old/change";
    }

    @RequestMapping("/change_do")
    public String change_do(HttpServletRequest req) throws SQLException {
        Statement stmt = Sql_tool.getCon().createStatement();

        String id = req.getParameter("id");
        String name = req.getParameter("name");
        String author = req.getParameter("author");
        String price = req.getParameter("price");
        stmt.executeUpdate("UPDATE book set name='" + name + "', author='" + author + "',price=" + price + " where id = " + id);
        stmt.close();
        return "redirect:index";
    }

    @RequestMapping("/edit_ajax")
    @ResponseBody  //返回数据 json使用gson包进行转换。
    public Object edit_ajax(HttpServletRequest req) throws SQLException {
        Statement stmt = Sql_tool.getCon().createStatement();
        String id = req.getParameter("id");
        ResultSet data_1 = stmt.executeQuery("select * from book where id = " + id);
        data_1.next();
        String price = data_1.getString("price");
        String name = data_1.getString("name");
        String author = data_1.getString("author");
        u_f a = new u_f();
        a.setId(id);
        a.setName(name);
        a.setPrice(price);
        a.setAuthor(author);
        stmt.close();
        return a;
    }

    @RequestMapping("/save_ajax")
    @ResponseBody
    public String save_ajax(HttpServletRequest req){
        try {
            Statement stmt = Sql_tool.getCon().createStatement();
            String author = req.getParameter("author");
            String id = req.getParameter("id");
            String name = req.getParameter("name");
            String price = req.getParameter("price");
            stmt.executeUpdate("UPDATE book set name='" + name + "', author='" + author + "',price=" + price + " where id = " + id);
            stmt.close();
        }catch (SQLException e){
            e.printStackTrace();
            return "0";
        }
        return "1";
    }

}
