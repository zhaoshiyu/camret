package cn.edu.kmust.camret.security.repository;

import org.springframework.data.mongodb.repository.MongoRepository;

import cn.edu.kmust.camret.security.domain.User;

public interface UserRepository extends MongoRepository<User, String> {
	
	public User findById(Long id);
	public User findByUsername(String username);

}
