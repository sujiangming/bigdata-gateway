package com.hncy58.bigdata.gateway;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;
import org.springframework.data.redis.core.HashOperations;
import org.springframework.data.redis.core.ListOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.SetOperations;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.data.redis.core.ZSetOperations;
import org.springframework.data.redis.listener.PatternTopic;
import org.springframework.data.redis.listener.RedisMessageListenerContainer;
import org.springframework.data.redis.listener.adapter.MessageListenerAdapter;
import org.springframework.data.redis.serializer.JdkSerializationRedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;

import com.hncy58.bigdata.gateway.msg.receiver.AuthChageRedisMsgReceiver;

/**
 * Redis初始化配置类
 * @author tdz
 * @company hncy58 湖南长银五八
 * @website http://www.hncy58.com
 * @date 2018年8月7日 上午9:33:02
 */
@Configuration
//@EnableRedisHttpSession(maxInactiveIntervalInSeconds = 3600)
public class RedisConfiguration {
	
	/**
	 * Redis消息监听主题
	 */
	@Value("${redis.pubsub.patterntopic:pubsub}")
	private String patternTopic;

	/**
	 * 实例化Redis连接工厂
	 * @return
	 */
	@Bean
	public RedisConnectionFactory redisConnectionFactory() {
		return new JedisConnectionFactory();
	}

	/**
	 * 注入 RedisConnectionFactory
	 */
	@Autowired
	RedisConnectionFactory redisConnectionFactory;

	/**
	 * 利用反射来创建监听到权限变更消息之后的执行方法
	 * @param redisReceiver
	 * @return
	 */
    @Bean
    MessageListenerAdapter listenerAdapter(AuthChageRedisMsgReceiver<?> redisReceiver) {
        return new MessageListenerAdapter(redisReceiver, "receiveMessage");
    }

    /**
     * 实例化Redis消息监听容器
     * @param connectionFactory
     * @param listenerAdapter
     * @return
     */
	@Bean
	RedisMessageListenerContainer container(RedisConnectionFactory connectionFactory,
			MessageListenerAdapter listenerAdapter) {
		
		RedisMessageListenerContainer container = new RedisMessageListenerContainer();
		container.setConnectionFactory(connectionFactory);
		container.addMessageListener(listenerAdapter, new PatternTopic(patternTopic));
		return container;
	}

	/**
	 * 实例化 RedisTemplate 对象
	 *
	 * @return
	 */
	@Bean
	public RedisTemplate<String, Object> functionDomainRedisTemplate() {
		RedisTemplate<String, Object> redisTemplate = new RedisTemplate<>();
		initDomainRedisTemplate(redisTemplate, redisConnectionFactory);
		return redisTemplate;
	}

	/**
	 * 设置数据存入 redis 的序列化方式
	 *
	 * @param redisTemplate
	 * @param factory
	 */
	private void initDomainRedisTemplate(RedisTemplate<String, Object> redisTemplate, RedisConnectionFactory factory) {
		redisTemplate.setKeySerializer(new StringRedisSerializer());
		redisTemplate.setHashKeySerializer(new StringRedisSerializer());
		redisTemplate.setHashValueSerializer(new JdkSerializationRedisSerializer());
		redisTemplate.setValueSerializer(new JdkSerializationRedisSerializer());
		redisTemplate.setConnectionFactory(factory);
	}

	/**
	 * 实例化 HashOperations 对象,可以使用 Hash 类型操作
	 *
	 * @param redisTemplate
	 * @return
	 */
	@Bean
	public HashOperations<String, String, Object> hashOperations(RedisTemplate<String, Object> redisTemplate) {
		return redisTemplate.opsForHash();
	}

	/**
	 * 实例化 ValueOperations 对象,可以使用 String 操作
	 *
	 * @param redisTemplate
	 * @return
	 */
	@Bean
	public ValueOperations<String, Object> valueOperations(RedisTemplate<String, Object> redisTemplate) {
		return redisTemplate.opsForValue();
	}

	/**
	 * 实例化 ListOperations 对象,可以使用 List 操作
	 *
	 * @param redisTemplate
	 * @return
	 */
	@Bean
	public ListOperations<String, Object> listOperations(RedisTemplate<String, Object> redisTemplate) {
		return redisTemplate.opsForList();
	}

	/**
	 * 实例化 SetOperations 对象,可以使用 Set 操作
	 *
	 * @param redisTemplate
	 * @return
	 */
	@Bean
	public SetOperations<String, Object> setOperations(RedisTemplate<String, Object> redisTemplate) {
		return redisTemplate.opsForSet();
	}

	/**
	 * 实例化 ZSetOperations 对象,可以使用 ZSet 操作
	 *
	 * @param redisTemplate
	 * @return
	 */
	@Bean
	public ZSetOperations<String, Object> zSetOperations(RedisTemplate<String, Object> redisTemplate) {
		return redisTemplate.opsForZSet();
	}
}
