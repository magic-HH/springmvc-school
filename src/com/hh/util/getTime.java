package com.hh.util;


import java.text.SimpleDateFormat;
import java.util.Date;

public class getTime {
    public static String gettime(){
        SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");//设置日期格式
        return df.format(new Date()).toString();
    }
}
