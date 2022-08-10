package kr.ac.kopo11.chatbot.repository;

import java.util.Collection;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import kr.ac.kopo11.chatbot.domain.User;


@Repository
public interface UserRepository extends JpaRepository<User, Long>{

	Optional<User> findByUserid(String userid);
	

}
