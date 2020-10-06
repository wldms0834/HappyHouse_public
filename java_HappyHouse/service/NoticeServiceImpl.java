package com.ssafy.happyhouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dao.NoticeDao;
import com.ssafy.happyhouse.dao.QnADao;
import com.ssafy.happyhouse.dto.Notice;
import com.ssafy.happyhouse.dto.QnA;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDao dao;

	@Override
	public List<Notice> retrieveNotice() {
		// TODO Auto-generated method stub
		return dao.selectNotice();
	}

	@Override
	public Notice selectNoticeByNo(int no) {
		// TODO Auto-generated method stub
		return dao.selectNoticeByNo(no);
	}

	@Override
	public boolean writeNotice(Notice notice) {
		// TODO Auto-generated method stub
		return dao.insertNotice(notice)== 1;
	}

	@Override
	public boolean updateNotice(Notice notice) {
		// TODO Auto-generated method stub
		return dao.updateNotice(notice) ==1;
	}

	@Override
	public boolean deleteNotice(int no) {
		// TODO Auto-generated method stub
		return dao.deleteNotice(no)==1;
	}
	
	
}
