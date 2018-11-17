/*
package com.zhkj.anpei.common.taglib;

import java.io.IOException;

import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import org.apache.commons.lang3.StringUtils;

public class QuestionHandler extends SimpleTagSupport {

	private String value;

	@Override
	public void doTag() throws JspException, IOException {
		if (StringUtils.isBlank(value)) {
			return;
		}
		JspContext jspContext = getJspContext();
		StringBuilder sb = new StringBuilder();
		String[] arr = value.split("");
		for (String item : arr) {
			if ("1".equals(item)) {
				sb.append("A");
			} else if ("2".equals(item)) {
				sb.append("B");
			} else if ("3".equals(item)) {
				sb.append("C");
			} else if ("4".equals(item)) {
				sb.append("D");
			}
		}
		jspContext.getOut().write(sb.toString());
	}
	
	public void setValue(String value) {
		this.value = value;
	}
	
}
*/
