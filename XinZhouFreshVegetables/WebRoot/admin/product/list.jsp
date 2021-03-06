<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
<HTML>
	<HEAD>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="${pageContext.request.contextPath}/css/Style1.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/public.js"></script>
		<script type="text/javascript">
			function addProduct(){
				window.location.href = "${pageContext.request.contextPath}/AdminProductServlet?method=addProductUI";
			}
		</script>
		
		<style type="text/css">
			td{
				font-size:20px;
			}
			table{
				width:1400px;
			}
		</style>
	</HEAD>
	<body>
		<br>
			<table cellSpacing="1"  cellPadding="0" align="center" bgColor="#f5fafe" border="0">
				<TBODY>
					
					<tr>
						<td class="ta_01" >
							<button style="font-size:20px;" type="button" id="add" name="add" value="添加" class="button_add" onclick="addProduct()">&#28155;&#21152;</button>
						</td>
					</tr>
					<tr>
						<td class="ta_01" align="center" bgColor="#f5fafe">
							<table cellspacing="0" cellpadding="1" rules="all"
								bordercolor="gray" border="1" id="DataGrid1"
								style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
								<tr
									style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">

									<td align="center" width="18%">
										序号
									</td>
									<td align="center" width="17%">
										商品图片
									</td>
									<td align="center" width="17%">
										商品名称
									</td>
									<td align="center" width="17%">
										商品价格
									</td>
									<td align="center" width="17%">
										是否热门
									</td>
									<td width="7%" align="center">
										编辑
									</td>
									<td width="7%" align="center">
										下架
									</td>
								</tr>
								<c:forEach items="${page.list}" var="p" varStatus="status">
									<c:if test="${ p.pflag == 0 }">
										<tr onmouseover="this.style.backgroundColor = 'white'"
											onmouseout="this.style.backgroundColor = '#F5FAFE';">
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="18%">
												${ status.count }
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="17%">
												<img width="40" height="45" src="${ pageContext.request.contextPath }/${p.pimage}">
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="17%">
												${ p.pname }
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="17%">
												${ p.shop_price }
											</td>
											<c:if test="${  p.is_hot ==1 }">
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="17%">
													是
											</td>
											</c:if>
											<c:if test="${  p.is_hot == 0 }">
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="17%">
													否
											</td>
											</c:if>
											<td align="center" style="HEIGHT: 22px">
												<a href="${pageContext.request.contextPath}/AdminProductServlet?method=editUI&pid=${p.pid}">
													<img src="${pageContext.request.contextPath}/img/admin/i_edit.gif" border="0" style="CURSOR: hand">
												</a>
											</td>
									
											<td align="center" style="HEIGHT: 22px">
												<%--下架 pushdown --%>
												<a href="${pageContext.request.contextPath}/AdminProductServlet?method=pushDown&pid=${p.pid}">
													<img src="${pageContext.request.contextPath}/img/admin/i_del.gif" width="16" height="16" border="0" style="CURSOR: hand">
												</a>
											</td>
										</tr>
										</c:if>
									</c:forEach>
							</table>
						</td>
					</tr>
				</TBODY>
			</table>
			<%@include file="/jsp/pageFile.jsp" %>
	</body>
</HTML>

