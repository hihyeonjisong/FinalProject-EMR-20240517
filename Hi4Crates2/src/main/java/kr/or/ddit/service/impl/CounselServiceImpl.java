package kr.or.ddit.service.impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.ICounselMapper;
import kr.or.ddit.service.ICounselService;
import kr.or.ddit.vo.CounselVO;

@Service
public class CounselServiceImpl implements ICounselService {

	@Inject
	private ICounselMapper mapper;
	
	@Override
	public CounselVO counselOne(int counselNo) {

		return mapper.counselOne(counselNo);
	}

}
