package com.myelinbook.server.common.domain;

import java.io.Serializable;
import java.util.Arrays;

public class Code implements Serializable {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 6658712585854634962L;
	
	/** 코드 그룹 아이디 */
	private String codeGroupId;
	/** 코드 그룹명 */
	private String codeGroupName;
	
	
	/** 코드ID */
	private String[] codeIds;
	
	/** 코드ID */
	private String codeId;
	/** 코드명 */
	private String codeName;
	/** 코드순서 */
	private String codeOrder;
	/** 비고 */
	private String remark;
	/** 사용여부 */
	private String useYn;
	

	/** 수정 여부 */
	private String updateYn;
	
	
	public String[] getCodeIds() {
		return codeIds;
	}
	public void setCodeIds(String[] codeIds) {
		this.codeIds = codeIds;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getCodeOrder() {
		return codeOrder;
	}
	public void setCodeOrder(String codeOrder) {
		this.codeOrder = codeOrder;
	}
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
	public String getCodeId() {
		return codeId;
	}
	public void setCodeId(String codeId) {
		this.codeId = codeId;
	}
	public String getCodeName() {
		return codeName;
	}
	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	public String getUpdateYn() {
		return updateYn;
	}
	public void setUpdateYn(String updateYn) {
		this.updateYn = updateYn;
	}
	@Override
	public String toString() {
		return "Code [codeGroupId=" + codeGroupId + ", codeGroupName=" + codeGroupName + ", codeIds="
				+ Arrays.toString(codeIds) + ", codeId=" + codeId + ", codeName=" + codeName + ", codeOrder="
				+ codeOrder + ", remark=" + remark + ", useYn=" + useYn + "]";
	}

	
}
