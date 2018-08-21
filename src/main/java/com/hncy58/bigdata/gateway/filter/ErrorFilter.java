package com.hncy58.bigdata.gateway.filter;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.netflix.zuul.ZuulFilter;
import com.netflix.zuul.context.RequestContext;

@Component
public class ErrorFilter extends ZuulFilter {
	/**
	 * 错误统一返回码
	 */
	private static final String errorCode = "9995";

    Logger log = LoggerFactory.getLogger(ErrorFilter.class);

    @Override
    public String filterType() {
        return "error";
    }

    @Override
    public int filterOrder() {
        return -1;
    }

    @Override
    public boolean shouldFilter() {
        return true;
    }

    @Override
    public Object run() {
    	
        RequestContext ctx = RequestContext.getCurrentContext();
        Throwable throwable = ctx.getThrowable();
        
        log.error("this is a ErrorFilter : {}", throwable.getCause().getMessage());
//        ctx.set("error.status_code", HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        
        ctx.set("throwable", null);
        ctx.set("sendErrorFilter.ran", true);
        
        return generateResponseBody(ctx, errorCode, throwable.getCause().getMessage());
    }

	private Object generateResponseBody(RequestContext ctx, String code, String msg) {
		Map<String, Object> ret = new HashMap<>();
		ret.put("code", code);
		ret.put("msg", msg);
		// 过滤该请求，不往下级服务去转发请求，到此结束
		ctx.setSendZuulResponse(false);
		ctx.setResponseStatusCode(200);
		ctx.setResponseBody(JSONObject.wrap(ret).toString());
		setResponseAttrs(ctx.getResponse());
		return null;
	}

	/**
	 * 设置响应属性
	 * 
	 * @param response
	 */
	private void setResponseAttrs(HttpServletResponse response) {
		response.setContentType("application/json;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setLocale(new java.util.Locale("zh", "CN"));
	}

}