<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "s" uri = "/struts-tags" %>
<!DOCTYPE html>

    <link rel="stylesheet" type="text/css" href="http://i.jobkorea.kr/content/css/ver_2/common.css?201812101600" />
    <link rel="stylesheet" type="text/css" href="http://i.jobkorea.kr/content/css/ver_2/top100/top_style.css?201812101600" />
<s:if test="#session.session_id==null">
<script>
alert("로그인이 필요한 서비스입니다.");
location.replace("admin_main.action");
</script>
</s:if>
<style>
.subject input[type="text"] {
	height : 40px;
	border: 3px solid #999;
}
.content textarea{
	font-size : 10pt;
	border : 3px solid;
}
.submit button{
	position : absolute;
	top : 280px;
	left : 300px;
	background-color: #008CBA; 
    border: none;
    color: white;
    padding: 15px 28px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
}
</style>