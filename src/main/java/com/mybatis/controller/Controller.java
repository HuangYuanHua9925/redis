package com.mybatis.controller;

import java.util.List;

import javax.sql.DataSource;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mybatis.dao.FruitsMapper;
import com.mybatis.dao.PersonMapper;
import com.mybatis.dao.UserMapper;
import com.mybatis.model.Fruits;
import com.mybatis.model.Person;
import com.mybatis.model.User;

@RestController
@EnableAutoConfiguration//开启自动配置默认的一些行为
@ComponentScan(value={"com.mybatis"})//spring扫描范围
@MapperScan("com.mybatis.dao")//扫描mapper接口
@EnableCaching//开启缓存
@EnableTransactionManagement//开启事务管理
public class Controller {

	@Autowired
	private FruitsMapper fruitsMapper;
	@Autowired
	private PersonMapper personMapper;
	
	@Autowired
	private UserMapper userMapper; 
	@Autowired
	private RedisTemplate redisTemplate;
	@Autowired
	private ApplicationContext applicationContext;	
	
	@Autowired
	private DataSource datasource;
	
	@GetMapping("/test/fruits")
	@Cacheable(value = "fruits")
	@Transactional
	public List<Fruits> getAllFruits() {
		String[] type = applicationContext.getBeanNamesForType(DataSource.class);
		for (int i = 0; i < type.length; i++) {
			System.out.println(type[i]);
		}
		return fruitsMapper.getAllFruits();
	}

	@GetMapping("/test/persons")
	@Cacheable(value = "persons")
	public List<Person> getAllPersons() {
		return personMapper.getAllPerson();
	}

	@GetMapping("/test/del")
	@CacheEvict(value = "persons")
	public String delect() {
		return "helloword";
	}
	
	@GetMapping("/db1/user")
	public User getUserById(){
		return userMapper.selectByPrimaryKey(1);
	}
	
	public static void main(String[] args) {
		SpringApplication.run(Controller.class, args);
	}

}
