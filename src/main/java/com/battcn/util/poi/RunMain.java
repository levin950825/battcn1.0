package com.battcn.util.poi;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class RunMain
{
	private static final String EXCEL_PATH = "E:/Excel测试文件.xlsx";
	private static final ExcelUtil excelUtil = new ExcelUtil(KeyEntity.class);
	private static final String key[] = new String[] { "key1", "key2" };

	public static void main(String[] args) throws Exception
	{
		System.out.println("-----------------------------读-----------------------------");
		readExceToArray();
		readExcelToMap();
		readExcelToObj();
		System.out.println("-----------------------------写-----------------------------");
		writeExcelToArray();
		writeExcelToMap();
		writeExcelToObj();
		
	}




	private static void writeExcelToObj() throws Exception
	{
		List<KeyEntity> list3 = new ArrayList<KeyEntity>();
		String header[] = new String[]{"key1","key2","key3"};
		KeyEntity entity1 = new KeyEntity("-1-","-2-");
		KeyEntity entity2 = new KeyEntity("--1--","--2--");
		KeyEntity entity3 = new KeyEntity("---1---","---2---");
		list3.add(entity1);list3.add(entity2);list3.add(entity3);
		excelUtil.adapterWriteObj("E:/Obj写入的Excel测试文件.xlsx",list3,header);
	}




	private static void writeExcelToMap() throws Exception
	{
		List<Map<String, String>> list2 = new ArrayList<Map<String,String>>();
		Map<String, String> map1 = new HashMap<String, String>();
		map1.put("key1", "-写入1");
		map1.put("key2", "-写入2");
		map1.put("key3", "--写入3");
		Map<String, String> map2 = new HashMap<String, String>();
		map2.put("key1", "--写入1");
		map2.put("key2", "--写入2");
		map2.put("key3", "--写入3");
		Map<String, String> map3 = new HashMap<String, String>();
		map3.put("key1", "---写入1");
		map3.put("key2", "---写入2");
		map3.put("key3", "---写入3");
		list2.add(map1);list2.add(map2);list2.add(map3);
		String mapMeader[] = new String[]{"key3","key2","key1"};
		ExcelUtil.adapterWriteMap("E:/Map写入的Excel测试文件.xlsx", list2, mapMeader);
	}




	private static void writeExcelToArray() throws Exception
	{
		List<String[]> list1 = new ArrayList<String[]>();
		String header[] = new String[]{"key1","key2","key3"};
		String row1[] = new String[]{"-写入1","-写入2"};
		String row2[] = new String[]{"--写入1","--写入2"};
		String row3[] = new String[]{"---写入1","---写入2"};
		list1.add(header);list1.add(row1);list1.add(row2);list1.add(row3);
		ExcelUtil.adapterWriteArray("E:/Array写入的Excel测试文件.xlsx",  list1);
	}

	
	
	
	@SuppressWarnings("unchecked")
	private static void readExcelToObj() throws Exception, FileNotFoundException
	{
		System.out.println("-----------------------------华丽分割线--路径解析：默认解析--------------------------------");
		List<KeyEntity> list1 = (List<KeyEntity>) excelUtil.adapterReadObj(EXCEL_PATH);
		for (KeyEntity entity : list1)
		{
			System.out.println(entity.getKey1() + "\t" + entity.getKey2());
		}
		System.out.println("-----------------------------华丽分割线--路径解析：不解析头部--------------------------------");
		List<KeyEntity> list2 = (List<KeyEntity>) excelUtil.adapterReadObj(EXCEL_PATH, false);
		for (KeyEntity entity : list2)
		{
			System.out.println(entity.getKey1() + "\t" + entity.getKey2());
		}
		System.out.println("-----------------------------华丽分割线--流解析：默认解析--------------------------------");
		List<KeyEntity> list3 = (List<KeyEntity>) excelUtil.adapterReadObj(new FileInputStream(EXCEL_PATH));
		for (KeyEntity entity : list3)
		{
			System.out.println(entity.getKey1() + "\t" + entity.getKey2());
		}
		System.out.println("-----------------------------华丽分割线--流解析：不解析头部--------------------------------");
		List<KeyEntity> list4 = (List<KeyEntity>) excelUtil.adapterReadObj(new FileInputStream(EXCEL_PATH), false);
		for (KeyEntity entity : list4)
		{
			System.out.println(entity.getKey1() + "\t" + entity.getKey2());
		}
	}

	private static void readExcelToMap() throws Exception, FileNotFoundException
	{
		System.out.println("-----------------------------华丽分割线--路径解析：默认解析--------------------------------");
		List<Map<String, String>> list1 = ExcelUtil.adapterReadMap(EXCEL_PATH, key);
		for (Map<String, String> map : list1)
		{
			System.out.println(map.get("key1") + "\t" + map.get("key2"));
		}
		System.out.println("-----------------------------华丽分割线--路径解析：不解析头部--------------------------------");
		List<Map<String, String>> list2 = ExcelUtil.adapterReadMap(EXCEL_PATH, key, false);
		for (Map<String, String> map : list2)
		{
			System.out.println(map.get("key1") + "\t" + map.get("key2"));
		}
		System.out.println("-----------------------------华丽分割线：流解析--默认解析--------------------------------");
		File file = new File(EXCEL_PATH);
		List<Map<String, String>> list3 = ExcelUtil.adapterReadMap(new FileInputStream(file), key);
		for (Map<String, String> map : list3)
		{
			System.out.println(map.get("key1") + "\t" + map.get("key2"));
		}
		System.out.println("-----------------------------华丽分割线：流解析--不解析头部--------------------------------");
		List<Map<String, String>> list4 = ExcelUtil.adapterReadMap(new FileInputStream(file), key, false);
		for (Map<String, String> map : list4)
		{
			System.out.println(map.get("key1") + "\t" + map.get("key2"));
		}
	}

	private static void readExceToArray() throws Exception, FileNotFoundException
	{
		System.out.println("-----------------------------华丽分割线--路径解析：默认解析--------------------------------");
		List<String[]> list1 = ExcelUtil.adapterReadArray(EXCEL_PATH);
		for (int i = 0; i < list1.size(); i++)
		{
			System.out.println(list1.get(i)[0] + "\t" + list1.get(i)[1]);
		}
		System.out.println("-----------------------------华丽分割线--路径解析：不解析头部--------------------------------");
		List<String[]> list2 = ExcelUtil.adapterReadArray(EXCEL_PATH, false);
		for (int i = 0; i < list2.size(); i++)
		{
			System.out.println(list2.get(i)[0] + "\t" + list2.get(i)[1]);
		}
		System.out.println("-----------------------------华丽分割线：流解析--默认解析--------------------------------");
		File file = new File(EXCEL_PATH);
		List<String[]> list3 = ExcelUtil.adapterReadArray(new FileInputStream(file));
		for (int i = 0; i < list3.size(); i++)
		{
			System.out.println(list3.get(i)[0] + "\t" + list3.get(i)[1]);
		}
		System.out.println("-----------------------------华丽分割线：流解析--不解析头部--------------------------------");
		List<String[]> list4 = ExcelUtil.adapterReadArray(new FileInputStream(file), false);
		for (int i = 0; i < list4.size(); i++)
		{
			System.out.println(list4.get(i)[0] + "\t" + list4.get(i)[1]);
		}
	}
}
