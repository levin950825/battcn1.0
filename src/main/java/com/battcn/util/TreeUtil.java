package com.battcn.util;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.battcn.entity.ResourcesEntity;

/**
 * 把一个list集合,里面的bean含有 parentId 转为树形式
 *
 */
public class TreeUtil
{

	/**
	 * 根据父节点的ID获取所有子节点
	 * 
	 * @param list
	 *            分类表
	 * @param typeId
	 *            传入的父节点ID
	 * @return String
	 */
	public static List<ResourcesEntity> getChildResourceForms(List<ResourcesEntity> list, int praentId)
	{
		List<ResourcesEntity> returnList = new ArrayList<ResourcesEntity>();

		for (Iterator<ResourcesEntity> iterator = list.iterator(); iterator.hasNext();)
		{
			ResourcesEntity t = (ResourcesEntity) iterator.next();
			// 一、根据传入的某个父节点ID,遍历该父节点的所有子节点
			if (t.getParentId() == praentId)
			{
				recursionFn(list, t);
				returnList.add(t);
			}
		}
		return returnList;
	}

	/**
	 * 递归列表
	 * 
	 * @author zoomy Email: yafeng.tang@zoomy-media.com
	 * @date 2013-12-4 下午7:27:30
	 * @param list
	 * @param ResourcesEntity
	 */
	private static void recursionFn(List<ResourcesEntity> list, ResourcesEntity t)
	{
		List<ResourcesEntity> childList = getChildList(list, t);// 得到子节点列表
		t.setChildren(childList);
		for (ResourcesEntity tChild : childList)
		{
			if (hasChild(list, tChild))
			{// 判断是否有子节点
				// returnList.add(ResourceForm);
				Iterator<ResourcesEntity> it = childList.iterator();
				while (it.hasNext())
				{
					ResourcesEntity n = (ResourcesEntity) it.next();
					recursionFn(list, n);
				}
			}
		}
	}

	// 得到子节点列表
	private static List<ResourcesEntity> getChildList(List<ResourcesEntity> list, ResourcesEntity t)
	{

		List<ResourcesEntity> tlist = new ArrayList<ResourcesEntity>();
		Iterator<ResourcesEntity> it = list.iterator();
		while (it.hasNext())
		{
			ResourcesEntity n = (ResourcesEntity) it.next();
			if (n.getParentId() == t.getId())
			{
				tlist.add(n);
			}
		}
		return tlist;
	}

	List<ResourcesEntity> returnList = new ArrayList<ResourcesEntity>();

	/**
	 * 根据父节点的ID获取所有子节点
	 * 
	 * @param list
	 *            分类表
	 * @param typeId
	 *            传入的父节点ID
	 * @param prefix
	 *            子节点前缀
	 */
	public List<ResourcesEntity> getChildResourceForms(List<ResourcesEntity> list, int typeId, String prefix)
	{
		if (list == null)
			return null;
		for (Iterator<ResourcesEntity> iterator = list.iterator(); iterator.hasNext();)
		{
			ResourcesEntity node = (ResourcesEntity) iterator.next();
			// 一、根据传入的某个父节点ID,遍历该父节点的所有子节点
			if (node.getParentId() == typeId)
			{
				recursionFn(list, node, prefix);
			}
			// 二、遍历所有的父节点下的所有子节点
			/*
			 * if (node.getParentId()==0) { recursionFn(list, node); }
			 */
		}
		return returnList;
	}

	private void recursionFn(List<ResourcesEntity> list, ResourcesEntity node, String p)
	{
		List<ResourcesEntity> childList = getChildList(list, node);// 得到子节点列表
		if (hasChild(list, node))
		{// 判断是否有子节点
			returnList.add(node);
			Iterator<ResourcesEntity> it = childList.iterator();
			while (it.hasNext())
			{
				ResourcesEntity n = (ResourcesEntity) it.next();
				n.setName(p + n.getName());
				recursionFn(list, n, p + p);
			}
		} else
		{
			returnList.add(node);
		}
	}

	// 判断是否有子节点
	private static boolean hasChild(List<ResourcesEntity> list, ResourcesEntity t)
	{
		return getChildList(list, t).size() > 0 ? true : false;
	}

	// 本地模拟数据测试
	public void main(String[] args)
	{
		/*
		 * long start = System.currentTimeMillis(); List<ResourceForm>
		 * ResourceFormList = new ArrayList<ResourceForm>();
		 * 
		 * ResourceFormUtil mt = new ResourceFormUtil(); List<ResourceForm>
		 * ns=mt.getChildResourceForms(ResourceFormList,0); for (ResourceForm m
		 * : ns) { System.out.println(m.getName());
		 * System.out.println(m.getChildren()); } long end =
		 * System.currentTimeMillis(); System.out.println("用时:" + (end - start)
		 * + "ms");
		 */
	}

}
