battcn系统 
前端： 采用了BootStrap3.3.5 + BootStrap Table + jQuery2.1
后端：Spring4.2+SpringMVC4.2+Mybatis3.2.8 增加PageHelper与通用Mapper方便开发
通用Mapper：Mybatis单表操作基于注解调用API,方便我们开发,提高开发效率
权限：采用Spring Shiro做的登陆认证与URL拦截
本系统秉承开源精神,欢迎大家使用与开发,遇到任何问题可以 申请QQ群：391619659 找到 解答

项目部署：因为里面写了一个小的存储过程,所以 需要手动在 数据库执行  install.sql 里面已经注释掉了 ,因为有一个
"初始化系统"的功能

群官网：http://www.battcn.com
演示地址：http://www.battcn.com/battcn/

开发流程：
1.具体不清楚可以申请加群：391619659
2.本系统为开源系统可以随意修改
3.欢迎大家使用,本系统不会记录任何使用者的信息,可以放心使用,有Bug可以提交作者(QQ:1837307557)
4.如果喜欢可以赞助作者,您的支持就是作者最大的动力



定义实体类Entity(如：UserEntity)
	|
	|
	|
	|
	----->创建Mppaer<Entity>(如：UserMapper<UserEntity>)	如果有自定义SQL操作则需要定义mapper.xml
		|
		|	
		|
		|
		--------->定义Service接口(如：UserService)（根据Java规范所以接口化编程：可省）
				|
				|
				|
				|
				--------->实现Service(如：UserServiceImpl)
						|
						|
						|
						|
						|
						-------->创建Controller控制器(如：UserController)
				
				