package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.ParticularVO;

public interface IParticularMapper {

	public List<ParticularVO> getParticularList(int patntNo);

	public void insertParticular(ParticularVO partiVO);

	public void checkParticular(int particularNo);

}
