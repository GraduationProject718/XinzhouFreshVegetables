<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
<HTML>
	<HEAD>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="${pageContext.request.contextPath}/css/Style1.css" rel="stylesheet" type="text/css" />
		<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/public.js"></script>
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
		
			<table cellSpacing="1" cellPadding="0" width="100%" align="center" bgColor="#f5fafe" border="0">
				<TBODY>
					<tr>
						<td class="ta_01" align="right">
							
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
										评价内容
									</td>
									<td align="center" width="17%">
										评价时间
									</td>
									<td align="center" width="17%">
										操作
									</td>
								</tr>
								<c:forEach items="${page.list}" var="e" varStatus="status">
										<tr onmouseover="this.style.backgroundColor = 'white'"
											onmouseout="this.style.backgroundColor = '#F5FAFE';">
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="18%">
												${ status.count }
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="17%">
												${ e.content}
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="17%">
												${ e.date }
											</td>
											<td align="center" style="HEIGHT: 22px">
												<button id="button1" onclick="show1('${e.id }')">回复</button>
												<a href="${pageContext.request.contextPath}/AdminEstimateServlet?method=delAdminEstimate&id=${e.id}">
													<img src="${pageContext.request.contextPath}/img/admin/i_del.gif" width="16" height="16" border="0" style="CURSOR: hand">
												</a>
											</td>
										</tr>
									</c:forEach>
							</table>
						</td>
					</tr>
				</TBODY>
			</table>
			<%@include file="/jsp/pageFile.jsp" %>
			
			<div style="display:none;width:75%;margin:0 auto;" id="div1">
				<hr />
				<form action="ReplyServlet?method=addReplyByAdmin" method="post" >
					<input type="hidden" name="eid" id="eid" />
					<h3>请输入回复内容：</h3>
					<textarea rows="10" cols="100" name="content" ></textarea><br>
					<button type="submit" style="width:80px;height:30px;" >确定</button>
				</form>
			</div>
			
		<script>
		function show1(eid){
			$("#eid").attr("value",eid);
			document.getElementById("div1").style.display="block";
		};
		</script>
	</body>
</HTML>

