package com.battcn.util.poi;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 * excel工具类：兼容模式-可以处理xls与xlsx
 * 
 * @author 唐亚峰
 *
 */
public class ExcelUtilToObject
{

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static List readExcelFileToObject(String sRealPath, int iSheetNum, Class<?> entityClass, boolean isTitle)
			throws Exception
	{
		List arrayList = new ArrayList();
		// 判断文件路径是否存在
		File fTmp = new File(sRealPath);
		if (!fTmp.exists())
			throw new Exception("文件路径不存在！");
		// 获取文件流,并创建一个EXCEL文件对象
		FileInputStream is = new FileInputStream(fTmp);
		Workbook workBook = WorkbookFactory.create(is);
		int iRowNum = 0; // 每个工作表中行数量
		int iCellNum = 0; // 每行中的单元数量
		iSheetNum = workBook.getNumberOfSheets(); // 获取SHEET数量(即使是空的SHEET也包括在内)

		/** (开始)开始读取每个工作表数据 */
		for (int i = 0; i < iSheetNum; i++, iRowNum = 0)
		{
			Sheet sheetTmp = workBook.getSheetAt(i);
			/**
			 * 获取当前SHEET的行数（即使SHEET是空的，它默认也是记录数0+1=1）
			 * 这个说明了getLastRowNum()只获取最后一个行数，不管前面是否有空行
			 */
			iRowNum = sheetTmp.getLastRowNum() + 1;

			/** (开始)读取行数据 */
			int j = 0;
			if (!isTitle)
			{
				j = 1;
				isTitle = true;
			}
			for (; j < iRowNum; j++, iCellNum = 0)
			{
				Row rowTmp = sheetTmp.getRow(j);
				sheetTmp.autoSizeColumn(j);
				// 判断是否是空行
				if (rowTmp == null)
					continue;
				/**
				 * 获取每行的最后一个单元序列 其实，获取到的值都是一样的，而且是这个SHEET列数最大值
				 */
				iCellNum = rowTmp.getLastCellNum();
				if (rowTmp.getCell(iCellNum) != null)
					iCellNum = iCellNum + 1;

				Object obj = entityClass.newInstance();
				Field[] fields = obj.getClass().getDeclaredFields();

				/** (开始)读取每行的每个单元 */
				for (int k = 0; k < iCellNum; k++)
				{
					Cell cellTmp = rowTmp.getCell(k);

					// 判断该属性是否能访问
					Field f = fields[k];
					if (f.getName().equals("serialVersionUID"))
						continue;
					if (!f.isAccessible())
						// 把不能访问的属性设为能访问
						f.setAccessible(true);
					// 判断是否是空的CELL
					if (cellTmp == null)
					{
						f.set(obj, new String(""));
						continue;
					}
					// 获取每个CELL的样式
					int cellType = cellTmp.getCellType();
					switch (cellType)
					{
					case Cell.CELL_TYPE_STRING: // 文本类型
						f.set(obj, String.valueOf((cellTmp.getStringCellValue())));
						break;
					case Cell.CELL_TYPE_NUMERIC:
					{ // 文本类型

						// 判断是否是日期型数据
						if (DateUtil.isCellDateFormatted(cellTmp))
						{
							Date dTmp = cellTmp.getDateCellValue();
							// 将成日期类型转化字符串
							SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
							f.set(obj, String.valueOf(df.format(dTmp)));
						} else
						{

							/**
							 * 由于API版本问题，不能识别"2007年07月14日","2007-06-02"这种格式的日期数据
							 * 所以需要判断它的style,以进一步识别该日期格式 (有待改善)
							 */
							CellStyle style = cellTmp.getCellStyle();
							int idd = style.getDataFormat();

							// 2007年07月14日===189;2007年7月14日====185;2007-06-02====188
							if (idd == 185 || idd == 189 || idd == 188)
							{
								Date dTmp = cellTmp.getDateCellValue();
								// 将成日期类型转化字符串
								SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
								f.set(obj, String.valueOf(df.format(dTmp)));

							} else
							{
								Double d = new Double(cellTmp.getNumericCellValue());
								f.set(obj, String.valueOf(NumberFormat.getInstance().format(d).replace(",", "")));
							}
						}
						break;
					}
					}
				}
				// 将map 两种方式都可以
				// BeanUtils.populate(obj, aValues);
				arrayList.add(obj);
			}
			/** (结束)读取行数据 */
		}
		/** (结束)开始读取每个工作表数据 */
		return arrayList;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static List<?> readExcelFileToObject(InputStream is, int iSheetNum, Class<?> entityClass, boolean isTitle)
			throws Exception
	{
		List arrayList = new ArrayList();
		Workbook workBook = WorkbookFactory.create(is);
		int iRowNum = 0; // 每个工作表中行数量
		int iCellNum = 0; // 每行中的单元数量
		iSheetNum = workBook.getNumberOfSheets(); // 获取SHEET数量(即使是空的SHEET也包括在内)

		/** (开始)开始读取每个工作表数据 */
		for (int i = 0; i < iSheetNum; i++, iRowNum = 0)
		{
			Sheet sheetTmp = workBook.getSheetAt(i);
			/**
			 * 获取当前SHEET的行数（即使SHEET是空的，它默认也是记录数0+1=1）
			 * 这个说明了getLastRowNum()只获取最后一个行数，不管前面是否有空行
			 */
			iRowNum = sheetTmp.getLastRowNum() + 1;

			/** (开始)读取行数据 */
			int j = 0;
			if (!isTitle)
			{
				j = 1;
				isTitle = true;
			}
			for (; j < iRowNum; j++, iCellNum = 0)
			{
				Row rowTmp = sheetTmp.getRow(j);
				sheetTmp.autoSizeColumn(j);
				// 判断是否是空行
				if (rowTmp == null)
					continue;
				/**
				 * 获取每行的最后一个单元序列 其实，获取到的值都是一样的，而且是这个SHEET列数最大值
				 */
				iCellNum = rowTmp.getLastCellNum();
				if (rowTmp.getCell(iCellNum) != null)
					iCellNum = iCellNum + 1;

				Object obj = entityClass.newInstance();
				Field[] fields = obj.getClass().getDeclaredFields();

				/** (开始)读取每行的每个单元 */
				for (int k = 0; k < iCellNum; k++)
				{
					Cell cellTmp = rowTmp.getCell(k);

					// 判断该属性是否能访问
					Field f = fields[k];
					if (f.getName().equals("serialVersionUID"))
						continue;
					if (!f.isAccessible())
						// 把不能访问的属性设为能访问
						f.setAccessible(true);
					// 判断是否是空的CELL
					if (cellTmp == null)
					{
						f.set(obj, new String(""));
						continue;
					}
					// 获取每个CELL的样式
					int cellType = cellTmp.getCellType();
					switch (cellType)
					{
					case Cell.CELL_TYPE_STRING: // 文本类型
						f.set(obj, String.valueOf((cellTmp.getStringCellValue())));
						break;
					case Cell.CELL_TYPE_NUMERIC:
					{ // 文本类型

						// 判断是否是日期型数据
						if (DateUtil.isCellDateFormatted(cellTmp))
						{
							Date dTmp = cellTmp.getDateCellValue();
							// 将成日期类型转化字符串
							SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
							f.set(obj, String.valueOf(df.format(dTmp)));
						} else
						{

							/**
							 * 由于API版本问题，不能识别"2007年07月14日","2007-06-02"这种格式的日期数据
							 * 所以需要判断它的style,以进一步识别该日期格式 (有待改善)
							 */
							CellStyle style = cellTmp.getCellStyle();
							int idd = style.getDataFormat();

							// 2007年07月14日===189;2007年7月14日====185;2007-06-02====188
							if (idd == 185 || idd == 189 || idd == 188)
							{
								Date dTmp = cellTmp.getDateCellValue();
								// 将成日期类型转化字符串
								SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
								f.set(obj, String.valueOf(df.format(dTmp)));

							} else
							{
								Double d = new Double(cellTmp.getNumericCellValue());
								f.set(obj, String.valueOf(NumberFormat.getInstance().format(d).replace(",", "")));
							}
						}
						break;
					}
					}
				}
				// 将map 两种方式都可以
				// BeanUtils.populate(obj, aValues);
				arrayList.add(obj);
			}
			/** (结束)读取行数据 */
		}
		/** (结束)开始读取每个工作表数据 */
		return arrayList;
	}

	/**
	 * 生成一个EXCEL文件同时提供下载功能
	 * 
	 * @param sFileName
	 *            //EXCEL文件名
	 * @param sheetBaseName
	 *            //工作表基本名称
	 * @param aList
	 *            //EXCEL 数据集合
	 * @param sTypes
	 *            //写入EXCEL文件的数据样式(文本,数字,日期等等)例如,"String","Numeric","yyyy-MM-dd"
	 *            ；若为NULL，则默认为文本
	 * @param isTitle
	 *            //如果要在生成的EXCEL文件中包含标题（只有第一个工作表SHEET有标题）,则isTitle设为True,反之亦然
	 * @param response
	 *            //利用Html的Response对象 输出下载的数据流，若为null,则不提供下载功能。
	 * @author
	 */
	public static void createExcelFile(Workbook workBook, String sFileName, int iTotalSheetNum, String sNameTmp, List<?> aList,
			String header[], String sTypes[], HttpServletResponse response) throws Exception
	{

		int MAX_COUNT_NUMBER = 0;
		String fileSuffix = sFileName.substring(sFileName.lastIndexOf("."), sFileName.length());
		// 判断文件名是否正确的扩展名(.xls)
		if (sFileName != null && !sFileName.equals(""))
		{
			if (sFileName.lastIndexOf(".xlsx") == -1 || sFileName.lastIndexOf(".xls") == -1)
			{
				throw new Exception(sFileName + "　文件扩展名不正确．");
			}
			MAX_COUNT_NUMBER = fileSuffix.equals(".xls") ? 30000 : 300000;
		} else
			throw new Exception("Null value or length equals 0");

		// 判断数据集合是否为空
		if (aList == null)
			throw new Exception("数据集合为Null");

		// 创建一个工作簿
		if (workBook == null)
		{
			workBook = fileSuffix.equals(".xls") ? new HSSFWorkbook() : new XSSFWorkbook();
		}
		// 获取EXCEL的样式实例
		CellStyle cellStyle = workBook.createCellStyle();
		Font font = workBook.createFont();

		/** (开始)写入数据到工作簿 */
		if (aList != null && aList.size() > 0)
		{
			// 数据大小
			int iDataSize = aList.size();
			// 临时工作表
			Sheet sheetTmp = null;
			// 当前工作表的记录数（行数）
			int iCountNum = MAX_COUNT_NUMBER;

			if (header != null)
			{
				sheetTmp = workBook.createSheet();
				Row row = sheetTmp.createRow(0);
				font.setFontName("宋体");
				cellStyle.setAlignment(CellStyle.ALIGN_CENTER);
				for (int j = 0; j < header.length; j++)
				{
					Cell cell = row.createCell((short) j); // 创建数据单元
					cell.setCellStyle(cellStyle);
					cell.setCellType(Cell.CELL_TYPE_STRING);
					cell.setCellValue(header[j]);
				}
				iCountNum = 1;
			}

			// 判断是否有标题,如果有标题,将标题临时保存
			for (int i = 0; i < iDataSize; i++, iCountNum++)
			{
				if (iCountNum == MAX_COUNT_NUMBER)
				{
					/**
					 * 创建一个新的工作表 说明:如果用createSheet(String
					 * fileName)方法，当filename有中文字符时，会出现编码问题。
					 * 为解决这个问题，我们使用createSheet(),setSheetName()两个方法结合使用
					 */
					sheetTmp = workBook.createSheet();
					workBook.setSheetName(iTotalSheetNum, sNameTmp);
					// 当前的工作表记录数又重１开始计算,到MAX_COUNT_NUMBER
					iCountNum = 0;
				}

				// 获取数据
				// 从集合获取一个实体
				Object obj = aList.get(i);
				// 反射获取实体字段
				Field[] fields = obj.getClass().getDeclaredFields();
				// 创建工作表的行(最顶行索引值为0)
				Row row = sheetTmp.createRow(iCountNum);
				font.setFontName("宋体");
				cellStyle.setAlignment(CellStyle.ALIGN_CENTER);
				if (sTypes == null || sTypes.length == 0)
				{
					font.setFontHeightInPoints((short) 12);// 设置字体大小
					cellStyle.setFont(font);
					// 循环所有属性
					for (int j = 0; j < fields.length; j++)
					{
						sheetTmp.autoSizeColumn(j);
						// 创建单元格
						Cell cell = row.createCell(j);
						cell.setCellStyle(cellStyle);
						cell.setCellType(Cell.CELL_TYPE_STRING); // 设置数据格式(文本)
						// 判断该属性是否能访问
						Field f = fields[j];
						if (f.getName().equals("serialVersionUID"))
							continue;
						if (!f.isAccessible())
							// 把不能访问的属性设为能访问
							f.setAccessible(true);
						// 获取f的值
						Object value = f.get(obj);
						// 设置单元格的值
						cell.setCellValue(value.toString());
					}
				} else
				{
					cellStyle.setFont(font);
					font.setFontHeightInPoints((short) 12);// 设置字体大小
					for (int j = 0; j < fields.length; j++)
					{
						Cell cell = row.createCell((short) j); // 创建数据单元
						cell.setCellStyle(cellStyle);
						if (sTypes[j].equals(ExcelUtil.STYLE_STRING))
						{// 文本类型
							cell.setCellType(Cell.CELL_TYPE_STRING);
							// 判断该属性是否能访问
							Field f = fields[j];
							if (f.getName().equals("serialVersionUID"))
								continue;
							if (!f.isAccessible())
								// 把不能访问的属性设为能访问
								f.setAccessible(true);
							// 获取f的值
							Object value = f.get(obj);
							// 设置单元格的值
							cell.setCellValue(value.toString());
						} else if (sTypes[j].equals(ExcelUtil.STYLE_NUMERIC))
						{// 数字类型
							cell.setCellType(Cell.CELL_TYPE_NUMERIC);
							// 判断该属性是否能访问
							Field f = fields[j];
							if (f.getName().equals("serialVersionUID"))
								continue;
							if (!f.isAccessible())
								// 把不能访问的属性设为能访问
								f.setAccessible(true);
							// 获取f的值
							Object value = f.get(obj);
							// 设置单元格的值
							cell.setCellValue(Double.parseDouble(value.toString()));
						} else if (sTypes[j].equals(ExcelUtil.STYLE_DATE1))
						{ // 日期型(必须在HSSFStyle设置)
							/**
							 * HSSFDataFormat内置的编码格式只有"m/d/yy" or "m/d/yy h:mm"
							 * 没有"mm/dd/yyyy" ,"yyyy年MM月dd日"的编码格式(有待解决)
							 */
							cell.setCellStyle(cellStyle);
							// 将字符串转化成日期类型
							SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
							// 判断该属性是否能访问
							Field f = fields[j];
							if (f.getName().equals("serialVersionUID"))
								continue;
							if (!f.isAccessible())
								// 把不能访问的属性设为能访问
								f.setAccessible(true);
							// 获取f的值
							Object value = f.get(obj);
							// 设置单元格的值
							cell.setCellValue(df.parse(value.toString()));
						} else
						{
							cell.setCellType(Cell.CELL_TYPE_STRING);
							// 判断该属性是否能访问
							Field f = fields[j];
							if (f.getName().equals("serialVersionUID"))
								continue;
							if (!f.isAccessible())
								// 把不能访问的属性设为能访问
								f.setAccessible(true);
							// 获取f的值
							Object value = f.get(obj);
							// 设置单元格的值
							cell.setCellValue(value.toString());
						}
					}
				}
			}
		}
		/** (结束)写入数据到工作簿 */
		// 如果是下载的情况，直接向response中写入数据
		if (response != null)
		{
			/*
			 * ContentType指定文件类型 可以为application/ms-excel application/ms-word
			 * application/ms-txt application/ms-html 或其他浏览器可直接支持文档
			 */
			response.reset();
			response.setContentType("application/ms-excel");
			String sSimpleName = sFileName.substring(sFileName.lastIndexOf("/") + 1, sFileName.length());
			response.setHeader("Content-Disposition",
					"attachment;filename=" + new String(sSimpleName.getBytes(), "ISO-8859-1"));
			long s1 = System.currentTimeMillis();
			ServletOutputStream out_s = response.getOutputStream();
			BufferedOutputStream bosTmp = new BufferedOutputStream(out_s, 1024 * 1024 * 20);
			// 把相应的Excel 工作簿存盘
			workBook.write(bosTmp);

			long s2 = System.currentTimeMillis();
			System.out.println("把相应的Excel 工作簿存盘所花时间：" + (s2 - s1) / 1000.0);
			bosTmp.flush();
			bosTmp.close();
		} else
		{
			// 新建一输出文件流
			FileOutputStream fOut = new FileOutputStream(sFileName);
			BufferedOutputStream bos = new BufferedOutputStream(fOut, 1024 * 1024 * 20);
			// 把相应的Excel 工作簿存盘
			workBook.write(bos);
			bos.flush();
			// 操作结束，关闭文件
			bos.close();
		}
	}

}
