package com.ssafy.happyhouse.service;

import java.util.List;

import com.ssafy.happyhouse.dto.Notice;

public interface NoticeService {
	List<Notice> retrieveNotice();
	Notice selectNoticeByNo(int no);
	
	public boolean writeNotice(Notice notice);
	public boolean updateNotice(Notice notice);
	public boolean deleteNotice(int no);
	
}
