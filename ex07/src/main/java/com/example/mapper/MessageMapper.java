package com.example.mapper;

import java.util.List;

import com.example.domain.MessageVO;

public interface MessageMapper {

	public void insert(MessageVO vo);
	public List<MessageVO> sendList(String sender);
	public void delete(int mid);
	public List<MessageVO> receiveList(String receiver);
	public MessageVO read(int mid);
	public void updateReadDate(int mid);
}
