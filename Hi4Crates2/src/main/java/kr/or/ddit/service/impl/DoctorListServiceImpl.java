package kr.or.ddit.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.IDoctorListMapper;
import kr.or.ddit.service.IDoctorListService;
import kr.or.ddit.vo.MemberVO;

@Service
public class DoctorListServiceImpl implements IDoctorListService {

	@Inject
	private IDoctorListMapper mapper;
	
	@Override
	public List<MemberVO> docList() {

		return mapper.docList();
	}

}
