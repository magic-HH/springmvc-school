package com.hh.model;

public class msgs {
    String id = "";
    String user = "";
    String msg = "";
    String msgtype = "";
    String orderid = "";
    String msgtime = "";
    String foodsid = "";

    public msgs(String id, String user, String msg, String msgtype, String orderid, String msgtime, String foodsid) {
        this.id = id;
        this.user = user;
        this.msg = msg;
        this.msgtype = msgtype;
        this.orderid = orderid;
        this.msgtime = msgtime;
        this.foodsid = foodsid;
    }

    public String getFoodsid() {
        return foodsid;
    }

    public void setFoodsid(String foodsid) {
        this.foodsid = foodsid;
    }

    public String getMsgtime() {
        return msgtime;
    }

    public void setMsgtime(String msgtime) {
        this.msgtime = msgtime;
    }


    public msgs() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getMsgtype() {
        return msgtype;
    }

    public void setMsgtype(String msgtype) {
        this.msgtype = msgtype;
    }

    public String getOrderid() {
        return orderid;
    }

    public void setOrderid(String orderid) {
        this.orderid = orderid;
    }

}
