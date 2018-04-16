package com.myelinbook.server.common.service;

import java.util.List;

import com.myelinbook.server.common.domain.Code;

public interface CodeService {
	
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
