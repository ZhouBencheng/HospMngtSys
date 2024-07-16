# 医院管理系统

## 1. 项目介绍

### 1.1 简介 

本医院管理系统将基于MVC(Model, View, Controller)设计模式进行开发，为**患者**，**医生**，**管理员**三类人群提供不同的功能和操作权限

### 1.2 目录介绍
本项目的开发者最需要的目录**有三个**，分别为`src/main/java`、`src/main/resources`和`src/test/webapp`。

```
java/com/hi/hospital  
├── entity --------------------------------- 实体类
├── mapper --------------------------------- 映射器接口
├── service -------------------------------- 业务层（Model）
└── utils ---------------------------------- 工具类（提供静态方法）

resources
├── com/hi/hospital/mapper ----------------- 映射器XML文件
└── mybatis-config.xml --------------------- MyBatis配置文件

webapp
├── WEB-INF -------------------------------- 这个不管
├── css ------------------------------------ CSS样式
├── js ------------------------------------- js动态效果
├── images --------------------------------- 图床存放
├── view ----------------------------------- 视图层（View）
│   ├── admin ------------------------------ 管理员视图
│   └── doctor ----------------------------- 医生视图
└── index.jsp ------------------------------ 首页展示
```

## 2. 开发规则

### 2.1 数据库连接

在`resources/mybatis-config.xml`中配置数据库连接信息，确保你的医院管理系统名称为`hospitaldb`，用户名为`root`，密码为修改为你自己的

```xml
<dataSource type="POOLED">
    <property name="driver" value="com.mysql.cj.jdbc.Driver"/>
    <property name="url" value="jdbc:mysql://127.0.0.1:3306/hospitaldb?useUnicode=true&amp;characterEncoding=utf8"/>
    <property name="username" value="root"/>
    <property name="password" value="YourPassword"/>
</dataSource>
```

### 2.2 代码规范

1. 家人们尽可能为自己写的代码添加注释，函数定义可参照javadoc的编写方式
2. 代码中尽量使用驼峰命名法，类名首字母大写，变量名首字母小写
3. 目录名都采用**小写**，java文件名采用**大驼峰**，xml和jsp文件名采用**小写+下划线**的方式

## 3. Git浅解
参考南大PA课程的Git快速入门，[点击这里](https://nju-projectn.github.io/ics-pa-gitbook/ics2024/git.html)

## 4.test