package cn.edu.kmust.camret.security.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.SecurityProperties;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
@EnableGlobalMethodSecurity(prePostEnabled = true)
@Order(SecurityProperties.ACCESS_OVERRIDE_ORDER)
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private UserDetailsService userDetailsService;    

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth
        		.inMemoryAuthentication()
                .withUser("user").password("password").roles("USER");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
    	/**
        http.authorizeRequests()
                .antMatchers("/", "/index","/register","/bootstrap/**","/public/**").permitAll()
                .antMatchers("/user/**").hasAnyAuthority("USER").anyRequest().fullyAuthenticated()
                .antMatchers("/users/**").hasAuthority("ADMIN").anyRequest().fullyAuthenticated()
                .and()
                .formLogin() .loginPage("/login").defaultSuccessUrl("/users/user").failureUrl("/login?error").usernameParameter("username").permitAll()
                .and()
                .logout().logoutUrl("/logout").logoutSuccessUrl("/").permitAll()
//                .logout().logoutUrl("/logout").deleteCookies("remember-me") .logoutSuccessUrl("/").permitAll()
                .and()
                .rememberMe();
                **/
    	// 设置拦截规则 
    	http.authorizeRequests()
        .antMatchers("/", "/index","/register","/bootstrap/**").permitAll()
        .antMatchers("/account/**").hasAnyAuthority("USER").anyRequest().fullyAuthenticated()
        .antMatchers("/account/**","/crawl/**","/users/**").hasAuthority("ADMIN").anyRequest().fullyAuthenticated();
       
        // 自定义登录页面/account/recruit
        http.csrf().disable().formLogin().loginPage("/login").defaultSuccessUrl("/users/user").failureUrl("/login?error")
        		.loginProcessingUrl("/j_spring_security_check")
        		.usernameParameter("j_username").passwordParameter("j_password").permitAll();
        
        // 自定义注销  
        http.logout().logoutUrl("/logout").logoutSuccessUrl("/")  
                .invalidateHttpSession(true).permitAll();  
  
        // session管理  
        http.sessionManagement().sessionFixation().changeSessionId()  
                .maximumSessions(1).expiredUrl("/");  
    }

    @Override
    public void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(new BCryptPasswordEncoder());
    }
    
//    @Order(Ordered.HIGHEST_PRECEDENCE)
//	@Configuration
//	protected static class AuthenticationSecurity extends
//			GlobalAuthenticationConfigurerAdapter {
//		
//		@Autowired
//		private UserDetailsServiceImpl users;
//		
//		@Autowired
//		private UserRepository userRepository;
//
//		@Override
//		public void init(AuthenticationManagerBuilder auth) throws Exception {
//			
//			PasswordEncoder encoder = new BCryptPasswordEncoder();			
//			auth.userDetailsService(users).passwordEncoder(encoder);
//			
////			if (userRepository.count() == 0){
////				User user = new User();
////				user.setUsername("zsy@qq.com");
////				user.setName("zsy");
////				user.setPassword( encoder.encode("zsy") );
////				userRepository.save(user);
////			}
//		}
//	}

}