package com.battcn.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.github.pagehelper.StringUtil;

public class CommonUtil
{

	//private static final String EN_NAME = "en_name";

	//private static final String ZH_NAME = "zh_name";

	//private static final String ZB_NAME = "zb_name";

	/**
	 * 获取HttpServletRequest;
	 * 
	 * @return [参数说明]
	 * 
	 * @return HttpServletRequest [返回类型说明]
	 * @exception throws
	 *                [违例类型] [违例说明]
	 * @see [类、类#方法、类#成员]
	 */
	public static HttpServletRequest getHttpRequest()
	{
		return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
	}

	/**
	 * 获取文件扩展名;
	 * 
	 * @param fileName
	 * @return [参数说明]
	 * 
	 * @return String [返回类型说明]
	 * @exception throws
	 *                [违例类型] [违例说明]
	 * @see [类、类#方法、类#成员]
	 */
	public static String getFileExtension(String fileName)
	{
		if (StringUtil.isEmpty(fileName))
		{
			return null;
		}
		return fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length());
	}

	/**
	 * 获取文件扩展名;
	 * 
	 * @param fileName
	 * @return [参数说明]
	 * 
	 * @return String [返回类型说明]
	 * @exception throws
	 *                [违例类型] [违例说明]
	 * @see [类、类#方法、类#成员]
	 */
	public static String getFileName(String fileName)
	{
		String fileExtension = getFileExtension(fileName);
		return fileName.substring(0, fileName.lastIndexOf(fileExtension) - 1);
	}

	/**
	 * 用来去掉List中空值和相同项的。
	 * 
	 * @param list
	 * @return
	 */
	public static List<String> removeSameItem(List<String> list)
	{
		List<String> difList = new ArrayList<String>();
		for (String t : list)
		{
			if (t != null && !difList.contains(t))
			{
				difList.add(t);
			}
		}
		return difList;
	}

	/**
	 * 返回用户的IP地址
	 * 
	 * @param request
	 * @return
	 */
	public static String toIpAddr(HttpServletRequest request)
	{
		String ip = request.getHeader("X-Forwarded-For");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip))
		{
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip))
		{
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip))
		{
			ip = request.getHeader("HTTP_CLIENT_IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip))
		{
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip))
		{
			ip = request.getRemoteAddr();
		}
		return ip;
	}

	/**
	 * 去除字符串最后一个逗号,若传入为空则返回空字符串
	 * 
	 * @descript
	 * @param para
	 * @return
	 * @author zoomy
	 * @date 2015年3月29日
	 * @version 1.0
	 */
	public static String trimComma(String para)
	{
		if (StringUtils.isNotBlank(para))
		{
			if (para.endsWith(","))
			{
				return para.substring(0, para.length() - 1);
			} else
			{
				return para;
			}
		} else
		{
			return "";
		}
	}

	public static Integer valueOf(String value, int def)
	{
		try
		{
			if (StringUtil.isNotEmpty(value))
			{
				return Integer.parseInt(value);
			}
		} catch (Exception e)
		{
			return def;
		}
		return def;
	}

	public static Integer valueOf(String value)
	{
		return valueOf(value, 0);
	}

	/**
	 * html转议
	 * 
	 * @descript
	 * @param content
	 * @return
	 * @author LJN
	 * @date 2015年4月27日
	 * @version 1.0
	 */
	public static String htmltoString(String content)
	{
		if (content == null)
			return "";
		String html = content;
		html = html.replace("'", "&apos;");
		html = html.replaceAll("&", "&amp;");
		html = html.replace("\"", "&quot;"); // "
		html = html.replace("\t", "&nbsp;&nbsp;");// 替换跳格
		html = html.replace(" ", "&nbsp;");// 替换空格
		html = html.replace("<", "&lt;");
		html = html.replaceAll(">", "&gt;");

		return html;
	}

	/**
	 * html转议
	 * 
	 * @descript
	 * @param content
	 * @return
	 * @author LJN
	 * @date 2015年4月27日
	 * @version 1.0
	 */
	public static String stringtohtml(String content)
	{
		if (content == null)
			return "";
		String html = content;
		html = html.replace("&apos;", "'");
		html = html.replaceAll("&amp;", "&");
		html = html.replace("&quot;", "\""); // "
		html = html.replace("&nbsp;&nbsp;", "\t");// 替换跳格
		html = html.replace("&nbsp;", " ");// 替换空格
		html = html.replace("&lt;", "<");
		html = html.replaceAll("&gt;", ">");
		return html;
	}

	public static Long[] stringArrayToLongArray(String str[])
	{
		Long[] num = null;
		if (str != null && str.length > 0)
		{
			int len = str.length;
			num = new Long[len];
			for (int i = 0; i < len; i++)
			{
				num[i] = Long.valueOf(str[i]);
			}
		}
		return num;
	}

	public static String fromDateH()
	{
		DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		return format1.format(new Date());
	}

	/**
	 * 返回当前时间 格式：yyyy-MM-dd
	 * 
	 * @return String
	 */
	public static String fromDateY()
	{
		DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		return format1.format(new Date());
	}
}
