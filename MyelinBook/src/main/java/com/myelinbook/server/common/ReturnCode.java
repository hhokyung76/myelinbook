package com.myelinbook.server.common;

public class ReturnCode {
	
	public static final String RETURN_SUCCESS = "success";
	public static final String RETURN_FAIL = "fail";
	
	
	/** Ajax 리턴코드 */
	/** 동이 없습니다. */
	public static final String AJAX_900 = "900";
	/** 타이니파머가 없습니다. */
	public static final String AJAX_901 = "901";
	/** 시리얼이 중복되었습니다. */
	public static final String AJAX_902 = "902";
	/** 다이얼ID가 중복되었습니다. */
	public static final String AJAX_903 = "903";
	
	/** 프레임워크 내부 오류코드 */
	public static final int SUCCESS = 0;
	public static final int FIAL = 999;
	
	/** 순서가 처음입니다. */
	public static final int ERROR_990 = 990;
	/** 순서가 마지막입니다. */
	public static final int ERROR_991 = 991;
	
	
	/** 재배지가 이미 있습니다. */
	public static final int ERROR_1 = 901;
	public static final int ERROR_2 = 902;
	public static final int ERROR_3 = 903;
	public static final int ERROR_4 = 904;
	public static final int ERROR_5 = 905;
	

}
