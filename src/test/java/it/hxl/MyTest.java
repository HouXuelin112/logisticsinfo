package it.hxl;

import org.junit.Test;

import java.text.SimpleDateFormat;
import java.util.Date;

public class MyTest {
    @Test
    public void testP(){
        String issueDate = "2010-12-02";
        String time = "21:45";
        try {
            Date date = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss").parse(issueDate + " " + time + ":32");
            System.out.println(date);
        }catch (Exception e){

        }
    }
}
