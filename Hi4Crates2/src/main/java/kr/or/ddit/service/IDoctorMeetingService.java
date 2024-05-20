package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.vo.MeetingPersonVO;
import kr.or.ddit.vo.MeetingVO;
import kr.or.ddit.vo.TreeViewVO;

public interface IDoctorMeetingService {
	public int insertMeetingRecord(MeetingVO meeting);
	public boolean recordingMeeting(MeetingVO meetingVO);
	public boolean insertMeetingPerson(MeetingPersonVO meetingPersonVO);
	public List<TreeViewVO> getEmpList();
	public List<MeetingVO> getMeetingRecord();
}
