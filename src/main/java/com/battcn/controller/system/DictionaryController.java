package com.battcn.controller.system;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.battcn.entity.Dictionary;
import com.battcn.service.system.IDictionaryServiceApi;

@Controller
@RequestMapping("/dictionary")
public class DictionaryController {
	String prefix = "/system/dictionary/";
	
	@Autowired
	IDictionaryServiceApi dictionaryServiceApi;
	
	@RequestMapping(value="list")
	public String list(){
		return prefix+"list";
	}
	
	/**
	 * ajax添加字典
	 * @param dictionary
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="add")
	public ResponseEntity<Dictionary> save(Dictionary dictionary) throws Exception{
		dictionary.setId(null);
		dictionaryServiceApi.saveDictionary(dictionary);
		dictionary = dictionaryServiceApi.selectOne(dictionary);
		return ResponseEntity.ok(dictionary);
	}
	
	/**
	 * ajax查询字典
	 * @param dictionary
	 * @return
	 */
	@RequestMapping(value="select")
	public ResponseEntity<List<Dictionary>> select(Dictionary dictionary){
		List<Dictionary> dictionarys = dictionaryServiceApi.selectDictionaryIsActive(dictionary);
		return ResponseEntity.ok(dictionarys);
	}
	@RequestMapping(value="delete")
	public ResponseEntity<Void> delete(@RequestParam(value="id")Long id){
		dictionaryServiceApi.deleteDictionary(id);
		return ResponseEntity.ok(null);
	}
	
	@RequestMapping(value="update")
	public ResponseEntity<Dictionary> update(Dictionary dictionary){
		dictionaryServiceApi.updateDictionary(dictionary);
		dictionary = dictionaryServiceApi.selectOne(dictionary);
		return ResponseEntity.ok(dictionary);
	}
}
