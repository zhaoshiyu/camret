package cn.edu.kmust.camret.security.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.edu.kmust.camret.security.domain.User;
import cn.edu.kmust.camret.security.repository.UserRepository;
import cn.edu.kmust.camret.security.service.CurrentUserUtils;
import cn.edu.kmust.camret.security.service.PasswordEncoder;

@Controller
@RequestMapping(value = "/users")
public class UserController {
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	/**
	 * 获取user
	 * @return
	 */
	@RequestMapping(value = "/user", method = RequestMethod.GET)
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
	
	/**
	 * 提交user
	 * @param name
	 * @param email
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/user", method = RequestMethod.POST)
	public String createUser1(User user) throws Exception {
		if (user != null) {
			user.setPassword(passwordEncoder.passwordBCryptEncode(user.getPassword()));
			User u = userRepository.save(user);
			if (u == null) {
				throw new Exception("添加失败！");
			}
		}
		return "redirect:./user";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(String id) throws Exception {
		User user = userRepository.findOne(id);
		if (user == null) {
			throw new Exception("user不存在！");
		}
		userRepository.delete(id);
		return "redirect:./user";
	}

	
	// 用户信息检索
		@RequestMapping(value = "/users", method = RequestMethod.GET)
		@ResponseBody
		public Page<User> search(@PageableDefault Pageable pageable)
				throws Exception {
			// TODO Auto-generated method stub
			Page<User> users = userRepository.findAll(pageable);
			return users;
		}

		@RequestMapping(value = "/user/{id}", method = RequestMethod.GET)
		@ResponseBody
		public User getUser(@PathVariable String id) throws Exception {
			// TODO Auto-generated method stub
			User user = userRepository.findOne(id);
			if (user == null) {
				throw new Exception("用户不存在！");
			}
			return user;
		}
		
		
		

//		@RequestMapping(value = "/user", method = RequestMethod.POST)
//		@ResponseBody
//		public User createUser(@Validated User user) throws Exception {
//			// TODO Auto-generated method stub
//			return userRepository.save(user);
//		}

		@RequestMapping(value = "/user/{id}", method = RequestMethod.PUT)
		@ResponseBody
		public User updateUser(@Validated User user) throws Exception {
			// TODO Auto-generated method stub
			return userRepository.save(user);
		}

		@RequestMapping(value = "/user/{id}", method = RequestMethod.DELETE)
		@ResponseBody
		public User deleteUser(@PathVariable String id) throws Exception {
			// TODO Auto-generated method stub
			User user = userRepository.findOne(id);
			if (user == null) {
				throw new Exception("用户不存在！");
			}

			userRepository.delete(user);

			return user;
		}

		@RequestMapping(value = "/user/self", method = RequestMethod.GET)
		@ResponseBody
		public User getUserSelf() throws Exception {
			// TODO Auto-generated method stub

			User userSelf = userRepository.findOne(CurrentUserUtils.getCurrentUserId());
			if (userSelf == null) {
				throw new Exception("用户不存在！");
			}

			return userSelf;
		}

		@RequestMapping(value = "/user/self", method = RequestMethod.PUT)
		@ResponseBody
		public User updateUserSelf(@Validated User user) throws Exception {
			// TODO Auto-generated method stub

			User userSelf = userRepository.findOne(CurrentUserUtils.getCurrentUserId());
			if (userSelf == null) {
				throw new Exception("用户不存在！");
			}

			userSelf.setUsername(user.getUsername());
			userSelf.setPassword(user.getPassword());

			userRepository.save(userSelf);

			return userSelf;
		}
}
