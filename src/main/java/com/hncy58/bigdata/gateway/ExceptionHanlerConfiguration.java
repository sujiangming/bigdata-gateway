package com.hncy58.bigdata.gateway;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hncy58.bigdata.gateway.domain.ErrorInfo;
import com.hncy58.bigdata.gateway.exception.PageException;
import com.hncy58.bigdata.gateway.exception.RestfulJsonException;

/**
 * 统一异常处理
 * 
 * @author tdz
 * @company hncy58 长银五八
 * @website http://www.hncy58.com
 * @version 1.0
 * @date 2018年8月8日 下午5:25:07
 */
@Configuration
@ControllerAdvice
public class ExceptionHanlerConfiguration {

	Logger log = LoggerFactory.getLogger(ExceptionHanlerConfiguration.class);

	public static final String DEFAULT_ERROR_VIEW = "error";

	@ExceptionHandler(value = PageException.class)
	public ModelAndView pageExceptionHanler(HttpServletRequest req, Exception e) throws Exception {

		log.error("捕获到全局Page异常:" + e.getMessage(), e);

		ModelAndView mav = new ModelAndView();
		mav.addObject("code", "9997");
		mav.addObject("msg", "捕获到全局Page异常:" + e.getMessage());
		mav.addObject("exception", e);
		mav.addObject("url", req.getRequestURL());
		mav.setViewName(DEFAULT_ERROR_VIEW);

		return mav;
	}

	@ExceptionHandler(value = RestfulJsonException.class)
	@ResponseBody
	public Map<String, Object> restfulJsonException(HttpServletRequest req, Exception e) throws Exception {

		log.error("捕获到全局Restful异常:" + e.getMessage(), e);
		Map<String, Object> ret = new HashMap<>();
		ErrorInfo<Object> err = new ErrorInfo<>();

		err.setMessage(e.getMessage());
		err.setCode(ErrorInfo.ERROR);
		err.setData(e.getCause());
		err.setUrl(req.getRequestURL().toString());

		ret.put("code", "9998");
		ret.put("msg", "捕获到全局API接口异常:" + e.getMessage());
		ret.put("data", err);

		return ret;
	}

	/**
	 * 默认所有异常全部以Json返回，除非有特殊定义
	 * 
	 * @param req
	 * @param e
	 * @return
	 * @throws Exception
	 */
	@ExceptionHandler(value = Exception.class)
	@ResponseBody
	public Map<String, Object> globalException(HttpServletRequest req, Exception e) throws Exception {

		log.error("捕获到全局异常:" + e.getMessage(), e);
		Map<String, Object> ret = new HashMap<>();
		ErrorInfo<Object> err = new ErrorInfo<>();

		err.setMessage(e.getMessage());
		err.setCode(ErrorInfo.ERROR);
		err.setData(e.getCause());
		err.setUrl(req.getRequestURL().toString());

		ret.put("code", "9999");
		ret.put("msg", "捕获到全局异常:" + e.getMessage());
		ret.put("data", err);

		return ret;
	}
}
