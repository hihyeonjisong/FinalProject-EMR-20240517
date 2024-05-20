package kr.or.ddit.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.IOrderSetMapper;
import kr.or.ddit.service.IOrderSetService;
import kr.or.ddit.vo.GroupOrderDetailVO;
import kr.or.ddit.vo.GroupOrderVO;

@Service
public class OrderSetServiceImpl implements IOrderSetService {
	
	@Inject
	IOrderSetMapper mapper;

	@Override
	public List<GroupOrderVO> getOrderSetList(int empNo) {
		return mapper.getOrderSetList(empNo);
	}

	@Override
	public List<GroupOrderDetailVO> getOrderSetDisease(int groupOrderNo) {
		return mapper.getOrderSetDisease(groupOrderNo);
	}

	@Override
	public List<GroupOrderDetailVO> getOrderSetMedicine(int groupOrderNo) {
		return mapper.getOrderSetMedicine(groupOrderNo);
	}

	@Override
	public ServiceResult deleteOrderSet(int groupOrderNo) {
		
		ServiceResult result=null;
		
		int status1 = mapper.deleteOrderSetDetail(groupOrderNo);
		
		if(status1>0) {
			int status2 = mapper.deleteOrderSet(groupOrderNo);
			if(status2>0) {
				result = ServiceResult.OK;
			}else {
				result=ServiceResult.FAILED;
			}
		}else {
			result=ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public ServiceResult modifyOrderSet(int groupOrderNo) {
		
		ServiceResult result=null;
		
		int status1 = mapper.deleteOrderSetDetail(groupOrderNo);
		
		if(status1>0) {
			int status2 = mapper.deleteOrderSet(groupOrderNo);
			if(status2>0) {
				result = ServiceResult.OK;
			}else {
				result=ServiceResult.FAILED;
			}
		}else {
			result=ServiceResult.FAILED;
		}
		return result;

	}

	@Override
	public String getOrderSetName(int groupOrderNo) {
		return mapper.getOrderSetName(groupOrderNo);
	}



}
