package kr.ac.kopo11.chatbot.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.snu.ids.kkma.index.Keyword;
import org.snu.ids.kkma.index.KeywordExtractor;
import org.snu.ids.kkma.index.KeywordList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.kopo11.chatbot.domain.Record;
import kr.ac.kopo11.chatbot.domain.User;
import kr.ac.kopo11.chatbot.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/home")
	public String LoginHome(Model model) {
		
		return "home";
	}
	
	@RequestMapping(value="/home/userAdd")
	public String userAdd(Model model, @ModelAttribute User user) {
		
		User newUser = new User();
		
		newUser.setUserid(user.getUserid());
		newUser.setPassword(user.getPassword());

		userService.save(newUser);
		
		return "home";
	}
	
	
	@RequestMapping(value="/home/logIn")
	public String showMessage(Model model, @ModelAttribute User user) {
		
		List<Record> records = new ArrayList<>();
		
		userService.findByUserId(user.getUserid()).ifPresent(u -> {
			u.getRecords().stream().forEach(r -> {
				records.add(r);
			});
		});
		
		model.addAttribute("records", records);
		model.addAttribute("userId", user.getUserid());
		
		return "message";
	}
	
	@RequestMapping(value = "/home/addComment")
	public String AddComment(Model model, @ModelAttribute("user") User user,
			@ModelAttribute("record") Record record) {
		
		long miliseconds = System.currentTimeMillis();
		Date date = new Date(miliseconds);
		record.setIdentity(0);
		record.setDate(date);
		
		Record aiRecord = new Record();
		aiRecord.setIdentity(1);
		aiRecord.setDate(date);
		
		// init KeywordExtractor
		KeywordExtractor ke = new KeywordExtractor();

		// extract keywords
		KeywordList kl = ke.extractKeyword(record.getComment(), true);
		
		// print result
		for( int i = 0; i < kl.size(); i++ ) {
			Keyword kwrd = kl.get(i);
			
			userService.findByQuestion(kwrd.getString()).ifPresent(a -> {
				aiRecord.setComment(a.getAnswerAi());
			});
			
		}
		

		userService.findByUserId(user.getUserid()).ifPresent(m -> {
			record.setUser(m);
			m.addRecord(record);
			userService.save(m);
			
			aiRecord.setUser(m);
			m.addRecord(aiRecord);
			userService.save(m);
			
		});

		return "redirect:/home/refresh?userid=" + user.getUserid();
	}
	
	@RequestMapping(value="/home/refresh")
	public String showMessageRefresh(Model model, @RequestParam(value = "userid") String userid) {
		
		List<Record> records = new ArrayList<>();
		
		userService.findByUserId(userid).ifPresent(u -> {
			u.getRecords().stream().forEach(r -> {
				records.add(r);
			});
		});
		
		model.addAttribute("records", records);
		model.addAttribute("userId", userid);
		
		return "message";
	}
	
	
	
	
}
