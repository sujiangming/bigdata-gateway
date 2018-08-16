package com.hncy58.bigdata.gateway.service;

public interface CacheService<T>  {
	
	T getCache(String key);
	void putCache(String key, T value);
	void updateCache(String key, T value);
	void removeCache(String key);
	
	T getHashCache(String key, String hashKey);
	void putHashCache(String key, String hashKey, T value);
	void updateHashCache(String key, String hashKey, T value);
	void remoeHashCache(String key, String hashKey);
}
