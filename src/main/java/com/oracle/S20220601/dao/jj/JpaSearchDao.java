package com.oracle.S20220601.dao.jj;

import java.util.List;

import com.oracle.S20220601.domain.jj.Host1;
import com.oracle.S20220601.domain.jj.Search1;

public interface JpaSearchDao {

	List<Host1> getHostList();

	List<Search1> getRecList();

	List<Search1> getPopList();

	

}
