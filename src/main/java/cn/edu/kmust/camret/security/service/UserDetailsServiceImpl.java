package cn.edu.kmust.camret.security.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import cn.edu.kmust.camret.security.domain.User;
import cn.edu.kmust.camret.security.repository.UserRepository;

@Order(Ordered.HIGHEST_PRECEDENCE + 10)
@Service
public class UserDetailsServiceImpl implements UserDetailsService {
    
    @Autowired
    private UserRepository userRepository;

    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository.findByUsername(username);
        if (user==null)
        	System.out.println("用户" + username + "不存在!");
        return new CurrentUserUtils(user);
    }

}

