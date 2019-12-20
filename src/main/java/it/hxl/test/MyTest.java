package it.hxl.test;

import it.hxl.po.EnterpriseInfo;
import it.hxl.po.User;
import it.hxl.services.EnterpriseService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.text.SimpleDateFormat;
import java.util.*;

public class MyTest {

    @Test
    public void testInsert(){
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        EnterpriseService enterpriseService = applicationContext.getBean(EnterpriseService.class);
        EnterpriseInfo enterpriseInfo = new EnterpriseInfo();
        enterpriseInfo.setId(4);
        enterpriseInfo.setHandset("17857330861");
        User user = new User();
        user.setId(1);
        enterpriseInfo.setUser(user);
        int row = enterpriseService.updateEnterprise(enterpriseInfo);
        System.out.println(row);
    }

    @Test
    public void testCon() throws Exception {
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        EnterpriseService userDao = applicationContext.getBean(EnterpriseService.class);


        EnterpriseInfo enterpriseInfo = new EnterpriseInfo();
        enterpriseInfo.setEnterpriseName("翔基科技股份有限公司");
        enterpriseInfo.setEnterpriseSort("信息科技");
        List<EnterpriseInfo> goods1 = userDao.findByEnterpriseInfo(enterpriseInfo);
        for(EnterpriseInfo good:goods1){
        System.out.println(good);}
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
    public void testSplit(){
        String str = "2019-10-17";
        System.out.println(str.split(" ").length);
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
