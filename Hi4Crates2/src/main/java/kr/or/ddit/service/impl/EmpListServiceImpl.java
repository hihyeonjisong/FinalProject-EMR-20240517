package kr.or.ddit.service.impl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.IEmpListMapper;
import kr.or.ddit.service.IEmpListService;
import kr.or.ddit.vo.EmpListVO;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.MemberVO;

@Service
public class EmpListServiceImpl implements IEmpListService {

	@Inject
	IEmpListMapper mapper;
	
	@Override
	public List<EmpListVO> getEmpList() {
		return mapper.getEmpList();
	}

	@Override
	public ServiceResult updateEmp(Map<String, Object> map) {
		

		ServiceResult result = null;
		
		int status = mapper.updateEmp(map);
		
		if(status>0) {
			result=ServiceResult.OK;
		}else {
			result=ServiceResult.FAILED;
		}
		
		return result;

		
	}

}
