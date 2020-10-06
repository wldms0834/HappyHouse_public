package com.ssafy.happyhouse.dao;

import java.util.List;

import com.ssafy.happyhouse.dto.Notice;

public interface NoticeDao {
	List<Notice> selectNotice();
	Notice selectNoticeByNo(int no);
	
	public int insertNotice(Notice notice);
	public int updateNotice(Notice notice);
	public int deleteNotice(int no);

}
