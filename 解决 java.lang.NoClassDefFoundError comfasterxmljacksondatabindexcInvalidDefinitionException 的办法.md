# 解决 java.lang.NoClassDefFoundError: com/fasterxml/jackson/databind/exc/InvalidDefinitionException 的办法

## 原因：Spring版本与jackson版本不兼容

## 办法：将jackson的版本升级到更高版本即可

pom.xml中依赖的写法如下：

> ```xml
> <dependency>  
>     <groupId>com.fasterxml.jackson.core</groupId>  
>     <artifactId>jackson-databind</artifactId>
>     <version>2.9.5</version>
> </dependency>
> ```