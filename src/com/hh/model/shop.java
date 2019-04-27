package com.hh.model;

public class shop {
    String img="";
    String name="";
    String price="";
    String num = "";
    String foodsid="";
    String store="";

    public String getStore() {
        return store;
    }

    public void setStore(String store) {
        this.store = store;
    }

    public shop() {
    }

    public shop(String img, String name, String price, String num, String foodsid) {
        this.img = img;
        this.name = name;
        this.price = price;
        this.num = num;
        this.foodsid = foodsid;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getNum() {
        return num;
    }

    public void setNum(String num) {
        this.num = num;
    }

    public String getFoodsid() {
        return foodsid;
    }

    public void setFoodsid(String foodsid) {
        this.foodsid = foodsid;
    }
}
