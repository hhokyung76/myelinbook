package com.myelinbook.server.common.domain;

import java.io.Serializable;
import java.util.Iterator;

//import org.springframework.security.core.GrantedAuthority;
//import org.springframework.security.core.context.SecurityContextHolder;

/**
 * 공통 객체 클래스.
 * 각 Entity에서 해당 클래스를 상속받아 사용한다.
 */
public class CommBean implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	// 생성자로 Data Binding (로그인 사용자의 경우 TRUE, 비로그인 사용자의 경우 FALSE)
	protected boolean isLoginUser;
	// 생성자로 Data Binding (로그인 사용자 중 USER_ADMIN의 경우 TRUE, 비로그인 혹은 일반 유저의 경우 FASLE)
	protected boolean isLoginAdmin;
	// 로그인한 유저 ID
	protected String loginUserId;
	
	// 현재 페이지번호
	private int curPage = 1;
	// 한 블록당 보여줄 글 수
	private int pageListSize = 10;
	// 노출할 블록 수
	private int blockSize = 10;
	// 전체 글의 수
	private int totListSize;
	// 전체 블록 수
	private int totBlockSize;
	// Start Index
	private int startIndex = 0;
	
	// 검색조건
	private String schCondition;
	// 검색어
	private String schValue;
	// 검색 필드
	private String sortField;
	// 검색 정렬기준
	private String sortOrder;
	
	// 검색 시작 날짜
	private String dateStart;
	// 검색 끝 날짜
	private String dateEnd;
	
//	// 등록자ID
//	private String regId;
//	// 등록일자
//	private String regDt;
//	// 수정자ID
//	private String uptId;
//	// 수정일자
//	private String uptDt;
//	
//	// 주기
//	private String cycle;
//	
//	// 사용유무
//	private String useYn;
	
	public CommBean() {
//		if(SecurityContextHolder.getContext().getAuthentication() != null){
//			Object securityPrincipal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//			
//			// 1-1. 로그인이 되어 있지 않다면?
//			if (securityPrincipal instanceof String){
//				isLoginAdmin = isLoginUser = false;
//				
//			// 1-2. 관리자(or 일반유저) 로그인이 되어 있다면?
//			} else if (securityPrincipal instanceof org.springframework.security.core.userdetails.User){
//				isLoginUser = true;
//				isLoginAdmin = false;
//				org.springframework.security.core.userdetails.User securityUser = (org.springframework.security.core.userdetails.User)securityPrincipal;
//				
//				// 로그인 유저 정보 설정
//				loginUserId = securityUser.getUsername();
//				
//				Iterator<GrantedAuthority> iterator = securityUser.getAuthorities().iterator();
//				
//				while(iterator.hasNext()) {
//				GrantedAuthority setElement = iterator.next();
//				
//				if(setElement.getAuthority().equals("ROLE_ADMIN")){
//						isLoginAdmin = true;
//					}
//				}
//			
			// 1-3. 기타
//			} else {
//				isLoginAdmin = isLoginUser = false;
//			}
//		} else {
//			isLoginAdmin = isLoginUser = false;
//		}
	}
	
	
	
	
//	public String getCycle() {
//		return cycle;
//	}
//
//
//
//
//	public void setCycle(String cycle) {
//		this.cycle = cycle;
//	}




	public String getDateStart() {
		return dateStart;
	}




	public void setDateStart(String dateStart) {
		this.dateStart = dateStart;
	}




	public String getDateEnd() {
		return dateEnd;
	}




	public void setDateEnd(String dateEnd) {
		this.dateEnd = dateEnd;
	}




	public boolean isLoginUser() {
		return isLoginUser;
	}

	public boolean isLoginAdmin() {
		return isLoginAdmin;
	}

	public String getLoginUserId() {
		return loginUserId;
	}


	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getPageListSize() {
		return pageListSize;
	}

	public void setPageListSize(int pageListSize) {
		this.pageListSize = pageListSize;
	}

	public int getBlockSize() {
		return blockSize;
	}

	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}

	public int getTotListSize() {
		return totListSize;
	}

	/**
	 * Total List Size 등록 (=전체 목록 갯수)
	 * 
	 * 		+ Block Size와 Start Index를 갱신.
	 *
	 * @param totListSize the new tot list size
	 */
	public void setTotListSize(int totListSize) {
		this.totListSize = totListSize;
		this.totBlockSize = totListSize/pageListSize < 1 ? 1 : totListSize%pageListSize==0?totListSize/pageListSize:(totListSize/pageListSize)+1;
		
		this.startIndex = (curPage-1)*pageListSize;
	}

	public int getTotBlockSize() {
		return totBlockSize;
	}

	public void setTotBlockSize(int totBlockSize) {
		this.totBlockSize = totBlockSize;
	}

	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public String getSchCondition() {
		return schCondition;
	}

	public void setSchCondition(String schCondition) {
		this.schCondition = schCondition;
	}

	public String getSchValue() {
		return schValue;
	}

	public void setSchValue(String schValue) {
		this.schValue = schValue;
	}

	public String getSortField() {
		return sortField;
	}

	public void setSortField(String sortField) {
		this.sortField = sortField;
	}

	public String getSortOrder() {
		return sortOrder;
	}

	public void setSortOrder(String sortOrder) {
		this.sortOrder = sortOrder;
	}

//	public String getRegId() {
//		return regId;
//	}
//
//	public void setRegId(String regId) {
//		this.regId = regId;
//	}
//
//	public String getRegDt() {
//		return regDt;
//	}
//
//	public void setRegDt(String regDt) {
//		this.regDt = regDt;
//	}
//
//	public String getUptId() {
//		return uptId;
//	}
//
//	public void setUptId(String uptId) {
//		this.uptId = uptId;
//	}
//
//	public String getUptDt() {
//		return uptDt;
//	}
//
//	public void setUptDt(String uptDt) {
//		this.uptDt = uptDt;
//	}
//
//	public String getUseYn() {
//		return useYn;
//	}
//
//	public void setUseYn(String useYn) {
//		this.useYn = useYn;
//	}
	
	
	

}
