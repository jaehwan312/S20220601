package com.oracle.S20220601.dao.jj;

import java.util.List;

import com.oracle.S20220601.domain.jj.Host1;
import com.oracle.S20220601.domain.jj.Menu1;
import com.oracle.S20220601.domain.jj.Stay1;
import com.oracle.S20220601.model.Host;
import com.oracle.S20220601.model.Stay;

public interface JpaSearchDao {

	List<Host1> getHostList();
	
	
	List<Stay1> getStayList();

	List<Menu1> getMenuList();

}
