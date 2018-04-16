package com.myelinbook.server.common.domain;

import java.io.Serializable;
import java.util.Arrays;

public class User extends CommBean implements Serializable {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 6658712585854634962L;

	/** 사용자ID */
	private String[] userIds;
	/** 사용자ID */
	private String userId;
	/** 사용자비밀번호 */
	private String pwd;
	/** 사용자성명 */
	private String name;
	/** 사용자구분코드 */
	private String typeCd;
	/** 사용자구분명 */
	private String typeName;
	/** 휴대전화번호 */
	private String mobileNo;
	/** 이메일ID */
	private String emailId;
	/** 이메일주소코드 */
	private String emailAddrCd;
	/** 이메일주소 */
	private String emailAddrNm;
	/** 승인여부 */
	private String apprYn;
	/** 승인일시 */
	private String apprDt;
	/** 등록일시 */
	private String regDt;
	/** 삭제ID */
	private String delId;
	/** 삭제일시 */
	private String delDt;
	
	/** 이메일 */
	private String email;
	
	/** 휴대전화번호 */
	private String mobileNo1;
	private String mobileNo2;
	private String mobileNo3;
	
	private int qCurrPage = 0;
	private int qStartIndex = 0;
	
	private int qPageListSize = 0;
//	private String sortOrder;
//	
	public String[] getUserIds() {
		return userIds;
	}
	public void setUserIds(String[] userIds) {
		this.userIds = userIds;
	}

	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public String getTypeCd() {
		return typeCd;
	}
	public void setTypeCd(String typeCd) {
		this.typeCd = typeCd;
	}

	public String getMobileNo() {
		return mobileNo;
	}
	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getEmailAddrCd() {
		return emailAddrCd;
	}
	public void setEmailAddrCd(String emailAddrCd) {
		this.emailAddrCd = emailAddrCd;
	}

	public String getEmailAddrNm() {
		return emailAddrNm;
	}
	public void setEmailAddrNm(String emailAddrNm) {
		this.emailAddrNm = emailAddrNm;
	}

	public String getApprYn() {
		return apprYn;
	}
	public void setApprYn(String apprYn) {
		this.apprYn = apprYn;
	}

	public String getApprDt() {
		return apprDt;
	}
	public void setApprDt(String apprDt) {
		this.apprDt = apprDt;
	}

	public String getRegDt() {
		return regDt;
	}
	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}

	public String getDelId() {
		return delId;
	}
	public void setDelId(String delId) {
		this.delId = delId;
	}

	public String getDelDt() {
		return delDt;
	}
	public void setDelDt(String delDt) {
		this.delDt = delDt;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobileNo1() {
		return mobileNo1;
	}
	public void setMobileNo1(String mobileNo1) {
		this.mobileNo1 = mobileNo1;
	}

	public String getMobileNo2() {
		return mobileNo2;
	}
	public void setMobileNo2(String mobileNo2) {
		this.mobileNo2 = mobileNo2;
	}

	public String getMobileNo3() {
		return mobileNo3;
	}
	public void setMobileNo3(String mobileNo3) {
		this.mobileNo3 = mobileNo3;
	}
	
		
	public int getqStartIndex() {
		return qStartIndex;
	}
	public void setqStartIndex(int qStartIndex) {
		this.qStartIndex = qStartIndex;
	}
	public int getqPageListSize() {
		return qPageListSize;
	}
	public void setqPageListSize(int qPageListSize) {
		this.qPageListSize = qPageListSize;
	}
	
	public int getqCurrPage() {
		return qCurrPage;
	}
	public void setqCurrPage(int qCurrPage) {
		this.qCurrPage = qCurrPage;
	}
	
	
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	//	public int getCurrPage() {
//		return currPage;
//	}
//	public void setCurrPage(int currPage) {
//		this.currPage = currPage;
//	}
//	public int getStartIndex() {
//		return startIndex;
//	}
//	public void setStartIndex(int startIndex) {
//		this.startIndex = startIndex;
//	}
//	public int getPageSize() {
//		return pageSize;
//	}
//	public void setPageSize(int pageSize) {
//		this.pageSize = pageSize;
//	}
//	
//	public String getSortOrder() {
//		return sortOrder;
//	}
//	public void setSortOrder(String sortOrder) {
//		this.sortOrder = sortOrder;
//	}
	@Override
	public String toString() {
		return "User [userIds=" + Arrays.toString(userIds) + ", userId=" + userId + ", pwd=" + pwd + ", name=" + name
				+ ", typeCd=" + typeCd + ", mobileNo=" + mobileNo + ", emailId=" + emailId + ", emailAddrCd="
				+ emailAddrCd + ", emailAddrNm=" + emailAddrNm + ", apprYn=" + apprYn + ", apprDt=" + apprDt
				+ ", regDt=" + regDt + ", delId=" + delId + ", delDt=" + delDt + ", email=" + email + ", mobileNo1="
				+ mobileNo1 + ", mobileNo2=" + mobileNo2 + ", mobileNo3=" + mobileNo3 + ", qCurrPage=" + qCurrPage
				+ ", qStartIndex=" + qStartIndex + ", qPageListSize=" + qPageListSize + "]";
	}

	
	
}
