package kr.or.ddit.service.impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.IEvaluationMapper;
import kr.or.ddit.service.IEvaluationService;
import kr.or.ddit.vo.EvaluationVO;

@Service
public class EvaluationServiceImpl implements IEvaluationService {

	@Inject
	private IEvaluationMapper mapper;
	
	@Override
	public int plusStar(EvaluationVO eVO) {

		return mapper.plusStar(eVO);
	}

}
