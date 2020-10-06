package com.ssafy.happyhouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dao.ZzimDao;
import com.ssafy.happyhouse.dto.Zzim;

@Service
public class ZzimServiceImpl implements ZzimService {

	@Autowired
	private ZzimDao dao;
	
//	@Override
//	public List<Zzim> selectZzim(String id) {
//		return dao.selectZzim(id);
//	}
	
	

	@Override
	public Zzim selectZzimByNo(int zzimNo) {
		return dao.selectZzimByNo(zzimNo);
	}

	@Override
	public boolean insertZzim(Zzim Zzim) {
		return dao.insertZzim(Zzim) == 1;
	}

	@Override
	public boolean deleteZzim(int zzimNo) {
		return dao.deleteZzim(zzimNo) == 1;
	}

	@Override
	public List<Zzim> selectZzimJoin(String id) {
		// TODO Auto-generated method stub
		return dao.selectZzimJoin(id);
	}

	@Override
	public boolean deleteZzimdetail(String no, String id) {
		return dao.deleteZzimdetail(no, id)==1;
	}

}
