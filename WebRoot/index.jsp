<%@ page language="java" import="java.util.*, java.sql.*,java.text.SimpleDateFormat" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%request.setCharacterEncoding("UTF-8");%>  
<%response.setCharacterEncoding("UTF-8");%>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">       
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script language="javascript" type="text/javascript" src="http://imgs.job001.cn/resource/js/My97DatePicker/WdatePicker.js"></script>
	<title>数据展示</title> 
	<style type="text/css">
	table
	  {
	  border-collapse:collapse;
	  }
	
	table, td, th
	  {
	  border:1px solid black;
	  text-align:center;
	  }
    tr{ background: ;} 
    tr:nth-child(2n){ background: #c7e5ff;} 
    tr{ background-color: expression((this.sectionRowIndex % 2 == 0) ?   "" : "#c7e5ff" );} 
 
	</style>
  </head>
  
<body>
  </br>
<!-- 根据日期查询 -->
<form action="/showStatstics" method="get">
  日期：<input id="minTime" name="minTime" value="" onclick="WdatePicker({maxnDate:'#F{$dp.$D(\'maxTime\')}',dateFmt:'yyyy-MM-dd'})">-
  <input id="maxTime" name="maxTime" value="" onclick="WdatePicker({minDate:'#F{$dp.$D(\'minTime\')}',dateFmt:'yyyy-MM-dd'})"/>
 <input type="submit" id="selectByDate"  value="查询"/>
 </form>
</br>
 <% 
 //连接MySQL数据库  
    Class.forName("com.mysql.jdbc.Driver").newInstance(); 
    String url="jdbc:mysql://rcw_rdsmn2989i6spi4bp12npublic.mysql.rds.aliyuncs.com:3306/rcw_test?useUnicode=true&amp;characterEncoding=utf-8&amp;allowMultiQueries=true"; 
    String user="rcw_crmdb2"; 
    String password="rcw_job001_crm_db2_2015"; 
    Connection conn = DriverManager.getConnection(url, user, password); 
    Statement st = conn.createStatement(); 
     
 %> 
<table> 
  <tr> 
    <td>日期</td> 
    <td>新增简历</td> 
    <td>个人注册量</td> 
    <td>登录量</td> 
    <td>简历登录</td> 
    <td>投递量</td> 
    <td>有投递的个人用户数</td> 
    <td>收到面试邀请的个人</td> 
    <td>企业注册量</td> 
    <td>企业登录量</td> 
    <td>付费企业登录量</td> 
    <td>总的面试邀请</td> 
    <td>主动应聘被查看</td>
    <td>简历被查看用户数</td> 
    <td>微招被浏览企业数</td> 
    <td>微招被点赞企业数</td> 
    <td>微招浏览量</td> 
    <td>微招分享量</td> 
    <td>微招点赞量</td>
    <td>有效职位数</td> 
    <td>免费职位数</td> 
    <td>付费职位数</td> 
    <td>官微绑定数</td> 
    <td>绑定企业数</td> 
    <td>绑定个人数</td>
    <td>主动投递量</td> 
    <td>H5投递量</td> 
    <td>微招投递量</td> 
    <td>CRM模拟应聘投递量</td> 
    <td>CRM推荐投递量</td> 
    <td>系统投递量</td>
  </tr> 
     
<% 
    String minTime=request.getParameter("minTime"); 
    String maxTime=request.getParameter("maxTime");
    String sql="SELECT * FROM statistics";
    if(minTime!=null&&maxTime!=null){
      if(minTime.compareTo(maxTime)<0){
         sql+=" where 日期    > '"+minTime+"' and 日期   < '"+maxTime+"'";
      }
    }else if(minTime!=null){
    	 sql+=" where 日期   > '"+minTime+"'";
    }else if(maxTime!=null){
    	 sql+=" where 日期   < '"+maxTime+"'";
    }
    sql+=" order by 日期   desc";
    ResultSet rs = st.executeQuery(sql); 
    while(rs.next()){%> 
     
  <tr> 
    <td><%=rs.getString("日期") %></td> 
    <td><%=rs.getString("新增简历") %></td> 
    <td><%=rs.getString("个人注册量") %></td> 
    <td><%=rs.getString("登录量") %></td> 
    <td><%=rs.getString("简历登录") %></td> 
    <td><%=rs.getString("投递量") %></td> 
    <td><%=rs.getString("有投递的个人用户数") %></td> 
    <td><%=rs.getString("收到面试邀请的个人") %></td> 
    <td><%=rs.getString("企业注册量") %></td> 
    <td><%=rs.getString("企业登录量") %></td> 
    <td><%=rs.getString("付费企业登录量") %></td> 
    <td><%=rs.getString("总的面试邀请") %></td> 
    <td><%=rs.getString("主动应聘被查看") %></td> 
    <td><%=rs.getString("简历被查看用户数") %></td> 
    <td><%=rs.getString("微招被浏览企业数") %></td> 
    <td><%=rs.getString("微招被点赞企业数") %></td> 
    <td><%=rs.getString("微招浏览量") %></td> 
    <td><%=rs.getString("微招分享量") %></td> 
    <td><%=rs.getString("微招点赞量") %></td> 
    <td><%=rs.getString("有效职位数") %></td> 
    <td><%=rs.getString("免费职位数") %></td> 
    <td><%=rs.getString("付费职位数") %></td> 
    <td><%=rs.getString("官微绑定数") %></td> 
    <td><%=rs.getString("绑定企业数") %></td> 
    <td><%=rs.getString("绑定个人数") %></td> 
    <td><%=rs.getString("主动投递量") %></td> 
    <td><%=rs.getString("H5投递量") %></td> 
    <td><%=rs.getString("微招投递量") %></td> 
    <td><%=rs.getString("CRM模拟应聘投递量") %></td> 
    <td><%=rs.getString("CRM推荐投递量") %></td> 
    <td><%=rs.getString("系统投递量") %></td> 
  </tr> 
 
<%} 
//注意"}"的位置 %> 
</table> 
 
<% 
    rs.close(); 
    conn.close(); 
 %>  
  </body>
</html>
