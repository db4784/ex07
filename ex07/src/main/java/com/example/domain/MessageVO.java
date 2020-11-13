package com.example.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class MessageVO extends UserVO{
	
	private int mid;
	private String sender;
	private String receiver;
	private String message;
	@JsonFormat(pattern ="yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private Date sendDate;
	@JsonFormat(pattern ="yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private Date readDate;
	
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Date getSendDate() {
		return sendDate;
	}
	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}
	public Date getReadDate() {
		return readDate;
	}
	public void setReadDate(Date readDate) {
		this.readDate = readDate;
	}
	@Override
	public String toString() {
		return "MessageVO [mid=" + mid + ", sender=" + sender + ", receiver=" + receiver + ", message=" + message
				+ ", sendDate=" + sendDate + ", readDate=" + readDate + "]";
	}
	
}
