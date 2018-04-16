package com.myelinbook.server.common.domain;

import java.io.Serializable;

public class CodeGroup implements Serializable {
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 2028994992853183061L;
	
	
	/** 코드 그룹 아이디 */
	private String codeGroupId;
	/** 코드 그룹명 */
	private String codeGroupName;
	/** 업데이터 유무 */
	private String updateYn;
	/** 업데이터 유무 */
	private String useYn;
	
	public String getCodeGroupId() {
		return codeGroupId;
	}
	public void setCodeGroupId(String codeGroupId) {
		this.codeGroupId = codeGroupId;
	}
	public String getCodeGroupName() {
		return codeGroupName;
	}
	public void setCodeGroupName(String codeGroupName) {
		this.codeGroupName = codeGroupName;
	}
	
	public String getUpdateYn() {
		return updateYn;
	}
	public void setUpdateYn(String updateYn) {
		this.updateYn = updateYn;
	}
	
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	
	@Override
	public String toString() {
		return "CodeGroup [codeGroupId=" + codeGroupId + ", codeGroupName=" + codeGroupName + ", updateYn=" + updateYn
				+ "]";
	}
	
	
	
}
