package com.yedam.app.unit;

import java.util.List;

import com.yedam.app.unit.UnitVO;

public interface UnitService {

	public void insertUnit(UnitInsertVO vo);
	public void updateUnit(UnitVO vo);
	public void deleteUnit(UnitVO vo);
	public List<UnitVO> getUnitList(UnitVO vo);
	public List<UnitVO> getSDATE(UnitVO vo);

}
