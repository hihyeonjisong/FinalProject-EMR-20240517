package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.vo.ParticularVO;

public interface IParticularService {


	public List<ParticularVO> getParticularList(int patntNo);

	public void insertParticular(ParticularVO partiVO);

	public void checkParticular(int particularNo);

}
