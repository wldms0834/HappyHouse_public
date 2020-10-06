package com.ssafy.happyhouse.dao;

import java.util.List;

import com.ssafy.happyhouse.dto.Zzim;

public interface ZzimDao {
	//List<Zzim> selectZzim(String id);
	List<Zzim> selectZzimJoin(String id);

	Zzim selectZzimByNo(int zzimNo);

	public int insertZzim(Zzim Zzim);

	public int deleteZzim(int zzimNo);
	public int deleteZzimdetail(String no, String id);
}
