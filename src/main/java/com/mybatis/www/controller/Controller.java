package com.mybatis.www.controller;

import java.util.List;

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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mybatis.www.model.Fruits;
import com.mybatis.www.model.Person;
import com.yuan.mybatis.dao.FruitsMapper;
import com.yuan.mybatis.dao.PersonMapper;

@RestController
@EnableAutoConfiguration
@ComponentScan("com.yuan.mybatis")
@MapperScan("com.yuan.mybatis.dao")
@EnableCaching
public class Controller {

	@Autowired
	private FruitsMapper fruitsMapper;
	@Autowired
	private PersonMapper personMapper;
	@Autowired
	private RedisTemplate redisTemplate;
	@Autowired
	private SqlSessionFactory sqlSessionFactory;

	@GetMapping("/fruits")
	@Cacheable(value = "fruits")
	public List<Fruits> getAllFruits() {
		// System.out.println(fruitsMapper.getAllFruits());
		System.out.println(1111);

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
