package com.battcn.service.system;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.battcn.entity.Dictionary;
import com.battcn.service.exception.BusinessException;

public interface IDictionaryServiceApi{
	
	/**
	 * 保存单个字典信息
	 * 如果没有提供pid就是根目录
	 * 如果提供pid就要判断pid是否存在，存在执行保存
	 * @param dictionary
	 * @throws BusinessException
	 * @throws Exception 
	 */
	public void saveDictionary(Dictionary dictionary);
	
	/**
	 * 更新字典信息
	 * @param dictionary
	 * @throws BusinessException
	 */
	public void updateDictionary(Dictionary dictionary);
	
	/**
	 * 逻辑删除字典,如果有子类，所有子类也都逻辑删除
	 * @param id
	 * @throws BusinessException
	 */
	public void deleteDictionary(Long id);
	
	/**
	 * 查询所有可以是用字典
	 * @param dictionary
	 * @return
	 */
	public List<Dictionary> selectDictionaryIsActive(Dictionary dictionary);
	
	/**
	 * 查询所有已逻辑删除字典
	 * @param dictionary
	 * @return
	 */
	public List<Dictionary> selectDictionaryIsDelete(Dictionary dictionary);
	
	/**
	 * 查询单个字典信息
	 * @param dictionary
	 * @return
	 */
	public Dictionary selectOne(Dictionary dictionary);
	
	/**
	 * 通过父标签信息查询子字典
	 * @param pid
	 * @param index
	 * @param rows
	 * @return
	 */
	public PageInfo<Dictionary> selectSon(Dictionary dictionary , int num ,int size);
}
