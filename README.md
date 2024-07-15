# 医院管理系统

## 项目结构

## 开发规则

### 数据库连接

在`resources/mybatis-config.xml`中配置数据库连接信息，确保你的医院管理系统名称为`hospitaldb`，用户名为`root`，密码为修改为你自己的

```xml
<dataSource type="POOLED">
    <property name="driver" value="com.mysql.cj.jdbc.Driver"/>
    <property name="url" value="jdbc:mysql://127.0.0.1:3306/hospitaldb?useUnicode=true&amp;characterEncoding=utf8"/>
    <property name="username" value="root"/>
    <property name="password" value="YourPassword"/>
</dataSource>
```

## Git浅解