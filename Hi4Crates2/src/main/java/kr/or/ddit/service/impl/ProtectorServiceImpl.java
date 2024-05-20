package kr.or.ddit.service.impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.IProtectorMapper;
import kr.or.ddit.service.IProtectorService;
import kr.or.ddit.vo.ProtectorVO;

@Service
public class ProtectorServiceImpl implements IProtectorService {

	@Inject
	private IProtectorMapper protectorMapper;
	
	@Override
	public ServiceResult insertProtector(ProtectorVO protector) {
		
		int res = protectorMapper.insertProtector(protector);
		if(res > 0) return ServiceResult.OK;
		return ServiceResult.FAILED;
	}

	@Override
	public ServiceResult modifyProtector(ProtectorVO protector) {
		
		int res = protectorMapper.modifyProtector(protector);
		if(res > 0) return ServiceResult.OK;
		return ServiceResult.FAILED;
	}

}
