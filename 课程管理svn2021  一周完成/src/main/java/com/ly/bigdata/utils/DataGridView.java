package com.ly.bigdata.utils;

import lombok.Data;

@Data
public class DataGridView {
		
	
	
	private Integer code=0;
	private String msg="";
	private Long count;
	private Object data;
	private Integer page=1;
	private Integer limit=10;
	public DataGridView(Object data) {
		super();
		this.data = data;
	}
	
	public DataGridView(Long count, Object data) {
		super();
		this.count = count;
		this.data = data;
	}
	public DataGridView(String msg) {
		super();
		this.msg = msg;
	}
	public DataGridView(Integer code) {
		super();
		this.code = code;
	}
	public DataGridView(Long count, String msg, Object data ) {
		super();
		this.msg = msg ;
		this.count = count;
		this.data = data;
	}

	public DataGridView() {
		
	}

}
