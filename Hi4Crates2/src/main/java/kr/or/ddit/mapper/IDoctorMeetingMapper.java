package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.MeetingPersonVO;
import kr.or.ddit.vo.MeetingVO;
import kr.or.ddit.vo.TreeViewVO;

public interface IDoctorMeetingMapper {
	public int insertMeetingRecord(MeetingVO meetingVO);
	public int recordingMeeting(MeetingVO meetingVO);
	public int insertMeetingPerson(MeetingPersonVO meetingPersonVO);
	public List<TreeViewVO> getEmpList();
	public List<MeetingVO> getMeetingRecord();
}
