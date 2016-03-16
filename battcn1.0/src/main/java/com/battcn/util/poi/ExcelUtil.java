package com.battcn.util.poi;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Workbook;

public class ExcelUtil
{
	// Excel的数据格式:文本
	public final static String STYLE_STRING = "String_Type";

	// Excel的数据格式:数字
	public final static String STYLE_NUMERIC = "Numeric_Type";

	// Excel的数据格式:日期1
	public final static String STYLE_DATE1 = "yyyy-M-d";

	// 日期格式标志
	public final static int IS_DATE = 9999;

	private Class<?> entityClass;

	public ExcelUtil(Class<?> entityClass)
	{
		this.entityClass = entityClass;
	}

	/**
	 * 以文件路径的方式读取
	 * 
	 * @param sRealPath
	 *            文件路径
	 * @return List集合<数组>
	 * @throws Exception
	 */
	public static ArrayList<String[]> adapterReadArray(String sRealPath) throws Exception
	{
		return adapterReadArray(sRealPath, 0, true);
	}

	/**
	 * 以文件路径的方式读取
	 * 
	 * @param sRealPath
	 *            文件路径
	 * @param isTitle
	 *            是否解析头部：如果为true则解析,否则不解析头部
	 * @return List集合<数组>
	 * @throws Exception
	 */
	public static ArrayList<String[]> adapterReadArray(String sRealPath, boolean isTitle) throws Exception
	{
		return adapterReadArray(sRealPath, 0, isTitle);
	}

	/**
	 * 以文件路径的方式读取
	 * 
	 * @param sRealPath
	 *            文件路径
	 * @param iSheetNum
	 *            第几页:默认下标0
	 * @param isTitle
	 *            是否解析头部：如果为true则解析,否则不解析头部
	 * @return List集合<数组>
	 * @throws Exception
	 */
	public static ArrayList<String[]> adapterReadArray(String sRealPath, int iSheetNum, boolean isTitle)
			throws Exception
	{
		return ExcelUtilToArray.readExcelFileArray(sRealPath, iSheetNum, isTitle);
	}

	/**
	 * 以流的方式读取
	 * 
	 * @param in
	 * @return List集合<数组>
	 * @throws Exception
	 */
	public static ArrayList<String[]> adapterReadArray(InputStream in) throws Exception
	{
		return adapterReadArray(in, 0, true);
	}

	/**
	 * 以流的方式读取
	 * 
	 * @param in
	 * @param 是否包含头部标题
	 * @return List集合<数组>
	 * @throws Exception
	 */
	public static ArrayList<String[]> adapterReadArray(InputStream in, boolean isTitle) throws Exception
	{
		return adapterReadArray(in, 0, isTitle);
	}

	/**
	 * 以流的方式读取
	 * 
	 * @param in
	 * @param iSheetNum
	 *            从第几页开始读取：默认0
	 * @param 是否包含头部标题
	 * @return List集合<数组>
	 * @throws Exception
	 */
	public static ArrayList<String[]> adapterReadArray(InputStream in, int iSheetNum, boolean isTitle) throws Exception
	{
		return ExcelUtilToArray.readExcelFileArray(in, iSheetNum, isTitle);
	}

	public static List<Map<String, String>> adapterReadMap(String sRealPath, String key[]) throws Exception
	{
		return adapterReadMap(sRealPath, 0, key, true);
	}

	public static List<Map<String, String>> adapterReadMap(String sRealPath, String key[], boolean isTitle)
			throws Exception
	{
		return adapterReadMap(sRealPath, 0, key, isTitle);
	}

	public static List<Map<String, String>> adapterReadMap(String sRealPath, int iSheetNum, String key[],
			boolean isTitle) throws Exception
	{
		return ExcelUtilToMap.readExcelFileMap(sRealPath, iSheetNum, key, isTitle);
	}

	public static List<Map<String, String>> adapterReadMap(InputStream is, String key[]) throws Exception
	{
		return adapterReadMap(is, 0, key, true);
	}

	public static List<Map<String, String>> adapterReadMap(InputStream is, String key[], boolean isTitle)
			throws Exception
	{
		return adapterReadMap(is, 0, key, isTitle);
	}

	public static List<Map<String, String>> adapterReadMap(InputStream is, int iSheetNum, String key[], boolean isTitle)
			throws Exception
	{
		return ExcelUtilToMap.readExcelFileMap(is, iSheetNum, key, isTitle);
	}

	public List<?> adapterReadObj(String sRealPath) throws Exception
	{
		return adapterReadObj(sRealPath, 0, true);
	}

	public List<?> adapterReadObj(String sRealPath, boolean isTitle) throws Exception
	{
		return adapterReadObj(sRealPath, 0, isTitle);
	}

	public List<?> adapterReadObj(String sRealPath, int iSheetNum, boolean isTitle) throws Exception
	{
		return ExcelUtilToObject.readExcelFileToObject(sRealPath, iSheetNum, entityClass, isTitle);
	}

	public List<?> adapterReadObj(InputStream is) throws Exception
	{
		return adapterReadObj(is, 0, entityClass, true);
	}

	public List<?> adapterReadObj(InputStream is,boolean isTitle) throws Exception
	{
		return adapterReadObj(is, 0, entityClass, isTitle);
	}

	public List<?> adapterReadObj(InputStream is, int iSheetNum, Class<?> entityClass, boolean isTitle) throws Exception
	{
		return ExcelUtilToObject.readExcelFileToObject(is, iSheetNum, entityClass, isTitle);
	}

	public static void adapterWriteArray(String sFileName, List<String[]> aList) throws Exception
	{
		adapterWriteArray(null, sFileName, 0, "工作页", aList, null, null);
	}
	public static void adapterWriteArray(String sFileName, String sNameTmp, List<String[]> aList) throws Exception
	{
		adapterWriteArray(null, sFileName, 0, sNameTmp, aList, null, null);
	}

	public static void adapterWriteArray(String sFileName, String sNameTmp, List<String[]> aList,
			HttpServletResponse response) throws Exception
	{
		adapterWriteArray(null, sFileName, 0, sNameTmp, aList, null, response);
	}

	public static void adapterWriteArray(Workbook workBook, String sFileName, int iTotalSheetNum, String sNameTmp,
			List<String[]> aList) throws Exception
	{
		adapterWriteArray(workBook, sFileName, iTotalSheetNum, sNameTmp, aList, null, null);
	}

	public static void adapterWriteArray(Workbook workBook, String sFileName, int iTotalSheetNum, String sNameTmp,
			List<String[]> aList, String sTypes[], HttpServletResponse response) throws Exception
	{
		ExcelUtilToArray.createExcelFile(workBook, sFileName, iTotalSheetNum, sNameTmp, aList, sTypes, response);
	}
	
	public static void adapterWriteMap(String sFileName,List<Map<String, String>> aList,
			String header[]) throws Exception
	{
		adapterWriteMap(null, sFileName, 0, "工作页", aList, header, null, null);
	}

	public static void adapterWriteMap(String sFileName, String sNameTmp, List<Map<String, String>> aList,
			String header[]) throws Exception
	{
		adapterWriteMap(null, sFileName, 0, sNameTmp, aList, header, null, null);
	}

	public static void adapterWriteMap(String sFileName, String sNameTmp, List<Map<String, String>> aList,
			String header[], HttpServletResponse response) throws Exception
	{
		adapterWriteMap(null, sFileName, 0, sNameTmp, aList, header, null, response);
	}

	public static void adapterWriteMap(Workbook workBook, String sFileName, int iTotalSheetNum, String sNameTmp,
			List<Map<String, String>> aList, String header[]) throws Exception
	{
		adapterWriteMap(workBook, sFileName, iTotalSheetNum, sNameTmp, aList, header, null, null);
	}

	public static void adapterWriteMap(Workbook workBook, String sFileName, int iTotalSheetNum, String sNameTmp,
			List<Map<String, String>> aList, String header[], String sTypes[], HttpServletResponse response)
					throws Exception
	{
		ExcelUtilToMap.createExcelFile(workBook, sFileName, iTotalSheetNum, sNameTmp, aList, header, sTypes, response);
	}
	
	public void adapterWriteObj(String sFileName,  List<?> aList, String header[]) throws Exception
	{
		adapterWriteObj(null, sFileName, 0, "工作页", aList, header, null, null);
	}

	public void adapterWriteObj(String sFileName, String sNameTmp, List<?> aList, String header[]) throws Exception
	{
		adapterWriteObj(null, sFileName, 0, sNameTmp, aList, header, null, null);
	}

	public void adapterWriteObj(String sFileName, String sNameTmp, List<?> aList, String header[],
			HttpServletResponse response) throws Exception
	{
		adapterWriteObj(null, sFileName, 0, sNameTmp, aList, header, null, response);
	}

	public void adapterWriteObj(Workbook workBook, String sFileName, int iTotalSheetNum, String sNameTmp, List<?> aList,
			String header[]) throws Exception
	{
		adapterWriteObj(workBook, sFileName, iTotalSheetNum, sNameTmp, aList, header, null, null);
	}

	public void adapterWriteObj(Workbook workBook, String sFileName, int iTotalSheetNum, String sNameTmp, List<?> aList,
			String header[], String sTypes[], HttpServletResponse response) throws Exception
	{
		ExcelUtilToObject.createExcelFile(workBook, sFileName, iTotalSheetNum, sNameTmp, aList, header, sTypes,
				response);
	}
}
