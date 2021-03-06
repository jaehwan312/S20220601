package com.oracle.S20220601.service.jj;

import java.util.List;

import com.oracle.S20220601.model.Host;
import com.oracle.S20220601.model.Search;
import com.oracle.S20220601.model.jj.HostStayjj;
import com.oracle.S20220601.model.jj.HostStorejj;

public interface SearchService {

	void keywordInsert(String keyword);

	List<HostStorejj> getHostStoreList(Search search);

	List<HostStayjj> getHostStayList(Search search);

	Host getLikeResult(Host host);

	List<Search> getKeywordList();

	void getKeywordInsert(Search search);

	void getKeywordDelete(Search search);

	Search getKeywordSearch(int search_num);

	int getKeywordUpdate(Search search);

}
