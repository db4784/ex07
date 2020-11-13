package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.UserVO;
import com.example.mapper.MessageMapper;
import com.example.mapper.UserMapper;

@Controller
public class UserController {
	
	@Autowired
	MessageMapper mMapper;
	
	@Autowired
	UserMapper uMapper;
	
	@RequestMapping("list")
	public void list(Model model){
		model.addAttribute("list", uMapper.list());
	}
	
	@RequestMapping("send")
	public void send(Model model, String uid){
		model.addAttribute("vo", uMapper.read(uid));
		model.addAttribute("list", uMapper.list());
	}
	
	@RequestMapping("receive")
	public void receive(Model model, String uid){
		model.addAttribute("vo", uMapper.read(uid));
	}
	
	@ResponseBody
	@RequestMapping("read")
	public UserVO read(String uid){
	return uMapper.read(uid);
	}
}
