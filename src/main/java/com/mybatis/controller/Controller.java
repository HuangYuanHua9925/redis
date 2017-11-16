package com.mybatis.www.controller;

import java.util.List;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.cache.annotation.Caching;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mybatis.www.model.Fruits;
import com.mybatis.www.model.Person;
import com.yuan.mybatis.dao.FruitsMapper;
import com.yuan.mybatis.dao.PersonMapper;

@RestController
@EnableAutoConfiguration//开启自动配置默认的一些行为
@ComponentScan("com.yuan.mybatis")//spring扫描范围
@MapperScan("com.yuan.mybatis.dao")//扫描mapper接口
@EnableCaching//开启缓存
@EnableTransactionManagement//开启事务管理
public class Controller {

	@Autowired
	private FruitsMapper fruitsMapper;
	@Autowired
	private PersonMapper personMapper;
	@Autowired
	private RedisTemplate redisTemplate;
	
	@Autowired
	private DataSource datasource;
	
	@GetMapping("/fruits")
	@Cacheable(value = "fruits")
	@Transactional
	public List<Fruits> getAllFruits() {
		// System.out.println(fruitsMapper.getAllFruits());
		System.out.println(1111);
		String name="123";
		System.out.println(datasource.getClass());
		return fruitsMapper.getAllFruits();
	}

	@GetMapping("/persons")
	@Cacheable(value = "persons")
	public List<Person> getAllPersons() {
		System.out.println(2222);
		return personMapper.getAllPerson();
	}

	@GetMapping("/del")
	@CacheEvict(value = "persons")
	public String delect() {
		return "helloword";
	}

	public static void main(String[] args) {
		SpringApplication.run(Controller.class, args);
	}

}
