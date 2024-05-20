package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.GroupOrderDetailVO;
import kr.or.ddit.vo.GroupOrderVO;

public interface IOrderSetService {

	public List<GroupOrderVO> getOrderSetList(int empNo);

	public List<GroupOrderDetailVO> getOrderSetDisease(int groupOrderNo);

	public List<GroupOrderDetailVO> getOrderSetMedicine(int groupOrderNo);

	public ServiceResult deleteOrderSet(int groupOrderNo);

	public ServiceResult modifyOrderSet(int groupOrderNo);

	public String getOrderSetName(int groupOrderNo);


}
