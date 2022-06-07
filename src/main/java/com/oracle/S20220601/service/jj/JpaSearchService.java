package com.oracle.S20220601.service.jj;

import java.util.List;

import com.oracle.S20220601.domain.jj.Host1;
import com.oracle.S20220601.domain.jj.Menu1;
import com.oracle.S20220601.domain.jj.Search1;
import com.oracle.S20220601.domain.jj.Stay1;
import com.oracle.S20220601.domain.jj.Store1;
import com.oracle.S20220601.model.Host;
import com.oracle.S20220601.model.Stay;

public interface JpaSearchService {

	List<Host1> getHostList();

	List<Search1> getRecList();

	List<Search1> getPopList();


	
}
