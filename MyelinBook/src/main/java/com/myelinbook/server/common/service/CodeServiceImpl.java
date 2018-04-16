package com.myelinbook.server.common.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myelinbook.server.common.domain.Code;
import com.myelinbook.server.common.mapper.CodeMapper;

@Service("codeService")
public class CodeServiceImpl implements CodeService {
	
	@Autowired CodeMapper codeMapper;

	@Override
	public List<Code> list(Code code) {
		return codeMapper.list(code);
	}

	@Override
	public List<Code> getList(Code code) {
		return codeMapper.getList(code);
	}

	@Override
	public int add(Code code) {
		return codeMapper.add(code);
	}

	@Override
	public int mod(Code code) {
		return codeMapper.mod(code);
	}
}
