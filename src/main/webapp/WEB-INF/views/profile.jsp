<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<div class="wrapper wrapper-content">
	<div class="row">
		<div class="col-sm-12">
			<div class="ibox float-e-margins">
				<div class="ibox-content">
					<ul class="nav nav-tabs" id="avatar-tab">
						<li class="active" id="upload"><a href="javascript:void(0);">本地上传</a></li>
						<li id="webcam"><a href="javascript:void(0);">视频拍照</a></li>
					</ul>
					<div class="m-t m-b">
						<div id="flash1">
							<p id="swf1">
								本组件需要安装Flash Player后才可使用，请从<a
									href="http://www.adobe.com/go/getflashplayer">这里</a>下载安装。
							</p>
						</div>
						<div id="editorPanelButtons" style="display: none">
							<p class="m-t">
								<label class="checkbox-inline"> <input type="checkbox" style="margin-top: 1px;"
									id="src_upload">是否上传原图片？
								</label>
							</p>
							<p>
								<a href="javascript:;"
									class="btn btn-w-m btn-primary button_upload"><i
									class="fa fa-upload"></i> 上传</a> <a href="javascript:;"
									class="btn btn-w-m btn-white button_cancel">取消</a>
							</p>
						</div>
						<p id="webcamPanelButton" style="display: none">
							<a href="javascript:;"
								class="btn btn-w-m btn-info button_shutter"><i
								class="fa fa-camera"></i> 拍照</a>
						</p>
						<div id="userAlbums" style="display: none"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/common/plugins/fullavatareditor/scripts/swfobject.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/common/plugins/fullavatareditor/scripts/fullAvatarEditor.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/common/plugins/fullavatareditor/scripts/jQuery.Cookie.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/common/plugins/fullavatareditor/scripts/test.js"></script>

