package cn.edu.kmust.camret.spring.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * 
 * @author Zhaoshiyu
 *
 */
@Controller
public class IndexController {
	
	// 欢迎页面
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String welcome() {
		return "forward:/index";
	}

	// 首页
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView index() {
		return new ModelAndView();
	}
	
	// 登录页面
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login() {
		return new ModelAndView();
	}
	
}
