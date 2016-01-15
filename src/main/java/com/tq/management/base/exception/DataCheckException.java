package com.tq.management.base.exception;

/**
 * 数据检测异常
 * @author Administrator
 *
 */
public class DataCheckException extends Exception {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public DataCheckException(String msg) {
		super(msg);
	}
	
    public DataCheckException(String message, Throwable cause) {
        super(message, cause);
    }
	
}
