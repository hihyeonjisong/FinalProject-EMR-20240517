package kr.or.ddit.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.IParticularMapper;
import kr.or.ddit.service.IParticularService;
import kr.or.ddit.vo.ParticularVO;

@Service
public class ParticularServiceImpl implements IParticularService {

	@Inject
	private IParticularMapper particularMapper;
	
	@Override
	public List<ParticularVO> getParticularList(int patntNo) {
		List<ParticularVO> partiList = particularMapper.getParticularList(patntNo);
		return partiList;
	}

	@Override
	public void insertParticular(ParticularVO partiVO) {
		particularMapper.insertParticular(partiVO);
	}

	@Override
	public void checkParticular(int particularNo) {
		particularMapper.checkParticular(particularNo);
	}


}
