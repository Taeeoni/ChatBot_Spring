package kr.ac.kopo11.chatbot.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo11.chatbot.domain.Answer;
import kr.ac.kopo11.chatbot.domain.User;
import kr.ac.kopo11.chatbot.repository.AnswerRepository;
import kr.ac.kopo11.chatbot.repository.UserRepository;

@Service
public class UserService {

	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private AnswerRepository answerRepository;

	public void setUserRepository(UserRepository userRepository) {
		this.userRepository = userRepository;
	}
	
	public Optional<User> findById(Long id) {
		// TODO Auto-generated method stub
		return userRepository.findById(id);
	}

	public List<User> findAll() {
		// TODO Auto-generated method stub
		return userRepository.findAll();
	}

	public void save(User user) {
		userRepository.save(user);
	}
	
	public void delete(User user) {
		
		userRepository.delete(user);
	}

	public Optional<User> findByUserId(String userid) {
		// TODO Auto-generated method stub
		return userRepository.findByUserid(userid);
	}

	public Optional<Answer> findByQuestion(String string) {
		
		return answerRepository.findByQuestion(string);
	}


	
}
