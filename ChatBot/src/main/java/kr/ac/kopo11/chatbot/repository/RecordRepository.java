package kr.ac.kopo11.chatbot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import kr.ac.kopo11.chatbot.domain.Record;

@Repository
public interface RecordRepository extends JpaRepository<Record, Long>{

}
