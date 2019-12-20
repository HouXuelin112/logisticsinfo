package it.hxl;

import it.hxl.dao.UserDao;
import it.hxl.po.User;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.text.SimpleDateFormat;
import java.util.*;

public class MyTest {

    @Test
    public void testCon(){
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        UserDao userDao = applicationContext.getBean(UserDao.class);
        User user = userDao.findUserByName("hxl112");
        System.out.println(user);
    }

    @Test
    public void testMap(){
        List<Map<String, User>> lists = new ArrayList<>();

        User userL = new User();
        userL.setName("左边");
        User userR = new User();
        userR.setName("右边");

        Map<String, User> map = new HashMap<>();
        map.put("left", userL);
        map.put("right", userR);
        lists.add(map);
        System.out.println(lists.get(0).get("left"));

    }

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
