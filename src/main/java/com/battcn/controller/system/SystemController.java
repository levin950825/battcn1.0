package com.battcn.controller.system;

import java.util.HashMap;
import java.util.Map;

import org.hyperic.sigar.Sigar;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.battcn.util.PropertiesUtils;
import com.battcn.util.SystemInfo;

import net.sf.json.JSONObject;

@RequestMapping("/sys/")
@Controller
public class SystemController
{

	@RequestMapping("monitor")
	public String monitor(Model model)
	{
		model.addAttribute("cpu", PropertiesUtils.findPropertiesKey("cpu"));
		model.addAttribute("jvm", PropertiesUtils.findPropertiesKey("jvm"));
		model.addAttribute("ram", PropertiesUtils.findPropertiesKey("ram"));
		model.addAttribute("toEmail", PropertiesUtils.findPropertiesKey("toEmail"));
		return "/system/sys/monitor";
	}

	@RequestMapping("info")
	public String systemInfo(Model model) throws Exception
	{
		model.addAttribute("info", SystemInfo.SystemProperty());
		return "/system/sys/info";
	}

	@ResponseBody
	@RequestMapping("usage")
	public JSONObject usage(Model model) throws Exception
	{
		return SystemInfo.usage(new Sigar());
	}
	
	/**
	 * 修改配置　
	 * @param request
	 * @param nodeId
	 * @return
	 * @throws Exception
	 */
    @ResponseBody
	@RequestMapping("/modifySer")
    public Map<String, Object> modifySer(String key,String value) throws Exception{
    	Map<String, Object> dataMap = new HashMap<String,Object>();
    	try {
		// 从输入流中读取属性列表（键和元素对）
    		PropertiesUtils.modifyProperties(key, value);
		} catch (Exception e) {
			dataMap.put("flag", false);
		}
    	dataMap.put("flag", true);
		return dataMap;
    }

}
