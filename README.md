battcn系统 
前端： 采用了BootStrap3.3.5 + BootStrap Table + jQuery2.1
后端：Spring4.2+SpringMVC4.2+Mybatis3.2.8 增加PageHelper与通用Mapper方便开发
通用Mapper：Mybatis单表操作基于注解调用API,方便我们开发,提高开发效率
权限：采用Spring Shiro做的登陆认证与URL拦截
本系统秉承开源精神,欢迎大家使用与开发,遇到任何问题可以 申请QQ群：391619659 找到 解答

项目部署：因为里面写了一个小的存储过程,所以 需要手动在 数据库执行  install.sql 里面已经注释掉了 ,因为有一个
"初始化系统"的功能

-- 存储过程SQL

DROP PROCEDURE IF EXISTS `treeNodes`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `treeNodes`()
BEGIN
 DECLARE LEVEL INT ;
 Set LEVEL=0 ;
 update t_mp_resources a inner join (SELECT id,LEVEL,concat(',',ID,',') scort FROM t_mp_resources WHERE parentId = 0) b on a.id=b.id
 set a.nlevel=b.LEVEL,a.scort=b.scort;
 WHILE FOUND_ROWS()>0 DO
  SET LEVEL=LEVEL+1;
update t_mp_resources a inner join (
   SELECT ID,LEVEL,scort FROM t_mp_resources 
    WHERE nLevel=LEVEL-1) b on a.parentId=b.id
set a.nlevel=b.LEVEL,a.scort=concat(b.scort,a.ID,',');
 END WHILE;
END
;;
DELIMITER ;


