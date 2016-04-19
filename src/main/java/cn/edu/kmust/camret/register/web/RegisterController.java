package cn.edu.kmust.camret.register.web;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.edu.kmust.camret.security.domain.Role;
import cn.edu.kmust.camret.security.domain.User;
import cn.edu.kmust.camret.security.repository.UserRepository;
import cn.edu.kmust.camret.security.service.PasswordEncoder;

/**
 * 
 * @author Zhao Shiyu
 *
 */
@Controller
public class RegisterController {
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	// 注册页面
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView register() {
		return new ModelAndView();
	}

	//用户注册
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView register(User user) throws Exception {
		ModelAndView map = new ModelAndView();
		if (user != null) {
			user.setPassword(passwordEncoder.passwordBCryptEncode(user.getPassword()));
			user.setRoles(new ArrayList<Role>(){{add(Role.USER);}});
			User u = userRepository.save(user);
			if (u == null) {
				map.addObject("result", "注册失败！");
				throw new Exception("添加失败！");
			} else {
				map.addObject("result", "注册成功，请登录！");
			}
		}
		return map;
	}

}
