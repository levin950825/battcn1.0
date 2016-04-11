package com.battcn.controller.system;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.battcn.annotation.SystemLog;
import com.battcn.controller.BaseController;
import com.battcn.entity.UserEntity;
import com.battcn.service.system.UserService;
import com.battcn.util.UserEntityUtil;
import com.battcn.util.http.ResponseUtils;
import com.battcn.util.upload.FileRepository;
import com.battcn.util.upload.UploadUtils;
import com.github.pagehelper.PageInfo;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/user/")
public class UserController extends BaseController
{

	@Autowired
	public UserService userService;
	@Autowired
	private FileRepository fileRepository;

	@RequestMapping("list")
	@SystemLog(module = "用户管理", methods = "查询用户")
	public String main(Model model)
	{
		model.addAttribute("res", findResByUser());
		return "/system/user/list";
	}

	@RequestMapping("editUI")
	public String addUI(Model model, Long id)
	{
		if (id != null)
		{
			model.addAttribute("user", userService.findByPrimaryKey(id));
		}
		return "/system/user/edit";
	}

	@RequestMapping("queryUserForList")
	@ResponseBody
	public PageInfo<UserEntity> queryUserForList(String accountName)
	{
		UserEntity entity = null;
		if(StringUtils.isNoneEmpty(accountName))
		{
			entity = new UserEntity();
			entity.setAccountName(accountName);
		}
		return this.userService.queryUserForList(entity);
	}

	@RequestMapping("saveForm")
	@ResponseBody
	@SystemLog(module = "用户管理", methods = "添加用户")
	public String saveUser(UserEntity form, Long txtGroupsSelect[])
	{
		return this.userService.saveOrUpdate(form, txtGroupsSelect);
	}

	@RequestMapping("batchDelete")
	@ResponseBody
	@SystemLog(module = "用户管理", methods = "批量删除用户")
	public String batchDelete(Long ids[])
	{
		return this.userService.batchDelete(ids);
	}

	@RequestMapping("/profile")
	public String profile(HttpServletRequest request, HttpServletResponse response, ModelMap model)
	{
		return "profile";
	}

	@RequestMapping(value = "/upload")
	public void upload(MultipartHttpServletRequest request,
			@RequestParam(value = "__source", required = false) MultipartFile file3, HttpServletResponse response,
			ModelMap model) throws IOException
	{
		Result result = new Result();
		MultipartFile file = null;
		Map<String, MultipartFile> file2 = request.getFileMap();
		String path = "";
		for (Map.Entry<String, MultipartFile> entry : file2.entrySet())
		{
			file = entry.getValue();
		}
		if (file == null || file.isEmpty())
		{
			result.msg = "文件太小！";
		} else
		{
			result.avatarUrls = new ArrayList<String>();
			result.success = false;
			result.msg = "Failure!";
			boolean isSourcePic = file.getName().equals("__source");
			String fieldName = file.getName();//file对象有问题

			if (file3 != null)
			{
				isSourcePic = true;
				fieldName = file3.getOriginalFilename();
				file = file3;
			}
			if (fieldName.equals("__initParams"))
			{

			}
			// 如果是原始图片 file
			// 域的名称或者以默认的头像域名称的部分“__avatar”打头(默认的头像域名称：__avatar1,2,3...，可在插件配置参数中自定义，参数名：avatar_field_names)
			else if (isSourcePic || fieldName.startsWith("__avatar"))
			{

				// String virtualPath = "/upload/jsp_avatar" + avatarNumber +
				// "_" + fileName + ".jpg";
				// 原始图片（默认的 file 域的名称是__source，可在插件配置参数中自定义。参数名：src_field_name）。
				if (isSourcePic)
				{
					// 文件名，如果是本地或网络图片为原始文件名、如果是摄像头拍照则为 *FromWebcam.jpg
					String sourceFileName = fieldName;
					// 原始文件的扩展名(不包含“.”)
					String sourceExtendName = sourceFileName.substring(sourceFileName.lastIndexOf('.') + 1);
					String filename = UploadUtils.generateFilename(sourceExtendName);
					path = "upload/files" + filename;
					result.sourceUrl = path;
				}
				// 头像图片（默认的 file
				// 域的名称：__avatar1,2,3...，可在插件配置参数中自定义，参数名：avatar_field_names）。
				else
				{
					String filename = UploadUtils.generateFilename("jpg");
					path = "upload/files" + filename;
					result.avatarUrls.add(request.getContextPath() + path);
					//result.sourceUrl = path;
				}
				fileRepository.storeByFilename(path, file);
			}
		}
		if (result.sourceUrl != null)
		{

		}
		result.sourceUrl = request.getContextPath() + result.sourceUrl;
		result.success = true;
		result.msg = "Success!";

		UserEntity userEntity = UserEntityUtil.getUserFromSession();
		userEntity.setPhoto(path);
		this.userService.update(userEntity);
		ResponseUtils.renderText(response, JSONObject.fromObject(result).toString());
	}

	/**
	 * 表示上传的结果。
	 */
	private class Result
	{
		/**
		 * 表示图片是否已上传成功。
		 */
		public Boolean success;
		public String userid;
		public String username;

		/**
		 * 自定义的附加消息。
		 */
		public String msg;
		/**
		 * 表示原始图片的保存地址。
		 */
		public String sourceUrl;
		/**
		 * 表示所有头像图片的保存地址，该变量为一个数组。
		 */
		public ArrayList<String> avatarUrls;
	}

}
