package com.dao;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlConfig {
private SqlSessionFactory sqlSessionFactory;
	
	public SqlSessionFactory getSqlSessionFactory() {
		String resource = "db/tip_config.xml";
		
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return sqlSessionFactory;
 }
}
