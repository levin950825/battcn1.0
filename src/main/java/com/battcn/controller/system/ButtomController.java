package com.battcn.controller.system;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.battcn.entity.ButtomEntity;
import com.battcn.service.system.ButtomService;

@Controller
@RequestMapping("/buttom/")
public class ButtomController
{
	@Autowired
	private ButtomService buttomService;
	
	@RequestMapping("list")
	public String list()
	{
		return "/system/buttom/list";
	}
	
	@RequestMapping("queryButtomForList")
	@ResponseBody
	public PageInfo<ButtomEntity> queryButtomForList()
	{
		return this.buttomService.queryButtomForList();
	}
}
