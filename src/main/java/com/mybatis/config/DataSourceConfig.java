package com.mybatis.config;

import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;

import com.alibaba.druid.pool.DruidDataSource;

@Configuration
public class DataSourceConfig {
	
	Logger logger = Logger.getLogger(DataSourceConfig.class);
	@Value("${spring.datasource.url}")
	private String dbUrl;
	@Value("${spring.datasource.url2}")
	private String db2Url;
	@Value("${spring.datasource.username}")
	private String username;

	@Value("${spring.datasource.password}")
	private String password;

	@Value("${spring.datasource.driver-class-name}")
	private String driverClassName;

	@Value("${spring.datasource.initialSize}")
	private int initialSize;

	@Value("${spring.datasource.minIdle}")
	private int minIdle;

	@Value("${spring.datasource.maxActive}")
	private int maxActive;

	@Value("${spring.datasource.maxWait}")
	private int maxWait;

//	@Bean("dataSource1") // 声明其为Bean实例
//	@Primary // 在同样的DataSource中，首先使用被标注的DataSource
	public DataSource dataSource1() {
		DruidDataSource datasource = new DruidDataSource();
		datasource.setUrl(this.dbUrl);
		datasource.setUsername(username);
		datasource.setPassword(password);
		datasource.setDriverClassName(driverClassName);
		datasource.setInitialSize(initialSize);
		datasource.setMinIdle(minIdle);
		datasource.setMaxActive(maxActive);
		datasource.setMaxWait(maxWait);
		return datasource;
	}

	public DataSource DataSource2() {
		
		DruidDataSource datasource = new DruidDataSource();
		datasource.setUrl(db2Url);
		datasource.setUsername(username);
		datasource.setPassword(password);
		datasource.setDriverClassName(driverClassName);
		datasource.setInitialSize(initialSize);
		datasource.setMinIdle(minIdle);
		datasource.setMaxActive(maxActive);
		datasource.setMaxWait(maxWait);

		return datasource;
	}
	
	@Bean
	@Primary//优先使用这个DataSource
	public DataSource DynamicDataSource(){
		Map<Object,Object> targetDataSources =new HashMap<Object, Object>();
		targetDataSources.put("dataSource1", dataSource1());
		targetDataSources.put("dataSource2", DataSource2());
		DynamicDataSource dynamicDataSource = new DynamicDataSource();
		dynamicDataSource.setDefaultTargetDataSource(dataSource1());
		dynamicDataSource.setTargetDataSources(targetDataSources);
		return dynamicDataSource;
	}
}