package com.shenxuan.common.utils;

import java.text.MessageFormat;
import java.util.*;

/**
 * 资源文件读取工具类
 * 
 * @author monkey
 * @date 2016年6月6日 下午6:37:41
 */
public class ResourcesUtil {
	/**
	 * 系统语言环境，默认为中文zh
	 */
	public static final String LANGUAGE = "zh";

	/**
	 * 系统国家环境，默认为中国CN
	 */
	public static final String COUNTRY = "CN";
	private static Locale getLocale() {
		Locale locale = new Locale(LANGUAGE, COUNTRY);
		return locale;
	}

	/**
	 * 根据语言、国家、资源文件名和key名字获取资源文件值
	 * 
	 * @param language
	 *            语言
	 * 
	 * @param country
	 *            国家
	 * 
	 * @param baseName
	 *            资源文件名
	 * 
	 * @param section
	 *            key名字
	 * 
	 * @return 值
	 */
	private static String getProperties(String baseName, String section) {
		String retValue = "";
		try {
			Locale locale = getLocale();
			ResourceBundle rb = ResourceBundle.getBundle(baseName, locale);
			retValue = (String) rb.getObject(section);
		} catch (Exception e) {
			//e.printStackTrace();//打印错误信息
			// 抛出去
			throw new RuntimeException(e);
		}
		return retValue;
	}

	/**
	 * 通过key从资源文件读取内容
	 * 
	 * @param fileName
	 *            资源文件名
	 * 
	 * @param key
	 *            索引
	 * 
	 * @return 索引对应的内容
	 */
	public static String getValue(String fileName, String key) {
		String value = getProperties(fileName,key);
		return value;
	}

	public static List<String> gekeyList(String baseName) {
		Locale locale = getLocale();
		ResourceBundle rb = ResourceBundle.getBundle(baseName, locale);

		List<String> reslist = new ArrayList<String>();

		Set<String> keyset = rb.keySet();
		for (Iterator<String> it = keyset.iterator(); it.hasNext();) {
			String lkey = (String)it.next();
			reslist.add(lkey);
		}

		return reslist;

	}

	/**
	 * 通过key从资源文件读取内容，并格式化
	 * 
	 * @param fileName
	 *            资源文件名
	 * 
	 * @param key
	 *            索引
	 * 
	 * @param objs
	 *            格式化参数
	 * 
	 * @return 格式化后的内容
	 */
	public static String getValue(String fileName, String key, Object[] objs) {
		String pattern = getValue(fileName, key);
		String value = MessageFormat.format(pattern, objs);
		return value;
	}

	public static void main(String[] args) {
		//封装后的写法：传递参数写法，个人认为，最后其实可以把文件名resources.messages也封装了。
		//如果找到不到编号，会报错。
		System.out.println(getValue("resources.messages", "301"));
		//这个方法可以传参，里面有占位符
		System.out.println(getValue("resources.messages", "302",new Object[]{100,200}));
		
		//原始写法：
		//根据操作系统环境获取语言环境
		/*Locale locale = Locale.getDefault();
		System.out.println(locale.getCountry());//输出国家代码
		System.out.println(locale.getLanguage());//输出语言代码s
		System.out.println(locale.getDisplayName());*/
		
		/*//加载国际化资源（classpath下resources目录下的messages.properties，如果是中文环境会优先找messages_zh_CN.properties）
		ResourceBundle rb = ResourceBundle.getBundle("resources.messages", locale);
		String retValue = rb.getString("101");//101是messages.properties文件中的key
		System.out.println(retValue);
		
		//信息格式化，如果资源中有{}的参数则需要使用MessageFormat格式化，Object[]为传递的参数，数量根据资源文件中的{}个数决定
		String value = MessageFormat.format(retValue, new Object[]{100,200});
		System.out.println(value);*/
	}
}
