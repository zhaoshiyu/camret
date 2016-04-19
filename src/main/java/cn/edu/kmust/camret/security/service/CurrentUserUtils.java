package cn.edu.kmust.camret.security.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

import cn.edu.kmust.camret.security.domain.Role;
import cn.edu.kmust.camret.security.domain.User;

@SuppressWarnings("serial")
public class CurrentUserUtils implements UserDetails{
	
	public static  User getCurrentUser() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		return (User) auth.getPrincipal();
	}

	public static String getCurrentUserId() {
		return getCurrentUser().getId();
	}

	public User user;
	
	public CurrentUserUtils(User user){
		this.user = user;
	}

	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> authList = new ArrayList<GrantedAuthority>();
		if ( user.getRoles() == null ){
			SimpleGrantedAuthority auth = new SimpleGrantedAuthority( Role.ADMIN.name() );
			authList.add(auth);
		}else {
			for (Role role : user.getRoles()) {
				SimpleGrantedAuthority auth = new SimpleGrantedAuthority(role.name());
				authList.add(auth);
			}
		}
		
		return authList;
	}	

	public boolean isAccountNonExpired() {
		return true;
	}

	public boolean isAccountNonLocked() {
		return true;
	}

	public boolean isCredentialsNonExpired() {
		return true;
	}

	public boolean isEnabled() {
		return true;
	}

	public String getPassword() {
		if (user!=null) {
			System.out.println("用户密码： " + user.getPassword());
			return user.getPassword();
		}else {
			return null;
		}
	}

	public String getUsername() {
		return user.getUsername();
	}

}
