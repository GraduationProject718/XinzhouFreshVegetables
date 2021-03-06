﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>

	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>商品详情信息</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css" />
		<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
		<!-- 引入自定义css文件 style.css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css"/>

		<style>
			body {
				margin-top: 20px;
				margin: 0 auto;
			}
			
			.carousel-inner .item img {
				width: 100%;
				height: 300px;
			}
		</style>
		<script type="text/javascript">
			function check(){
				var uid = $("#uid").val();
				if(uid == null || uid==""){
					alert("请登录后在评价！");
					return false;
				}
				return true;
			}
		</script>
	</head>

	<body>
	<%@ include file="/jsp/header.jsp" %>
		<div class="container">
			<div class="row">

				<div style="margin:0 auto;width:950px;">
				
				  <form id="myForm" method="post" action="${pageContext.request.contextPath}/CartServlet?method=addCartItemToCart">
					<div class="col-md-6">
						<img style="opacity: 1;width:400px;height:350px;" title="" class="medium" src="${pageContext.request.contextPath}/${product.pimage}">
					</div>

					<div class="col-md-6">
					    <!-- 
					    	${product}  :底层依次调用4个域对象上的*.getAttribute("keyName");
					    	寻找到request可以获取到一个对象 product
					    	${product.pname} :通过获取到的product对象调用对象上的getPname()方法.
					     -->
						<div style="font-size:25px;"><strong>${product.pname}</strong></div>
						<div style="border-bottom: 1px dotted #dddddd;width:350px;margin:10px 0 10px 0;">
							<div></div>
						</div>

						<div style="margin:10px 0 10px 0;font-size:20px;">商城价: <strong style="color:#ef0101;">￥：${product.shop_price}元/份</strong> 市场价： <del>￥${product.market_price}元/份</del>
						</div>

						<div style="padding:10px;border:1px solid #e7dbb1;width:330px;margin:15px 0 10px 0;;background-color: #fffee6;">
							<div style="margin:5px 0 10px 0;"></div>

							<div style="border-bottom: 1px solid #faeac7;margin-top:20px;padding-left: 10px;">购买数量:
								
								<!-- 向服务端发送 购买数量-->
								<input id="quantity" name="quantity" value="1" maxlength="4" size="10" type="text"> </div>
								<!-- 向服务端发送 商品pid-->
								<input type="hidden" name="pid" value="${product.pid}"/>
								

							<div style="margin:20px 0 10px 0;;text-align: center;">
								<%--加入到购物车 --%>
								<!-- 取消链接的默认行为 -->
								<a href="javascript:void(0)">
									<input id="btnId" style="background: url('${pageContext.request.contextPath}/img/product.gif') no-repeat scroll 0 -600px rgba(0, 0, 0, 0);height:36px;width:127px;" value="加入购物车" type="button">
								</a></div>
						</div>
					</div>
				   </form>
				</div>
				<div class="clear"></div>
				<div style="width:950px;margin:0 auto;">
					<div style="background-color:#d3d3d3;width:930px;padding:10px 10px;margin:10px 0 10px 0;">
						<strong>商品介绍</strong>
						<h3>${product.pdesc}</h3>
					</div>
				</div>
			</div>
		
		<!--
       		在线评价
        -->
		<div style="width:1210px;margin:0 auto; padding: 0 9px;height: 246px;">
			<div style="display:none;width:75%;margin:0 auto;" id="div1">
				<hr />
				<form action="ReplyServlet?method=addReplyByUid" method="post" >
					<input type="hidden" name="eid" id="eid" />
					<input type="hidden" name="uid" id="uid" value="${loginUser.uid }">
					<input type="hidden" name="pid" value="${product.pid}"/>
					<h3>请输入回复内容：</h3>
					<textarea rows="10" cols="100" name="content" ></textarea><br>
					<button type="submit" style="width:80px;height:30px;" onclick="return check()" >确定</button>
				</form>
			</div>
			<c:if test="${not empty page.list}">
				<c:forEach items="${page.list}" var="e">
					<div style="width: 75%;margin:0 auto; min-height: 60px;border: 2px solid black;margin-top:20px;" >
						<span>${e.content }</span><span style="float:right;">${e.date }</span><br />
						<button style="float:right;"  id="button1" onclick="show1('${e.id }')" >回复</button>
						<br /><br />
						<c:forEach items="${reply}" var="r">
							<c:if test="${r.eid == e.id }">
								<span>${r.content}</span><span style="float:right;">${r.date}</span><br />
							</c:if>
						</c:forEach>
					</div>
				</c:forEach>
			<jsp:include page="/jsp/pageFile.jsp"></jsp:include>
			</c:if>
		</div>
		<br /><br />
		
		</div>
		
	<%@include file="/jsp/footer.jsp" %>
	</body>
<script>
$(function(){
	$("#btnId").click(function(){
		var formObj=document.getElementById("myForm");
		formObj.submit();
	});
});
function show1(eid){
	$("#eid").attr("value",eid);
	document.getElementById("div1").style.display="block";
};
</script>
</html>