package com.mybatis.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.ResultType;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.mybatis.model.Person;

public interface PersonMapper {
	@Delete("delete from person where id=#{id}")
    int deleteByPrimaryKey(Integer id);
	
	@Insert("insert into person(name,age,info) values(#{name},#{age},#{info})")
    int insert(Person record);

    
	@Select("select * from person where id=#{id}")
	@ResultType(com.mybatis.model.Person.class)
    Person selectByPrimaryKey(Integer id);

   @Update("update person set name=#{name},age=#{age},info=#{info} where id=#{id}")
    int updateByPrimaryKey(Person record);
    
    @Select("select * from person")
    @ResultType(com.mybatis.model.Person.class)
    List<Person> getAllPerson();
}