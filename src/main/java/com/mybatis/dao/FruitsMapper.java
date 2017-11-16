package com.mybatis.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.ResultType;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.mybatis.model.Fruits;

public interface FruitsMapper {

	@Delete("delete from fruits where f_id=#{f_id}")
	int deleteByPrimaryKey(String f_id);

	@Insert("insert into fruits(f_id,s_id,f_name,f_price) values(#{f_id},#{s_id},#{f_name},#{f_price})")
	int insert(Fruits record);

	@Select("select * from fruits where f_id=#{f_id}")
	@ResultType(com.mybatis.model.Fruits.class)
	Fruits selectByPrimaryKey(String f_id);
	
	@Update("update fruits set f_name=#{f_name},s_id=#{s_id},f_price=#{f_price} where f_id=#{f_id}")
	int updateByPrimaryKey(Fruits record);

	
	@Select(value="select * from fruits")
	@ResultType(value=com.mybatis.model.Fruits.class)
	 List<Fruits> getAllFruits();
}