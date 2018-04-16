package com.myelinbook.server.common.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.myelinbook.server.common.domain.Code;

@Mapper
public interface CodeMapper {

	/**
	 * 목록조회
	 */
	public List<Code> list(Code code);
	
	/**
	 * 상세조회
	 */
	public List<Code> getList(Code code);
	
	/**
	 * 추가
	 */
	public int add(Code code);
	
	/**
	 * 수정
	 */
	public int mod(Code code);
		
}
