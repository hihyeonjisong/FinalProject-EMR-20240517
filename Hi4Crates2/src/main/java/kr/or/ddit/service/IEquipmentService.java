package kr.or.ddit.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.or.ddit.vo.EquipmentVO;

public interface IEquipmentService {

	List<EquipmentVO> list();

	EquipmentVO detail(int eqNo);

	int update(EquipmentVO eqVO);

	int delete(int eqNo);

	int addEquip(EquipmentVO eqVO);

	int eqNo();

	int addDesc(EquipmentVO eqVO);

	List<EquipmentVO> getPhysicalEquip();

}
