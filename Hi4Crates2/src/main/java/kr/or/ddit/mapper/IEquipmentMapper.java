package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.EquipmentVO;

public interface IEquipmentMapper {

	List<EquipmentVO> list();

	EquipmentVO detail(int eqNo);

	int update(EquipmentVO eqVO);

	int delete(int eqNo);

	int addEquip(EquipmentVO eqVO);

	int eqNo();

	int addDesc(EquipmentVO eqVO);

	List<EquipmentVO> getPhysicalEquip();

}
