package com.mybatis.config;

import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

public class DynamicDataSource extends AbstractRoutingDataSource {
   //	返回使用数据源的名字，即存储在targetDataSources中是数据源的key
	protected Object determineCurrentLookupKey() {
		return DBContextHolder.getDBType();
	}

}