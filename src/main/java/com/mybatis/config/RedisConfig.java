package com.mybatis.config;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

import org.springframework.cache.annotation.CachingConfigurerSupport;
import org.springframework.cache.interceptor.KeyGenerator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.cache.RedisCacheManager;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.serializer.Jackson2JsonRedisSerializer;

import com.fasterxml.jackson.annotation.PropertyAccessor;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.annotation.JsonAutoDetect;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.mapper.MapperScannerConfigurer;
import org.springframework.cache.CacheManager;
@Configuration
public class RedisConfig extends CachingConfigurerSupport{
	
	@Bean
	@Override
	public KeyGenerator keyGenerator() {
		return new KeyGenerator(){

			@Override
			public Object generate(Object target, Method method, Object... params) {
				StringBuilder sb = new StringBuilder();  
	               sb.append(target.getClass().getName());  
	               sb.append(method.getName());  
	               for (Object obj : params) {  
	                   sb.append(obj.toString());  
	               } 
	               System.out.println(sb.toString());
	               return sb.toString();
			}
			
		};
	}
	
	  @SuppressWarnings("rawtypes")  
	   @Bean  
	   public CacheManager CacheManager(RedisTemplate redisTemplate) {  
	       RedisCacheManager rcm = new RedisCacheManager(redisTemplate);  
	       // 设置cache过期时间,时间单位是秒  
	       rcm.setDefaultExpiration(60);  
	       Map<String, Long> map = new HashMap<String, Long>();  
	       map.put("test", 60L);  
	       rcm.setExpires(map);  
	       return rcm;  
	   }
	  
	  @SuppressWarnings({ "rawtypes", "unchecked" })  
	   @Bean  
	   public RedisTemplate<String, String> redisTemplate(RedisConnectionFactory factory) {  
	       StringRedisTemplate template = new StringRedisTemplate(factory);  
	       Jackson2JsonRedisSerializer jackson2JsonRedisSerializer = new Jackson2JsonRedisSerializer(Object.class);  
	       ObjectMapper om = new ObjectMapper();  
	       om.setVisibility(PropertyAccessor.ALL, JsonAutoDetect.Visibility.ANY);  
	       om.enableDefaultTyping(ObjectMapper.DefaultTyping.NON_FINAL);  
	       jackson2JsonRedisSerializer.setObjectMapper(om);  
	       template.setValueSerializer(jackson2JsonRedisSerializer);  
	       template.afterPropertiesSet();  
	       return template;  
	   }
	  
}
