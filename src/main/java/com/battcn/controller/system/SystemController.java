package com.battcn.controller.system;

import java.util.HashMap;
import java.util.Map;

import org.hyperic.sigar.Sigar;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.battcn.entity.ServiceInfoEntity;
import com.battcn.service.system.IServiceInfoApi;
import com.battcn.util.EhcacheUtils;
import com.battcn.util.SystemInfo;
import com.github.pagehelper.PageInfo;

import net.sf.json.JSONObject;

@RequestMapping("/sys/")
@Controller
public class SystemController
{
	@Autowired
	private IServiceInfoApi serviceInfoApi;
	
	@RequestMapping("list")
	public String main()
	{
		return "/system/sys/list";
	}
	
	@RequestMapping("queryMonitorForList")
	@ResponseBody
	public PageInfo<ServiceInfoEntity> queryMonitorForList()
	{
		return this.serviceInfoApi.queryMonitorForList();
	}

	@RequestMapping("monitor")
	public String monitor(Model model)
	{
		model.addAttribute("cpu", EhcacheUtils.get("cpu"));
		model.addAttribute("jvm", EhcacheUtils.get("jvm"));
		model.addAttribute("ram", EhcacheUtils.get("ram"));
		model.addAttribute("toEmail", EhcacheUtils.get("toEmail"));
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
    		EhcacheUtils.put(key, value);
    		//PropertiesUtils.modifyProperties(key, value);
		} catch (Exception e) {
			dataMap.put("flag", false);
		}
    	dataMap.put("flag", true);
		return dataMap;
    }

}
