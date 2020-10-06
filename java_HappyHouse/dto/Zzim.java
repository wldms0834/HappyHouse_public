package com.ssafy.happyhouse.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Zzim {
	private int zzimNo; // 찜번호, Auto-Increment
	private String id;
	private String no; // 매물번호
	
	private String dong;
	private String aptName;
	private String img;
	private String zzimDatetime;

	public Zzim(String id, String no, String zzimDatetime) {
		super();
		this.id = id;
		this.no = no;
		this.zzimDatetime = zzimDatetime;
	}

		
	
}
