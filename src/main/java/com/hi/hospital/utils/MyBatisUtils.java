package com.hi.hospital.utils;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;

public class MyBatisUtils {

    /**
     * 获取SqlSession会话，用sqlSession对象获取相应的Mapper映射器
     * @return SqlSession
     */
    public static SqlSession getSqlSession() {
        // 获取MyBatis的全局配置文件mybatis-config.xml
        String resource = "mybatis-config.xml";
        //注意此处变量作用域
        InputStream inputStream = null;
        try {
             inputStream = Resources.getResourceAsStream(resource);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);

        return sqlSessionFactory.openSession(true);
    }
}
