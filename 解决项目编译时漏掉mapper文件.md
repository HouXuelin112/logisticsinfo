# 解决项目编译时漏掉mapper文件

在pom.xml文件中的 build 标签下加入

```xml
<resources>
    <resource>
        <directory>src/main/java</directory>
        <includes>
            <include>**/*.properties</include>
            <include>**/*.xml</include>
        </includes>
        <filtering>false</filtering>
    </resource>
</resources>
```

不加则会漏掉mapper.xml文件