package kr.or.ddit.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.IFileMapper;
import kr.or.ddit.mapper.IMypageMapper;
import kr.or.ddit.service.IMypageService;
import kr.or.ddit.vo.AttachmentVO;
import kr.or.ddit.vo.DoctorCareerVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.RealmVO;
import kr.or.ddit.vo.WorkHistoryVO;
import lombok.extern.slf4j.Slf4j;
@Service
@Slf4j
public class MypageServiceImpl implements IMypageService {

	@Inject
	private IMypageMapper mypageMapper;
	
	@Inject
	private IFileMapper fileMapper;
	
	@Override
	public MemberVO getMyInfo(int memNo) {
		MemberVO member = mypageMapper.getMyInfo(memNo);
		log.info("그룹번호~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~:"+member.getAttachmentGroupNo());
		AttachmentVO fileVO = fileMapper.getFileDetail(member.getAttachmentGroupNo());
		member.setFileVO(fileVO);
		return member;
	}

//	@Override
//	public MemberVO getMemInfo(int memNo) {
//		return mypageMapper.getMyInfo(memNo);
//	}

	@Override
	public List<RealmVO> getMyRealm(int memNo) {
		return mypageMapper.getMyRealm(memNo);
	}

	@Override
	public List<DoctorCareerVO> getMyCareer(int memNo) {
		return mypageMapper.getMyCareer(memNo);
	}

	@Override
	public ServiceResult modifyProfile(MemberVO mv) {
		
		if(mv.getFile() != null && !mv.getFile().isEmpty()) {
			MultipartFile file = mv.getFile();
			AttachmentVO fileVO = new AttachmentVO();
			fileVO.setAttachType(file.getContentType());
			fileVO.setAttachName(mv.getImgData().substring(mv.getImgData().lastIndexOf("/")+1));
			fileVO.setAttachSize(file.getSize());
			fileVO.setAttachPath(mv.getImgData().substring(0, mv.getImgData().lastIndexOf("/")+1));
			fileVO.setAttachLoc("/profileImg");
			
			fileMapper.attachmentGroup(fileVO);
			fileMapper.uploadProfileImg(fileVO);
			mv.setAttachmentGroupNo(fileVO.getAttachmentGroupNo());
		}
		int res = mypageMapper.modifyProfile(mv);
		
		if(res > 0) return ServiceResult.OK;
		if(res == 0) return ServiceResult.FAILED;
		return ServiceResult.FAILED;
	}

	@Override
	public ServiceResult passwordModify(MemberVO member) {
		int res = mypageMapper.passwordModify(member);
		if(res > 0) return ServiceResult.OK;
		if(res == 0) return ServiceResult.FAILED;
		return ServiceResult.FAILED;
	}

	@Override
	public WorkHistoryVO getWorkHistory(int memNo) {
		return mypageMapper.getWorkHistory(memNo);
	}
	
}
