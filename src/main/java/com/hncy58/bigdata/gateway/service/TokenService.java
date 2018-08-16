package com.hncy58.bigdata.gateway.service;

public interface TokenService {
	
	String generateToken(int userId);
	
	void removeToken(String token);
	
	boolean validateToken(String token);
	
	Object getCacheFromToken(String token, String key);
	
	void putCacheByToken(String token, String key, Object t);
	
	boolean exists(int userId);
	
	String getToken(int userId);
	
	void putToken(int userId, String token);
	
}
