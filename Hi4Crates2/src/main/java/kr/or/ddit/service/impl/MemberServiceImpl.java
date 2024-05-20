package kr.or.ddit.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.MemberMapper;
import kr.or.ddit.service.IMemberService;
import kr.or.ddit.vo.ChartVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ParticularVO;
import kr.or.ddit.vo.ProtectorVO;

@Service
public class MemberServiceImpl implements IMemberService {

	@Inject
	private MemberMapper memberMapper;
	
	@Override
	public List<MemberVO> getSearchList(String decodedName) {
		return memberMapper.getSearchList(decodedName);
	}

	@Override
	public List<ChartVO> getChartRecordList(int param) {
		return memberMapper.getChartRecordList(param);
	}

	@Override
	public List<ParticularVO> getParticularList(int memNo) {
		return memberMapper.getParticularList(memNo);
	}

	@Override
	public MemberVO getPatntInfo(int memNo) {
		return memberMapper.getPatntInfo(memNo);
	}

	@Override
	public ProtectorVO getProtector(int memNo) {
		return memberMapper.getProtector(memNo);
	}

	@Override
	public String getMemId(int empNo) {
		return memberMapper.getMemId(empNo);
	}

	@Override
	public List<MemberVO> getReqPermissionList() {
		return memberMapper.getReqPermissionList();
	}

	@Override
	public List<MemberVO> getEmpList() {
		return memberMapper.getEmpList();
	}

	@Override
	public MemberVO getMemberInfo(int memNo) {
		return memberMapper.getMemberInfo(memNo);
	}

	@Override
	public List<MemberVO> getOnlineList() {
		return memberMapper.getOnlineList();
	}

	@Override
	public int getMasterNo() {
		return memberMapper.getMasterNo();
	}

	@Override
	public int getMemNo(int i) {
		return memberMapper.getMemNo(i);
	}

	@Override
	public MemberVO getPartiInfo(int parseInt) {
		return memberMapper.getPartiInfo(parseInt);
	}

	@Override
	public int getReceiptMemNo(int receiptNo) {
		return memberMapper.getReceiptMemNo(receiptNo);
	}

}
