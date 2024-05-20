package kr.or.ddit.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.IEquipmentMapper;
import kr.or.ddit.service.IEquipmentService;
import kr.or.ddit.vo.EquipmentVO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class EquipmentServiceImpl implements IEquipmentService {

	@Inject
	private IEquipmentMapper mapper;
	
	@Override
	public List<EquipmentVO> list() {

		return mapper.list();
	}

	@Override
	public EquipmentVO detail(int eqNo) {
		return mapper.detail(eqNo);
	}

	@Override
	public int update(EquipmentVO eqVO) {
		
		mapper.update(eqVO);
		int status = eqVO.getResult();
		return status;
	}

	@Override
	public int delete(int eqNo) {
		return mapper.delete(eqNo);
	}

	@Override
	public int addEquip(EquipmentVO eqVO) {
		int status = mapper.addEquip(eqVO);
		if(status > 0) {
			int eqNo = eqVO.getEqNo();
//			log.info("eqNo 떴냐??? " + eqNo);
			return eqNo;
		} else {
			return 0;
		}
	}

	@Override
	public int eqNo() {
		return mapper.eqNo();
	}

	@Override
	public int addDesc(EquipmentVO eqVO) {
		return mapper.addDesc(eqVO);
	}

	@Override
	public List<EquipmentVO> getPhysicalEquip() {
		return mapper.getPhysicalEquip();
	}
}
