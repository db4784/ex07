package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.UserVO;

public interface UserMapper {
	public List<UserVO> list();
	public UserVO read(String uid);
	public void updatePoint(@Param("uid") String uid,@Param("amount") int amount);
}
