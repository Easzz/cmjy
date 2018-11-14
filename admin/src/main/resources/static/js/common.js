(function ($) {
	'use strict';
	//备份jquery的ajax方法  
	var _ajax = $.ajax;
	//重写jquery的ajax方法
	$.ajax = function (opt) {
		//备份opt中error和success方法
		var fn = {
			error: function (XMLHttpRequest, textStatus, errorThrown) {
			},
			success: function (data, textStatus) {
			}
		};
		if (opt.error) {
			fn.error = opt.error;
		}
		if (opt.success) {
			fn.success = opt.success;
		}
		//扩展增强处理
		var _opt = $.extend(opt, {
			error: function (XMLHttpRequest, textStatus, errorThrown) {
				parent.layer.alert('网络错误,请稍候重试', {icon: 2});
				//错误方法增强处理
				fn.error(XMLHttpRequest, textStatus, errorThrown);
			},
			success: function (data, textStatus) {

				//如果是失败的情况,则提示错误消息
				if (data.resultInfo && data.resultInfo.success == false) {
					parent.layer.alert(data.resultInfo.message, {icon: 2});
					if (data.resultInfo.messageCode == 106) {
						window.location.href = '/driverConsumptionBack/logoutSkip.action';
					}
				}
				//成功回调方法增强处理
				fn.success(data, textStatus);
			}
		});
		return _ajax(_opt);
	};

	//form表单数据转成json对象
	$.fn.serializeJson = function () {
		var serializeObj = {};
		var array = this.serializeArray();
		$(array).each(function () {
			if (serializeObj[this.name]) {
				if ($.isArray(serializeObj[this.name])) {
					serializeObj[this.name].push(this.value);
				} else {
					serializeObj[this.name] = [serializeObj[this.name], this.value];
				}
			} else {
				serializeObj[this.name] = this.value;
			}
		});
		return serializeObj;
	};
})(jQuery);


/**
 * 根据key获取解析到的字典数据
 * @param dicData 字典数据
 * @param dickey 字典中的key
 */
function analysisDicData(dicData, dickey) {

	var result = "数据未查到";//默认没有解析到数据
	//处理数据
	var tempData = dicData.replace('{', "").replace('}', "").replace(/ /g, "").split(",");

	var newDic = new Array();//最后存数据的字典

	//解析数据存放字典中
	for (var key in tempData) {
		var smallArray = tempData[key].split("=");
		newDic[smallArray[0]] = smallArray[1];
	}

	//判断是否解析到数据
	if (newDic[dickey]) {
		result = newDic[dickey];
	}

	return result;
}


/*
Array.prototype.distinct_check = function(){
	var arr = this,
		result = [],
		i,
		j,
		len = arr.length;
	for(i = 0; i < len; i++){
		for(j = i + 1; j < len; j++){
			if(arr[i] === arr[j]){
				j = ++i;
			}
		}
		result.push(arr[i]);
	}
	return result;
}
*/
/**
 * 格式化时间差，转换为年月日
 * @param period 时间差毫秒
 */
function getDifferDate(period) {
	var yearLevelValue = 365 * 24 * 60 * 60 * 1000;
	var monthLevelValue = 30 * 24 * 60 * 60 * 1000;
	var dayLevelValue = 24 * 60 * 60 * 1000;
	var hourLevelValue = 60 * 60 * 1000;
	var minuteLevelValue = 60 * 1000;
	var secondLevelValue = 1000;

	function getDifference(period) {
		/*******计算出时间差中的年、月、日、天、时、分、秒*******/
		var year = parseInt(getYear(period));
		var month = parseInt(getMonth(period - year * yearLevelValue));
		var day = parseInt(getDay(period - year * yearLevelValue - month * monthLevelValue));
		var hour = parseInt(getHour(period - year * yearLevelValue - month * monthLevelValue - day * dayLevelValue));
		var minute = parseInt(getMinute(period - year * yearLevelValue - month * monthLevelValue - day * dayLevelValue - hour * hourLevelValue));
		var second = parseInt(getSecond(period - year * yearLevelValue - month * monthLevelValue - day * dayLevelValue - hour * hourLevelValue - minute * minuteLevelValue));
		var result = "";
		if (year != 0) result = result + year + "年";
		if (month != 0) result = result + month + "个月";
		if (day != 0) result = result + day + "天";
		//result = result + hour + "时" + minute + "分" + second + "秒";
		if (year == 0 && month == 0 && day == 0) {
			result = result + "1天";
		}

		function getYear(period) {
			return parseInt(period) / yearLevelValue;
		}

		function getMonth(period) {
			return parseInt(period) / monthLevelValue;
		}

		function getDay(period) {
			return parseInt(period) / dayLevelValue;
		}

		function getHour(period) {
			return parseInt(period) / hourLevelValue;
		}

		function getMinute(period) {
			return parseInt(period) / minuteLevelValue;
		}

		function getSecond(period) {
			return parseInt(period) / secondLevelValue;
		}

		return result;
	}

	return getDifference(period);
}

/**
 * 格式化日期
 * @param fmt
 * @returns {*}
 */
Date.prototype.format = function (fmt) {
	var o = {
		"M+": this.getMonth() + 1,                 //月份
		"d+": this.getDate(),                    //日
		"h+": this.getHours(),                   //小时
		"m+": this.getMinutes(),                 //分
		"s+": this.getSeconds(),                 //秒
		"q+": Math.floor((this.getMonth() + 3) / 3), //季度
		"S": this.getMilliseconds()             //毫秒
	};
	if (/(y+)/.test(fmt)) {
		fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
	}
	for (var k in o) {
		if (new RegExp("(" + k + ")").test(fmt)) {
			fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
		}
	}
	return fmt;
}

/**************************************时间格式化处理************************************/
/**
 *
 * @param fmt
 * @param date
 * @returns {*}
 */
function dateFtt(fmt, date) {
	var o = {
		"M+": date.getMonth() + 1,                 //月份
		"d+": date.getDate(),                    //日
		"h+": date.getHours(),                   //小时
		"m+": date.getMinutes(),                 //分
		"s+": date.getSeconds(),                 //秒
		"q+": Math.floor((date.getMonth() + 3) / 3), //季度
		"S": date.getMilliseconds()             //毫秒
	};
	if (/(y+)/.test(fmt))
		fmt = fmt.replace(RegExp.$1, (date.getFullYear() + "").substr(4 - RegExp.$1.length));
	for (var k in o)
		if (new RegExp("(" + k + ")").test(fmt))
			fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
	return fmt;
}