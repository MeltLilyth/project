package pojo;

import java.text.SimpleDateFormat;

public class Date {
    public String getDate(){
        java.util.Date date = new java.util.Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String str = df.format(date);
        return str;
    }
}
