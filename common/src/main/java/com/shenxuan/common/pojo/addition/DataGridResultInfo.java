package com.shenxuan.common.pojo.addition;

import java.util.ArrayList;
import java.util.List;

/**
 * 统一的传递给easyui的datagrid的类
 * 
 * @author monkey
 * @date 2016年6月3日 下午6:48:33
 */
public class DataGridResultInfo {

	// 总条数
	private int total;

	// 结果集
	private List rows = new ArrayList();
	
	public DataGridResultInfo() {
	}

	public DataGridResultInfo(int total, List rows) {
		this.total = total;
		this.rows = rows;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public List getRows() {
		return rows;
	}

	public void setRows(List rows) {
		this.rows = rows;
	}
	
	public static DataGridResultInfo of(List rows, int total) {
		return new DataGridResultInfo(total, rows);
	}
}
