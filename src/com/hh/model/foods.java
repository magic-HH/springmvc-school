package com.hh.model;

public class foods {
    String foodsid = "";
    String name ="";
    String orderid="";
    String state="";
    String price="";
    String amount="";
    String img="";
    String comment="";

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public foods() {
    }

    public foods(String foodsid, String name, String orderid, String state, String price, String amount, String img) {
        this.foodsid = foodsid;
        this.name = name;
        this.orderid = orderid;
        this.state = state;
        this.price = price;
        this.amount = amount;
        this.img = img;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getFoodsid() {
        return foodsid;
    }

    public void setFoodsid(String foodsid) {
        this.foodsid = foodsid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getOrderid() {
        return orderid;
    }

    public void setOrderid(String orderid) {
        this.orderid = orderid;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }
}
