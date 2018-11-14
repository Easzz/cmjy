package com.shenxuan.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

/**
 * Created by 沈轩 on 2018/11/14 21:55
 */
@Controller
public class IndexController {

	@RequestMapping(value = {"/", "/view"})
	public String view(Map<String, Object> map) {
		map.put("name", "SpringBoot");
		map.put("date", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		return "index";
	}
}
