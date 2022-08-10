package kr.ac.kopo11.chatbot.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import kr.ac.kopo11.chatbot.domain.Answer;

public interface AnswerRepository extends JpaRepository<Answer, Long>{
	
	Optional<Answer> findByQuestion(String question);
	
}
