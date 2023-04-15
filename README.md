## 系统名称 
汽车租赁系统 carRental
### 系统概要
汽车租赁系统总共分为两个大的模块，分别是系统模块和业务模块。其中系统模块和业务模块底下又有其子模块。
### 功能模块
#### 一、业务模块
##### 1、客户管理
###### 客户列表
###### 客户分页和模糊查询
###### 客户添加、修改、删除
###### 导出客户数据
##### 2、车辆管理
###### 车辆列表
###### 车辆车辆分页和模糊查询
###### 车辆添加、修改、删除
##### 3、业务管理
###### 汽车出租
1、根据客户身份证查询所有未出租的车辆信息  
2、进行出租
###### 出租单管理
1、多条件的模糊查询和分页  
2、出租单的修改、删除、导出
###### 汽车入库
###### 检查单管理
1、多条件模糊查询和分页  
2、检查单修改  
3、导出检查单
##### 4、统计分析
###### 客户男女比例图
###### 月出租量统计
###### 销售员业绩统计
###### 出租车辆类型统计
#### 二、系统模块
##### 1、用户登陆
###### 校验用户名和密码
###### 登陆成功将登陆信息写入登陆日志
###### 未登录进行拦截
##### 2、菜单管理
###### 全查询菜单和根据左边的树查询不同菜单
###### 菜单的添加、修改、删除
##### 3、角色管理
###### 全查询角色和模糊查询
###### 角色的添加、修改、删除
##### 4、用户管理
###### 全查询用户和模糊查询
###### 用户的添加、修改、删除以及重置密码
##### 5、数据源的监控(druid monitor)

### 技术选型
#### 后台技术选型
* Spring
* SpringMVC
* Mybatis
#### 前端技术选型
* LayUI、dtree、echarts

### 开发环境
* 操作系统：Windows 10
* 编程语言：Java
* 开发工具：IDEA、Navicat、Git
* 项目构建：Maven 3.5.2
* 服务器：Tomcat 8.5
* 数据库：MySQL 
* 代码托管平台：GitHub

### 预览效果
登陆页面
![image](https://github.com/yeqifu/carRental/blob/master/src/main/webapp/static/images/carRental/login.PNG)
主页
![image](https://github.com/yeqifu/carRental/blob/master/src/main/webapp/static/images/carRental/index.PNG)
菜单管理
![image](https://github.com/yeqifu/carRental/blob/master/src/main/webapp/static/images/carRental/menu.PNG)
角色管理
![image](https://github.com/yeqifu/carRental/blob/master/src/main/webapp/static/images/carRental/角色管理.PNG)
用户管理
![image](https://github.com/yeqifu/carRental/blob/master/src/main/webapp/static/images/carRental/用户管理.PNG)
日志管理
![image](https://github.com/yeqifu/carRental/blob/master/src/main/webapp/static/images/carRental/日志管理.PNG)
系统公告
![image](https://github.com/yeqifu/carRental/blob/master/src/main/webapp/static/images/carRental/系统公告.PNG)
数据源监控
![image](https://github.com/yeqifu/carRental/blob/master/src/main/webapp/static/images/carRental/数据源监控.PNG)
客户管理
![image](https://github.com/yeqifu/carRental/blob/master/src/main/webapp/static/images/carRental/客户管理.PNG)
车辆管理
![image](https://github.com/yeqifu/carRental/blob/master/src/main/webapp/static/images/carRental/车辆管理.PNG)
汽车出租
![image](https://github.com/yeqifu/carRental/blob/master/src/main/webapp/static/images/carRental/汽车出租.PNG)
出租单管理
![image](https://github.com/yeqifu/carRental/blob/master/src/main/webapp/static/images/carRental/出租单管理.PNG)
汽车入库
![image](https://github.com/yeqifu/carRental/blob/master/src/main/webapp/static/images/carRental/汽车入库.PNG)
检查单管理
![image](https://github.com/yeqifu/carRental/blob/master/src/main/webapp/static/images/carRental/检查单管理.PNG)
客户地区统计
![image](https://github.com/yeqifu/carRental/blob/master/src/main/webapp/static/images/carRental/客户地区统计.PNG)
客户地区性别统计
![image](https://github.com/yeqifu/carRental/blob/master/src/main/webapp/static/images/carRental/客户地区性别统计.PNG)
业务员年度销售额统计
![image](https://github.com/yeqifu/carRental/blob/master/src/main/webapp/static/images/carRental/业务员年度销售额统计.PNG)
公司年度月份销售额统计
![image](https://github.com/yeqifu/carRental/blob/master/src/main/webapp/static/images/carRental/公司年度月份销售额统计.PNG)

### 讨论
有问题请在([issue])讨论 或联系我QQ：1784525940，你请注明来意。该项目是开源的，如果clone到本地运行不起来，或者需要我讲解之类的，我可以有偿讲解，伸手党勿加~

#### 作者
yeqifu
