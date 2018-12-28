<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "s" uri = "/struts-tags" %>

<s:if test="#session.session_id==null">
<script>
alert("로그인이 필요한 서비스입니다.");
location.replace("main.action");
</script>
</s:if>
<!doctype html>
<!-- 일단 분리 -->
<link rel="stylesheet" type="text/css"
	href="http://i.jobkorea.kr/content/css/ver_2/jobs/part.css?ver=201811261500" />
<link rel="stylesheet" type="text/css"
	href="http://i.jobkorea.kr/content/css/ver_2/rcr/rcr.css?ver=201811261500" />
<link rel="stylesheet" type="text/css" href="/css/css.css"/>
<script type='text/javascript' src='./script/dslog.js?ver=1.1' id='dslog_tag'></script>