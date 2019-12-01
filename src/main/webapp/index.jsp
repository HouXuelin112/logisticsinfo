<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/static/images/logistics.png" type="image/png"/>
    <title>物流信息网</title>
    <style type="text/css">
        body{
            margin: 0;
            padding: 0;
            background-color: white;
        }
        div{
            border: 1px solid grey;
            margin: 80px auto;
            width: 95%;
            min-width: 1000px;
            height: 700px;
            background-color: azure;
            background-repeat: no-repeat;
            background-size: cover;
        }
        ul{
            margin: 80px 0;
            padding: 0;
            list-style: none;
            text-align: center;
            background-color: darkkhaki;
            opacity: 0.7;
        }
        li{
            margin: 10px;
            display: inline-block;
        }
        img{
            width: 150px;
            height: 150px;
            padding: 0;
            vertical-align: middle;
        }
        .log{
            text-decoration: none;
            color: black;
            font-size: 45px;
            font-family: "微软雅黑";
            font-weight: bold;
        }
        #wel{
            margin-top: 90px;
            width: 100%;
            text-align: center;
            font-size: 4rem;
            font-weight: bolder;
            font-family: STXingkai;
        }
        #reg{
            border: 1px dotted #000000;
            float: right;
        }
        p a img{
            width: 20px;
            height: 20px;
            vertical-align: middle;
        }
    </style>
</head>
<body>
<div>
    <p id="reg">还没有身份?<a href="${pageContext.request.contextPath }/regist" id="reg1" target="_blank"> <img src="${pageContext.request.contextPath }/static/images/regist.png">点击注册&gt;&gt;</a> </p>
    <p id="wel">欢迎来到物流信息网</p>
    <ul>
        <li><a href="${pageContext.request.contextPath }/user/userLogin" class="log" target="_blank">&lt;&lt;会员登陆<img alt="member" src="${pageContext.request.contextPath }/static/images/member.png"></a> </li>
        <li><a href="${pageContext.request.contextPath }/admin/adminLogin" class="log"  target="_blank"><img alt="administer" src="${pageContext.request.contextPath }/static/images/admin.png" >管理员登陆&gt;&gt;</a> </li>
    </ul>
</div>
</body>
</html>
