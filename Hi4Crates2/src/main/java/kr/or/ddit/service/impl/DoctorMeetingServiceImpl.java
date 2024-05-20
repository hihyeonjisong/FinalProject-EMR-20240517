package kr.or.ddit.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.IDoctorMeetingMapper;
import kr.or.ddit.service.IDoctorMeetingService;
import kr.or.ddit.vo.MeetingPersonVO;
import kr.or.ddit.vo.MeetingVO;
import kr.or.ddit.vo.TreeViewVO;

@Service
public class DoctorMeetingServiceImpl implements IDoctorMeetingService {
	
	@Inject
	private IDoctorMeetingMapper doctorMeetingMapper;

	@Override
	public int insertMeetingRecord(MeetingVO meetingVO) {
		int meetingNo = 0;
		int status =  doctorMeetingMapper.insertMeetingRecord(meetingVO);
		if (status > 0) {
			meetingNo = meetingVO.getMeetingNo();
		}
		return meetingNo;
	}

	@Override
	public boolean recordingMeeting(MeetingVO meetingVO) {
		boolean flag = false;
		int status = doctorMeetingMapper.recordingMeeting(meetingVO);
		if (status > 0) {
			flag = true;
		}
		return flag;
	}

	@Override
	public boolean insertMeetingPerson(MeetingPersonVO meetingPersonVO) {
		boolean flag = false;
		int status  = doctorMeetingMapper.insertMeetingPerson(meetingPersonVO);
		if (status > 0) {
			flag = true;
		}
		return flag;
	}

	@Override
	public List<TreeViewVO> getEmpList() {
		return doctorMeetingMapper.getEmpList();
	}

	@Override
	public List<MeetingVO> getMeetingRecord() {
		return doctorMeetingMapper.getMeetingRecord();
	}

}
