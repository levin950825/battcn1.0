package com.battcn.shiro;

import java.util.List;

import javax.inject.Inject;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.config.Ini;
import org.springframework.beans.factory.FactoryBean;

import com.battcn.entity.ResourcesEntity;
import com.battcn.service.system.ResourcesService;

/**
 * 产生责任链，确定每个url的访问权限
 * 
 */
public class ChainDefinitionSectionMetaSource implements FactoryBean<Ini.Section> {

	@Inject
	private ResourcesService resourcesService;

	// 静态资源访问权限
	private String filterChainDefinitions = null;

	public Ini.Section getObject() throws Exception {
		Ini ini = new Ini();
		// 加载默认的url
		ini.load(filterChainDefinitions);
		Ini.Section section = ini.getSection(Ini.DEFAULT_SECTION_NAME);
		// 循环Resource的url,逐个添加到section中。section就是filterChainDefinitionMap,
		// 里面的键就是链接URL,值就是存在什么条件才能访问该链接
		List<ResourcesEntity> lists = resourcesService.queryResourcesForList();
		for (ResourcesEntity resources : lists) {
			// 构成permission字符串
			if (StringUtils.isNotBlank(resources.getResUrl())) {
				String key = resources.getResUrl();
				key = key.substring(key.indexOf("/")+1,key.lastIndexOf(".")).replace("/",":");
				String permission = "perms[" + key + "]";
				// 如需要则 permission = "roles[" + resources.getResKey() + "]";
				section.put(resources.getResUrl(), permission);
				System.out.println(permission);
			}
		}
		// 所有资源的访问权限，必须放在最后
		/** 如果需要一个用户只能登录一处地方,,修改为 section.put("/**", "forceLogout,sysUser,kickout,authc"); **/
		/** 如果不需要 单个用户登录 ： section.put("/**", "authc");*/
		section.put("/**", "forceLogout,sysUser,kickout,authc");
		return section;
	}
	
	
	public static void main(String[] args)
	{
		
	}

	/**
	 * 通过filterChainDefinitions对默认的url过滤定义
	 * 
	 * @param filterChainDefinitions
	 *            默认的url过滤定义
	 */
	public void setFilterChainDefinitions(String filterChainDefinitions) {
		this.filterChainDefinitions = filterChainDefinitions;
	}

	public Class<?> getObjectType() {
		return this.getClass();
	}

	public boolean isSingleton() {
		return false;
	}
}
