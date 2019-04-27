package com.hh.model;

import java.util.ArrayList;

public class orders {
    String user="";
    String store="";
    String time="";
    String remarks = "";
    String ordertype="";
    ArrayList<foods> foodData = null;

    public orders() {
    }

    public orders(String user, String store, String time, String remarks, String ordertype, ArrayList<foods> foodData) {
        this.user = user;
        this.store = store;
        this.time = time;
        this.remarks = remarks;
        this.ordertype = ordertype;
        this.foodData = foodData;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getStore() {
        return store;
    }

    public void setStore(String store) {
        this.store = store;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String getOrdertype() {
        return ordertype;
    }

    public void setOrdertype(String ordertype) {
        this.ordertype = ordertype;
    }

    public ArrayList<foods> getFoodData() {
        return foodData;
    }

    public void setFoodData(ArrayList<foods> foodData) {
        this.foodData = foodData;
    }
}
