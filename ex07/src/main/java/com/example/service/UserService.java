package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.MessageVO;
import com.example.mapper.MessageMapper;
import com.example.mapper.UserMapper;

@Service
public class UserService {
	
	@Autowired
	UserMapper uMapper;
	
	@Autowired
	MessageMapper mMapper;
	
	@Transactional
	public void insert(MessageVO vo){
		mMapper.insert(vo);
		uMapper.updatePoint(vo.getSender(), 10);
	}
	
	@Transactional
	public MessageVO readMessage(int mid){
		MessageVO vo = mMapper.read(mid);
		if(vo.getReadDate()==null){
			uMapper.updatePoint(vo.getReceiver(), 5);
			mMapper.updateReadDate(mid);
		}
		return mMapper.read(mid);
	}
}
