package com.hh.controller;


import com.hh.model.foodSimple;
import com.hh.model.foods;
import com.hh.model.msgs;
import com.hh.model.orders;
import com.hh.util.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;


@Controller
@RequestMapping("/backstage")//静态文件路径设置
public class backstage {
    @RequestMapping("/login")
    public String login(HttpServletRequest request) {

        return "/login";//后期添加
    }

    @RequestMapping("/login_do")
    @ResponseBody
    public String login_do(HttpServletRequest request, HttpSession httpSession) {
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        try {
            Statement stmt = Sql_tool.getCon().createStatement();
            ResultSet data_1 = stmt.executeQuery("select * from user where name='" + name + "'");
            if (data_1.next()) {
                if (data_1.getString("password").equals(password)) {
                    httpSession.setAttribute("name", name);
                    httpSession.setAttribute("img", data_1.getString("img"));
                    httpSession.setAttribute("id", data_1.getString("id"));
                    httpSession.setAttribute("level", data_1.getString("levels"));
                    stmt.close();
                    return "1";
                } else {
                    stmt.close();
                    return "3";
                }
            } else {
                stmt.close();
                return "2";
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return "0";
        }
    }

    @RequestMapping("/getCaptcha")
    @ResponseBody
    public String getCaptcha(HttpServletRequest request, HttpSession httpSession) {
        try {
            String captcha = Captcha.getCaptcha();
            String Email_adder = request.getParameter("email");
            SendMail.senddata(Email_adder, captcha);
            httpSession.setAttribute("code", captcha);
        } catch (NullPointerException e) {
            e.printStackTrace();
            return "0";
        } catch (Exception e) {
            e.printStackTrace();
            return "0";
        }
        return "1";
    }

    @RequestMapping("/register")
    public String register() {
        return "register";
    }

    @RequestMapping("/register_do")
    @ResponseBody
    public String register_do(HttpServletRequest request, HttpSession httpSession) throws SQLException {
        String pageCaptcha = httpSession.getAttribute("code").toString();
        String putCaptcha = request.getParameter("code");
        String levelMark = request.getParameter("level");
        String name = request.getParameter("name");
        String password = request.getParameter("password1");
        String Email = request.getParameter("email");
        String img = "http://school-course-h.oss-cn-hangzhou.aliyuncs.com/img/head.jpg";
        Statement stmt = Sql_tool.getCon().createStatement();
        if (pageCaptcha.equals(putCaptcha)) {//默认头像
            httpSession.setAttribute("code", "");
            ResultSet data_1 = stmt.executeQuery("select * from user where name='" + name + "'");
            if (data_1.next()) {
                stmt.close();
                return "0";
            }
            if (levelMark.equals("0"))// levelmark  0 普通用户
            {
                stmt.executeUpdate("insert into user set name='" + name + "', password='" + password + "',img='" + img + "', email='" + Email + "', levels=0");
            } else if (levelMark.equals("1")) //levelmark 1 商家
            {
                stmt.executeUpdate("insert into user set name='" + name + "', password='" + password + "',img='" + img + "', email='" + Email + "', levels=1");

            } else {
                stmt.close();
                return "3"; // 未选择类别
            }
        } else {
            stmt.close();
            return "2";// 验证码错误页面
        }
        stmt.close();
        return "1";//成功
    }

    @RequestMapping("/forgot-password")
    public String forgetPwd() {
        return "forget-password";
    }

    @RequestMapping("/forgot-password-do")
    @ResponseBody
    public String forgetPwdDo(HttpServletRequest request) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        try {
            Statement stmt = Sql_tool.getCon().createStatement();
            ResultSet data_1 = stmt.executeQuery("select * from user where name='" + name + "'");
            if (data_1.next()) {
                if (data_1.getString("email").equals(email)) {
                    String newPwd = Captcha.getCaptcha();
                    String msgHead = "您的密码重置为：";
                    SendMail.senddata(email, msgHead + newPwd, "重置密码");
                    stmt.executeUpdate("UPDATE user set password='" + newPwd + "' where name = '" + name + "'");
                    stmt.close();
                    return "1";
                } else {
                    stmt.close();
                    return "3";
                }
            } else {
                stmt.close();
                return "2";
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return "0";
        } catch (Exception e) {
            e.printStackTrace();
            return "0";
        }
    }

    @RequestMapping("/change_msg")
    public String change_msg(HttpServletRequest request, HttpSession httpSession) throws SQLException {
        String id = "";
        try {
            id = httpSession.getAttribute("id").toString();
        } catch (NullPointerException e) {
            e.printStackTrace();
            return "redirect:login";
        }
//        String id = "3";
        if (id == "" || id == null) {
            return "redirect:login";
        }
        Statement stmt = Sql_tool.getCon().createStatement();
        ResultSet data_1 = stmt.executeQuery("select * from user where id=" + id);
        data_1.next();
        String name = data_1.getString("name");
        String email = data_1.getString("email");
        String pwd = data_1.getString("password");
        String local = data_1.getString("local");
        String img = data_1.getString("img");
        Map<String, String> map = new HashMap<String, String>();
        map.put("id", id);
        map.put("name", name);
        map.put("pwd", pwd);
        map.put("address", local);
        map.put("email", email);
        map.put("img", img);
        request.setAttribute("datas", map);
        stmt.close();
        return "change_msg";
    }

    @RequestMapping("/change_msg_get")
    @ResponseBody
    public Object change_msg_get(HttpSession httpSession) throws SQLException {

        return "";
    }

    @RequestMapping("/change_msg_do")
    @ResponseBody
    public String change_msg_do(HttpServletRequest request, HttpSession httpSession) {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String local = request.getParameter("local");
        String password = request.getParameter("password");
        String pageCaptcha = httpSession.getAttribute("code").toString();
        String code = request.getParameter("code");
        if (!pageCaptcha.equals(code)) {
            return "2";
        }
        httpSession.setAttribute("code", "");
        try {
            Statement stmt = Sql_tool.getCon().createStatement();
            stmt.executeUpdate("UPDATE user set name='" + name + "', password='" + password + "', email='" + email + "', local= '" + local + "' where id =" + id);
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
            return "0";
        }
        return "1";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession httpSession) {
        httpSession.invalidate();
        return "redirect:login";
    }

    @RequestMapping("/getNotice")
    @ResponseBody
    public Object getNotice(HttpServletRequest request, HttpSession httpSession) {
        String id = "";
        int count = 0;
        try {
            id = httpSession.getAttribute("id").toString();
            Statement stmt = Sql_tool.getCon().createStatement();
            ResultSet data_count = stmt.executeQuery("select COUNT(*) as count from msg WHERE msg.user=" + id + " and msg.readmark = 0 ORDER BY id DESC");
            data_count.next();
            count = data_count.getInt("count");
            int loopNum = 0;
            if (count == 0) {
                stmt.close();
                return "0";
            } else if (count < 5) {
                ResultSet data_1 = stmt.executeQuery("select * from msg WHERE msg.user=" + id + " and msg.readmark = 0 ORDER BY id DESC");
                Map<String, Map> mapAll = new HashMap<String, Map>();
                while (data_1.next()) {
                    Map<String, String> map = new HashMap<String, String>();
                    String msgs = data_1.getString("msgs");
                    String time = data_1.getString("msgtime");
                    if (time == null || time.equals("")) {
                        time = getTime.gettime();
                    }
                    String msgtype = data_1.getString("msgtype");
                    String orderid = data_1.getString("orderid");
                    map.put("id", id);
                    map.put("msgtype", msgtype);
                    map.put("msgs", msgs);
                    map.put("orderid", orderid);
                    map.put("time", time.substring(0, 10));
                    mapAll.put(String.valueOf(loopNum), map);
                    loopNum++;
                }
                stmt.close();
                return mapAll;
            } else if (count >= 5) {
                ResultSet data_1 = stmt.executeQuery("select * from msg WHERE msg.user=" + id + " and msg.readmark = 0 ORDER BY id DESC LIMIT 0,5");

                Map<String, Map> mapAll = new HashMap<String, Map>();
                while (data_1.next()) {

                    Map<String, String> map = new HashMap<String, String>();
                    String msgtype = data_1.getString("msgtype");
                    String orderid = data_1.getString("orderid");
                    String msgs = data_1.getString("msgs");
                    String time = data_1.getString("msgtime");
                    if (time == null || time.equals("")) {
                        time = getTime.gettime();
                    }
                    map.put("id", id);
                    map.put("msgs", msgs);
                    map.put("msgtype", msgtype);
                    map.put("orderid", orderid);
                    map.put("time", time.substring(0, 10));

                    mapAll.put(String.valueOf(loopNum), map);
                    loopNum++;
                }
                stmt.close();
                return mapAll;
            }
        } catch (NullPointerException e) {
            e.printStackTrace();

            return "0";
        } catch (SQLException e) {
            e.printStackTrace();

            return "0";
        }

        return "0";
    }

    @RequestMapping("/msgShow")
    public String msgShow(HttpServletRequest request, HttpSession httpSession) {
        String id = "1";

        try {
            id = httpSession.getAttribute("id").toString();
        } catch (NullPointerException e) {
            e.printStackTrace();
            return "login";
        }

        int page = -1;

        try {
            if (request.getParameter("page") == null) {
                page = 0;
            } else {
                page = Integer.parseInt(request.getParameter("page"));
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            page = 0;
        }
        try {
            Statement stmt = Sql_tool.getCon().createStatement();
            ResultSet data_count = stmt.executeQuery("select COUNT(*) as count from msg WHERE msg.user=" + id + " and msg.readmark = 0 ORDER BY id DESC");
            data_count.next();
            int DBcount = data_count.getInt("count");
            int pageNum = 8;
            int maxPage = (int) Math.ceil((float) DBcount / (float) pageNum);
            ResultSet data_1 = null;
            if (DBcount > pageNum) {
                data_1 = stmt.executeQuery("select * from msg where msg.user=" + id + " and msg.readmark = 0 ORDER BY id DESC limit " + page * pageNum + "," + pageNum);
            } else {
                data_1 = stmt.executeQuery("select * from msg where msg.user=" + id + " and msg.readmark = 0 ORDER BY id DESC");
            }
            ArrayList<msgs> msgDatas = new ArrayList<msgs>();
            while (data_1.next()) {
                msgs msgData = new msgs();
                String msgtime = data_1.getString("msgtime");
                String msgId = data_1.getString("id");
                String msguser = data_1.getString("user");
                String msgD = data_1.getString("msgs");
                String foods = data_1.getString("foodsid");
                String msgorder = data_1.getString("orderid");
                String msgtypes = data_1.getString("msgtype");
                if (msgtime == null || msgtime.equals("")) {
                    msgtime = getTime.gettime().substring(0, 10);
                }
                msgtime = msgtime.substring(0, 10);
                msgData.setFoodsid(foods);
                msgData.setOrderid(msgorder);
                msgData.setId(msgId);
                msgData.setMsg(msgD);
                msgData.setUser(msguser);
                msgData.setMsgtype(msgtypes);
                msgData.setMsgtime(msgtime);
                msgDatas.add(msgData);
            }
            request.setAttribute("msgData", msgDatas);
            request.setAttribute("pageNum", maxPage);
            request.setAttribute("pagenow", page);
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "msgShow";
    }

    @RequestMapping("/msgShowDone")
    public String msgShowRead(HttpServletRequest request, HttpSession httpSession) {
        String id = "";
        try {

            id = httpSession.getAttribute("id").toString();

        } catch (NullPointerException e) {
            e.printStackTrace();
            return "login";
        }
        int page = 0;

        try {
            if (request.getParameter("page") == null) {
                page = 0;
            } else {
                page = Integer.parseInt(request.getParameter("page"));
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            page = 0;
        }
        try {
            Statement stmt = Sql_tool.getCon().createStatement();
            ResultSet data_count = stmt.executeQuery("select COUNT(*) as count from msg WHERE msg.user=" + id + " and msg.readmark = 1 ORDER BY id DESC");
            data_count.next();
            int DBcount = data_count.getInt("count");
            int pageNum = 8;
            int maxPage = (int) Math.ceil((float) DBcount / (float) pageNum);
            ResultSet data_1 = null;
            if (DBcount > pageNum) {
                data_1 = stmt.executeQuery("select * from msg where msg.user=" + id + " and msg.readmark = 1 ORDER BY id DESC limit " + page * pageNum + "," + pageNum);
            } else {
                data_1 = stmt.executeQuery("select * from msg where msg.user=" + id + " and msg.readmark = 1 ORDER BY id DESC");
            }
            ArrayList<msgs> msgDatas = new ArrayList<msgs>();

            while (data_1.next()) {
                msgs msgData = new msgs();
                String msgId = data_1.getString("id");
                String msguser = data_1.getString("user");
                String msgD = data_1.getString("msgs");
                String msgtypes = data_1.getString("msgtype");
                String msgorder = data_1.getString("orderid");
                String msgtime = data_1.getString("msgtime");
                if (msgtime == null || msgtime.equals("")) {
                    msgtime = getTime.gettime().substring(0, 10);
                }
                msgtime = msgtime.substring(0, 10);
                msgData.setId(msgId);
                msgData.setMsg(msgD);
                msgData.setOrderid(msgorder);
                msgData.setUser(msguser);
                msgData.setMsgtype(msgtypes);
                msgData.setMsgtime(msgtime);
                msgDatas.add(msgData);

            }
            request.setAttribute("msgData", msgDatas);
            request.setAttribute("pageNum", maxPage);
            request.setAttribute("pagenow", page);
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "msgShowRead";
    }

    @RequestMapping("/changePresonMsg")
    public String changeMsg(HttpServletRequest request, HttpSession httpSession) throws SQLException {
        String msgid = "";
        String getjob = "";
        String foodsid = "";
        try {
            msgid = request.getParameter("msgid");
            getjob = request.getParameter("getjob");
            foodsid = request.getParameter("foodsid");
        } catch (NullPointerException e) {
            e.printStackTrace();
            return "redirect:msgShow";
        }
        if (getjob.equals("-1")) {
            msgRead.eraseMark(msgid);
        } else if (getjob.equals("1")){
            msgRead.eraseMark(msgid);
            orderStateChange.stateChange(foodsid,"3");
        }else if(getjob.equals("0"))
        {
            msgRead.eraseMark(msgid);
            orderStateChange.stateChange(foodsid,"2");
        }else if(getjob.equals("1"))
        {
            msgRead.eraseMark(msgid);
            orderStateChange.stateChange(foodsid,"3");
        }
        return "redirect:msgShow";
    }
    @RequestMapping("/vieworder")
    public String viewOrder(HttpServletRequest request,HttpSession httpSession) throws SQLException {
        String level = "";
        String id = "";
        try{
            level = httpSession.getAttribute("level").toString();
            id = httpSession.getAttribute("id").toString();
        }catch (NullPointerException e) {
            e.printStackTrace();
            return "login";
        }
        ArrayList<orders> ordersAll = new ArrayList<orders>();
        ArrayList<String> ordersId = new ArrayList<String>();
        Statement stmt = Sql_tool.getCon().createStatement();
        ResultSet dataId=null;
        if(level.equals("0")) {
            dataId = stmt.executeQuery("select id FROM orders WHERE orders.`user`= "+id+" ORDER BY id desc");
        }else{
            dataId = stmt.executeQuery("select id FROM orders WHERE orders.`store`= "+id+" ORDER BY id desc");
        }
        while(dataId.next()){
            ordersId.add(dataId.getString("id"));
        }
        stmt.close();
        for(String i:ordersId){
            Statement stmt2 = Sql_tool.getCon().createStatement();
            ResultSet data_food = stmt2.executeQuery("select foods.id as id,food.img as img,food.name as `name`,foods.`order` as ordersid ,foods.state AS state,food.price AS price,foods.amount as amount FROM foods INNER JOIN food on foods.food=food.id WHERE foods.state !=7 and foods.`order` = "+i+"  ORDER BY foods.id desc ");
            orders temp_order = new orders();
            ArrayList<foods> temp_fs = new ArrayList<foods>();
            while(data_food.next())
            {
                foods temp_food = new foods();
                temp_food.setFoodsid(data_food.getString("id"));
                temp_food.setName(data_food.getString("name"));
                temp_food.setOrderid(data_food.getString("ordersid"));
                temp_food.setImg(data_food.getString("img"));
                temp_food.setState(data_food.getString("state"));
                temp_food.setPrice(data_food.getString("price"));
                temp_food.setAmount(data_food.getString("amount"));
                temp_fs.add(temp_food);
            }
            stmt2.close();
            Statement stmt3 = Sql_tool.getCon().createStatement();
            ResultSet dataOrder = stmt3.executeQuery("select * FROM orders WHERE orders.`id`= "+i);
            dataOrder.next();
            temp_order.setUser(dataOrder.getString("user"));
            temp_order.setStore(dataOrder.getString("store"));
            temp_order.setTime(dataOrder.getString("time"));
            temp_order.setRemarks(dataOrder.getString("remarks"));
            temp_order.setOrdertype(dataOrder.getString("ordertype"));
            temp_order.setFoodData(temp_fs);
            stmt3.close();
            ordersAll.add(temp_order);
        }
        request.setAttribute("data",ordersAll);
        return "vieworder";
    }
    @RequestMapping("/changeOrderState")
    public String changeOrderState(HttpServletRequest request,HttpSession httpSession) throws SQLException {
        String orderid = "";
        String level = "";
        try{
            orderid = request.getParameter("orderid");
            level = request.getParameter("level");
        }catch (NullPointerException e){
            e.printStackTrace();
            return "redirect:login";
        }
        ArrayList<foods> dataset = new ArrayList<foods>();
        Statement stmt_1 = Sql_tool.getCon().createStatement();
        ResultSet data_food = stmt_1.executeQuery("select foods.id as id,food.img as img,food.name as `name`,foods.`order` as ordersid ,foods.state AS state,food.price AS price,foods.amount as amount FROM foods INNER JOIN food on foods.food=food.id WHERE foods.state !=7 and foods.`order` = "+orderid +"  ORDER BY foods.id desc ");
        while(data_food.next())
        {
            foods temp_food = new foods();
            temp_food.setOrderid(data_food.getString("ordersid"));
            temp_food.setImg(data_food.getString("img"));
            temp_food.setFoodsid(data_food.getString("id"));
            temp_food.setName(data_food.getString("name"));

            temp_food.setState(data_food.getString("state"));
            temp_food.setPrice(data_food.getString("price"));
            temp_food.setAmount(data_food.getString("amount"));
            dataset.add(temp_food);
        }
        stmt_1.close();
        request.setAttribute("dataset",dataset);
        request.setAttribute("orderid",orderid);
        return "changeOrderState";
    }
    @RequestMapping("/changeFoodState")
    public String changeFoodState(HttpServletRequest request) throws SQLException {
        String orderget="";
        String orderid = "";
        String foodsid = "";
        String ordersend = "";
        try {
            orderget = request.getParameter("orderget");
            orderid = request.getParameter("orderid");
            foodsid = request.getParameter("foodsid");
            ordersend = request.getParameter("foodsid");
        }catch (NullPointerException e)
        {
            e.printStackTrace();
            orderget="";
        }
        try{
            foodsid = request.getParameter("foodsid");
            ordersend = request.getParameter("foodsid");
        }catch  (NullPointerException e)
        {
            e.printStackTrace();
            ordersend="";
        }
        if(orderget==null||orderget.equals("")){

        }else{
            if(orderget.equals("get")){
                orderStateChange.stateChange(foodsid,"5");
            }
        }
        if(ordersend==null||ordersend.equals("")){

        }else{
            if(ordersend.equals("send")){
                orderStateChange.stateChange(foodsid,"4");
            }
        }
        return "redirect:vieworder";
    }
    @RequestMapping("/comment")
    public String comment(HttpServletRequest request,HttpSession httpSession) throws SQLException {
        String orderid = "";
        orderid = request.getParameter("oredrid");
        Statement stmt2 = Sql_tool.getCon().createStatement();
        ResultSet data_food = stmt2.executeQuery("select foods.id as id,food.img as img,food.name as `name`,foods.`order` as ordersid ,foods.state AS state,food.price AS price,foods.amount as amount FROM foods INNER JOIN food on foods.food=food.id WHERE foods.state !=7 and foods.`order` = "+orderid+"  ORDER BY foods.id desc ");
        ArrayList<foods> temp_fs = new ArrayList<foods>();
        while(data_food.next())
        {   Statement stmt3 = Sql_tool.getCon().createStatement();
            String foods_id = data_food.getString("id");
            foods temp_food = new foods();
            temp_food.setState(data_food.getString("state"));
            temp_food.setPrice(data_food.getString("price"));
            temp_food.setFoodsid(foods_id);
            temp_food.setName(data_food.getString("name"));
            temp_food.setOrderid(data_food.getString("ordersid"));
            temp_food.setImg(data_food.getString("img"));
            temp_food.setAmount(data_food.getString("amount"));
            ResultSet data_comment = stmt3.executeQuery("SELECT `comment` from feedbacks where foods = "+foods_id);
            data_comment.next();
            String d_comment= "";
            try {
                d_comment = data_comment.getString("comment");
            }catch (SQLException e){
                d_comment = "无";
            }
            if(d_comment==null ||d_comment.equals(""))
            {
                d_comment="无";
            }
            temp_food.setComment(d_comment);
            stmt3.close();
            temp_fs.add(temp_food);
        }
        stmt2.close();
        request.setAttribute("dataset",temp_fs);
        return "comment";
    }
    @RequestMapping("/viewProduct")
    public String viewProduct(HttpServletRequest request,HttpSession httpSession) throws SQLException {
        String userid = httpSession.getAttribute("id").toString();
        Statement stmt2 = Sql_tool.getCon().createStatement();
        ResultSet data_food = stmt2.executeQuery("SELECT * from food where food.store="+userid);
        ArrayList<foodSimple> foodList = new ArrayList<foodSimple>();
        while(data_food.next()){
            foodSimple temp_food = new foodSimple();
            temp_food.setDescribe(data_food.getString("describe"));
            temp_food.setName(data_food.getString("name"));
            temp_food.setImg(data_food.getString("img"));
            temp_food.setPrice(data_food.getString("price"));
            foodList.add(temp_food);
        }
        request.setAttribute("dataset",foodList);
        return "viewproduct";
    }

}
