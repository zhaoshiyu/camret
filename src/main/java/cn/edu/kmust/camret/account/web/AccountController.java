package cn.edu.kmust.camret.account.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import cn.edu.kmust.camret.security.domain.User;
import cn.edu.kmust.camret.security.repository.UserRepository;

/**
 * 
 * @author Zhao Shiyu
 *
 */
@Controller
@RequestMapping(value = "/account")
public class AccountController {
	
	@Autowired
	private UserRepository userRepository;
	
	/**
	 * 获取user
	 * @return
	 */
	@RequestMapping(value = "/recruit", method = RequestMethod.GET)
	public ModelAndView getUser(@RequestParam(required=false) String id, String addFlag) {
		ModelAndView mav = new ModelAndView();
		if (id != null) {
			if (!id.trim().isEmpty()) {
				mav.addObject("user", userRepository.findOne(id));
			}
		}
		if (addFlag != null) {
			mav.addObject("returnFlag", 1);
		}
		List<User> users = (List<User>) userRepository.findAll();
		mav.addObject("users", users);
		return mav;
	}

}
