package com.battcn.service.system.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.battcn.entity.Dictionary;
import com.battcn.entity.Dictionary.Status;
import com.battcn.mapper.DictionaryMapper;
import com.battcn.service.BaseServiceImpl;
import com.battcn.service.exception.BusinessException;
import com.battcn.service.system.IDictionaryServiceApi;

@Service
public class DictionaryServiceImpl extends BaseServiceImpl<Dictionary>implements IDictionaryServiceApi {
	@Autowired
	DictionaryMapper dictionaryMapper;

	@Override
	public void saveDictionary(Dictionary dictionary) {
		Long pid = dictionary.getParentId();
		if(pid != null && pid != 0L){
			//如果有父id，就先去判断父是否存在
			Dictionary parent = dictionaryMapper.selectByPrimaryKey(pid);
			if(parent==null){
				throw new BusinessException("insert dictionary error,parentId is no exists,pid:["+pid+"]");
			}
		}else{
			dictionary.setParentId(0L);
		}
		dictionary.setCreateTime(new Date());
		dictionary.setStatus(Dictionary.Status.ACTIVE.getValue());
		int count = dictionaryMapper.insertSelective(dictionary);
		if (count != 1) {
			throw new BusinessException("insert dictionary error");
		}
	}

	@Override
	public void updateDictionary(Dictionary dictionary) {
		dictionary.setCreateTime(null);
		dictionary.setUpdateTime(new Date());
		int count = dictionaryMapper.updateByPrimaryKeySelective(dictionary);
		if (count != 1) {
			throw new BusinessException("update dictionary error");
		}
	}

	@Override
	public void deleteDictionary(Long id) {
		deleteDict(id);
		List<Dictionary> sons = selectSons(id);
		if (sons != null) {
			for (Dictionary dictionary : sons) {
				// 递归删除
				// todo,以后可以考虑用多线程去操作
				deleteDictionary(dictionary.getId());
			}
		}
	}

	/**
	 * 根据主键逻辑删除单个字典
	 * 
	 * @param id
	 * @return
	 * @throws BusinessException
	 */
	private void deleteDict(Long id) {
		Dictionary d = dictionaryMapper.selectByPrimaryKey(id);
		if(d.getStatus()==(Dictionary.Status.DELETE.getValue())){
			throw new BusinessException("id=["+id+"] dictionary is deleted");
		}
		if(d.getId() == null){
			throw new BusinessException("id=["+id+"] dictionary is not exists");
		}
		d.setCreateTime(null);
		d.setUpdateTime(new Date());
		d.setStatus(Dictionary.Status.DELETE.getValue());
		int count = dictionaryMapper.updateByPrimaryKeySelective(d);
		if (count != 1) {
			throw new BusinessException("delete dictionary error");
		}
	}

	/**
	 * 提供主键，查询是否有子
	 * 
	 * @param id
	 * @return 有子返回整个子，没有返回null
	 */
	private List<Dictionary> selectSons(Long parentId) {
		Dictionary d = new Dictionary();
		d.setParentId(parentId);
		List<Dictionary> dictionarys = dictionaryMapper.select(d);
		return dictionarys.isEmpty() ? null : dictionarys;
	}

	@Override
	@Transactional(readOnly=true)
	public List<Dictionary> selectDictionaryIsActive(Dictionary dictionary) {
		return this.selectDictionary(dictionary, Dictionary.Status.ACTIVE);
	}

	@Override
	@Transactional(readOnly=true)
	public List<Dictionary> selectDictionaryIsDelete(Dictionary dictionary) {
		return this.selectDictionary(dictionary, Dictionary.Status.DELETE);
	}

	@Override
	@Transactional(readOnly=true)
	public Dictionary selectOne(Dictionary dictionary) {
		dictionary.setStatus(null);
		return dictionaryMapper.selectOne(dictionary);
	}

	private List<Dictionary> selectDictionary(Dictionary dictionary, Status status) {
		dictionary.setStatus(status.getValue());
		return dictionaryMapper.select(dictionary);
	}

	@Override
	@Transactional(readOnly=true)
	public PageInfo<Dictionary> selectSon(Dictionary dictionary, int num, int size) {
		PageHelper.startPage(num, size);
		List<Dictionary> lists = dictionaryMapper.select(dictionary);
		PageInfo<Dictionary> page = new PageInfo<Dictionary>(lists);
		return page;
	}

}
