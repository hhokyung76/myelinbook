package com.myelinbook.server.common.domain;

import java.io.Serializable;
import java.util.Arrays;

/**
 * 고객사 관리 정보 Entity.
 * @author redskin
 *
 */
public class Customer implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8249982683808681369L;
	
	private int custId;   //'고객ID'
	private String custNm; //  '고객명'
	private String chrgNm;   //'담당자명'
	private String coctNo;   //'연락처'
	private String emailId;  // '이메일ID'
	private String emailAddrCd;  // '이메일주소코드'
	private String emailAddrNm;  //  '이메일주소명'
	private String emailFull;   // 전체 이메일 
	private String regId;   // '등록자ID'
	private String regDt;   // '등록일시'
	private String uptId;   // '수정자ID'
	private String uptDt;   // 수정일시
	private String delId;   // '삭제자ID'
	private String delDt;   // 삭제일시
	private String coctNo1;   //'연락처'
	private String coctNo2;   //'연락처'
	private String coctNo3;   //'연락처'
	
	private String updateYn;
	

	private int qCurrPage = 0;
	private int startIndex = 0;
	private int pageListSize = 0;

	public int getCustId() {
		return custId;
	}

	public String getEmailFull() {
		return emailFull;
	}

	public void setEmailFull(String emailFull) {
		this.emailFull = emailFull;
	}

	public void setCustId(int custId) {
		this.custId = custId;
	}

	public String getCustNm() {
		return custNm;
	}

	public void setCustNm(String custNm) {
		this.custNm = custNm;
	}

	public String getChrgNm() {
		return chrgNm;
	}

	public void setChrgNm(String chrgNm) {
		this.chrgNm = chrgNm;
	}

	public String getCoctNo() {
		return coctNo;
	}

	public void setCoctNo(String coctNo) {
		this.coctNo = coctNo;
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

	public String getRegId() {
		return regId;
	}

	public void setRegId(String regId) {
		this.regId = regId;
	}

	public String getRegDt() {
		return regDt;
	}

	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}

	public String getUptId() {
		return uptId;
	}

	public void setUptId(String uptId) {
		this.uptId = uptId;
	}

	public String getUptDt() {
		return uptDt;
	}

	public void setUptDt(String uptDt) {
		this.uptDt = uptDt;
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

	public String getUpdateYn() {
		return updateYn;
	}

	public void setUpdateYn(String updateYn) {
		this.updateYn = updateYn;
	}

	public String getCoctNo1() {
		return coctNo1;
	}

	public void setCoctNo1(String coctNo1) {
		this.coctNo1 = coctNo1;
	}

	public String getCoctNo2() {
		return coctNo2;
	}

	public void setCoctNo2(String coctNo2) {
		this.coctNo2 = coctNo2;
	}

	public String getCoctNo3() {
		return coctNo3;
	}

	public void setCoctNo3(String coctNo3) {
		this.coctNo3 = coctNo3;
	}

	

	public int getqCurrPage() {
		return qCurrPage;
	}

	public void setqCurrPage(int qCurrPage) {
		this.qCurrPage = qCurrPage;
	}

	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public int getPageListSize() {
		return pageListSize;
	}

	public void setPageListSize(int pageListSize) {
		this.pageListSize = pageListSize;
	}

	@Override
	public String toString() {
		return "Customer [custId=" + custId + ", custNm=" + custNm + ", chrgNm=" + chrgNm + ", coctNo=" + coctNo
				+ ", emailId=" + emailId + ", emailAddrCd=" + emailAddrCd + ", emailAddrNm=" + emailAddrNm + ", regId="
				+ regId + ", regDt=" + regDt + ", uptId=" + uptId + ", uptDt=" + uptDt + ", delId=" + delId + ", delDt="
				+ delDt + ", coctNo1=" + coctNo1 + ", coctNo2=" + coctNo2 + ", coctNo3=" + coctNo3 + ", updateYn="
				+ updateYn + ", qCurrPage=" + qCurrPage + ", startIndex=" + startIndex + ", pageListSize="
				+ pageListSize + "]";
	}

	
	
}
