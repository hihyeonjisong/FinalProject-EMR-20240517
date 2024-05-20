package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.GroupOrderDetailVO;
import kr.or.ddit.vo.GroupOrderVO;

public interface IOrderSetMapper {

	public List<GroupOrderVO> getOrderSetList(int empNo);

	public List<GroupOrderDetailVO> getOrderSetDisease(int groupOrderNo);

	public List<GroupOrderDetailVO> getOrderSetMedicine(int groupOrderNo);

	public int deleteOrderSet(int groupOrderNo);

	public int deleteOrderSetDetail(int groupOrderNo);

	public String getOrderSetName(int groupOrderNo);

}
