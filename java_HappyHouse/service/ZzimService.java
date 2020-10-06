package com.ssafy.happyhouse.service;

import java.util.List;

import com.ssafy.happyhouse.dto.Zzim;

public interface ZzimService {
	//List<Zzim> selectZzim(String id);
	List<Zzim> selectZzimJoin(String id);

	Zzim selectZzimByNo(int zzimNo);

	public boolean insertZzim(Zzim Zzim);

	public boolean deleteZzim(int zzimNo);
	public boolean deleteZzimdetail(String no, String id);
}
