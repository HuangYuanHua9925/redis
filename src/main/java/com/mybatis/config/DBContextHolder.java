package com.mybatis.config;

public class DBContextHolder {
	public static final String DATA_SOURCE_DataSource1 = "dataSource1";  
    public static final String DATA_SOURCE_DataSource2 = "dataSource2";  
      
    private static final ThreadLocal<String> contextHolder = new ThreadLocal<String>();  
      
    public static void setDBType(String dbType) {  
        contextHolder.set(dbType);  
    }  
      
    public static String getDBType() {  
        return contextHolder.get();  
    }  
      
    public static void clearDBType() {  
        contextHolder.remove();  
    }  
}
