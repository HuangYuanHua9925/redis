package com.mybatis.dao;

import org.apache.ibatis.annotations.ResultType;
import org.apache.ibatis.annotations.Select;

import com.mybatis.model.User;

public interface UserMapper {
	@Select("select * from user where id=#{id}")
	@ResultType(com.mybatis.model.User.class)
	User selectByPrimaryKey(Integer id);
}
