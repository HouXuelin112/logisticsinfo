# 自己创建jstl

## 1. 在pom.xml中引入依赖

> ```xml
> <dependency>  
>     <groupId>javax.servlet.jsp</groupId>  
>     <artifactId>jsp-api</artifactId>  
>     <version>2.2</version>  
>     <scope>provided</scope>
> </dependency>
> ```

## 2.创建一个Java文件继承TagSupport实现doTag()方法

```java
package it.hxl.jstltag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
@SuppressWarnings("serial")
public class DateTag extends TagSupport {

    private Date date;
    @Override
    public int doEndTag() throws JspException {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String targetTime = format.format(date);
        try {
            super.pageContext.getOut().write(targetTime);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return super.doEndTag();
    }

    public void setDate(Date date){
        this.date = date;
    }
}

```

## 3.在WEB-INF目录下创建一个*.tld文件

dateConvert.tld

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE taglib PUBLIC "-//Sun Microsystems, Inc.//DTD JSP Tag Library 1.2//EN"
        "http://java.sun.com/dtd/web-jsptaglibrary_1_2.dtd">
<taglib>
    <tlib-version>1.0</tlib-version>
    <jsp-version>1.2</jsp-version>
    <short-name>ct</short-name>
    <uri>it/hxl/dateConvert</uri>

    <tag>
        <name>formatDate</name>
        <tag-class>it.hxl.jstltag.DateTag</tag-class>
        <body-content>JSP</body-content>
        <attribute>
            <name>date</name>
            <required>true</required>
            <rtexprvalue>true</rtexprvalue>
        </attribute>
    </tag>
</taglib>
```

以上创建完成之后即可在jsp文件引入使用了

```jsp
<%@taglib uri="it/hxl/dateConvert" prefix="d"%>
<d:formatdate date=""></d:formatdate>
```

