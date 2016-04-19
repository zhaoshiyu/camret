package cn.edu.kmust.camret.security.domain;

import java.util.List;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * 
 * @author Zhao Shiyu
 *
 */

@Document(collection = "Secu_User")
public class User {
	
	@Id
	private String id;
//	@NotNull(message = "用户名不能为NULL。")
//	@NotEmpty(message = "用户名不能为空。")
//	@Length(min = 4, max = 20, message = "用户名长度须在4-20个字符之间。")
//	@Pattern(regexp = "[a-zA-Z0-9-_]{4,20}", message = "用户名只能由半角的大写字母、小写字母、数字、连字符（-）和下划线组成。")
	
	@NotNull(message = "邮箱不能为NULL。")
	@NotEmpty(message = "邮箱不能为空。")
	@Pattern(regexp = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,4}$", message = "邮箱名只能由半角的大写字母、小写字母、数字、连字符（-）、.、%、+和下划线组成。")
	@Indexed(unique = true)
	private String username;
	
	@NotNull(message = "密码不能为NULL。")
	@NotEmpty(message = "密码不能为空。")
	@Length(min = 6, max = 30, message = "密码长度须在6-30个字符之间。")
	private String password;
	
	private String name;

	private boolean emailenabled;
	private boolean enabled;
	
	private List<Role> roles;
	
//	private PasswordEncoder encoder = new BCryptPasswordEncoder();
	
	public User(){};
	
	public User(String username, String password, String name) {
		this.username = username;
		this.password = password;
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public boolean isEmailenabled() {
		return emailenabled;
	}

	public void setEmailenabled(boolean emailenabled) {
		this.emailenabled = emailenabled;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}
	
	
}
