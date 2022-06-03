package com.oracle.S20220601.dao.ji;

import java.util.List;

import com.oracle.S20220601.model.Res;

public interface ResDao {

	int total();

	List<Res> listRes(Res res);

	List<Res> listBeforeRes(Res res);

	List<Res> listCancleRes(Res res);

}
