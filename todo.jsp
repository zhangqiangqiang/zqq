<%@page import="resources.bean.report.form.ViHomePageTodo"%>
<%@page import="resources.bean.report.form.ViHomePageTodo02"%>
<%@page import="resources.bean.report.form.ViHomePageTodo03"%>
<%@page import="resources.bean.report.form.ViHomePageTodo04"%>
<%@page import="resources.bean.report.form.ViHomePageTodo05"%>
<%@page import="resources.bean.report.form.ViHomePageTodo06"%>
<%@page import="resources.bean.report.form.ViHomePageTodo07"%>
<%@page import="com.huateng.hsbc.creditcard.bean.CreditCardToDoBeanShow"%>
<%@page import="java.lang.*"%>
<%@page import="com.huateng.report.common.service.ReportCommonService"%>
<%@page import="com.huateng.report.hfaml3.utils.HfAml3Utils"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/templets/easyui/themes/blue/easyui.css">
<title>待办业务</title>
<%
	boolean[] bool = HfAml3Utils.getPowerByUserId();
	//操作员待办	
	List list1 = null;
	//部门待办
	List list2 = null;
	//大额交易自查
	List list3 = null;
	//可疑交易自查
	List list4 = null;
	//汇丰中国HSBC客户交易调研
	List list5 = null;
	//汇丰中国HSBC客户交易自查
	List list6 = null;
	//村镇行RRB客户交易调研
	List list7 = null;
	//信用卡
	List list_credit = null;
	if(bool[0]){
		list1 = ReportCommonService.getInstance().getUndoTask1(session);
		list2 = ReportCommonService.getInstance().getUndoTask2(session);
	}
	if(bool[1]){
		list3 = ReportCommonService.getInstance().getUndoTask3(session);
	}
	if(bool[2]){
		list4 = ReportCommonService.getInstance().getUndoTask4(session);
	}
	//汇丰中国HSBC员工交易调研
	if(bool[3]){
		list5 = ReportCommonService.getInstance().getUndoTask5(session);
	}
	//汇丰中国HSBC员工交易自查
	if(bool[4]){
		list6 = ReportCommonService.getInstance().getUndoTask6(session);
	}
	//村镇行RRB客户交易调研
	if(bool[5]){
		list7 = ReportCommonService.getInstance().getUndoTask7(session);
	}
	//信用卡审核员
	if(bool[7]){
		list_credit = ReportCommonService.getInstance().getUndoTask9(session);
	}else if(bool[6]){//信用卡操作员
		list_credit = ReportCommonService.getInstance().getUndoTask8(session);
	}
%>

</head>
<body bgcolor="white" style="margin: 0px;">
	<center>
		<div style="padding: 3px;">
		<% if(bool[0]){ %>
		 <p ><span style="text-align:center;float:left;height:20px;"><font size=3 color=#000000><b>操作员待办</b></font></span></p>
			<table width="100%" class="grouptable" cellpadding="0" cellspacing="0" border="0">
					
					<tr>
						<td class="labeltd" valign=center align="left" nowrap><font size=3 ><b>交易日期</b></font></td>
						<td class="labeltd" valign=center align="left" nowrap><font size=3 ><b>报文类型</b></font></td>
						<td class="labeltd" valign=center align="left" nowrap><font size=3 ><b>待补录</b></font></td>
						<td class="labeltd" valign=center align="left" nowrap><font size=3 ><b>待上报</b></font></td>
					</tr>
				<%
					if (list1 != null && list1.size() > 0) {
						String bgcolor = "#FFFF6F";
						for (int i = 0; i < list1.size(); i++) {
							ViHomePageTodo bean = (ViHomePageTodo) list1.get(i);
							if ("1".equals(bean.getT5Flag())) {
								bgcolor = "#FF0000";
							} else {
								bgcolor = "#FFFF6F";
							}
				%>
				<tr style="line-height: 22px;" bgcolor="<%=bgcolor%>">
					<td class="datatd" valign=center align="left" nowrap><%=bean.getWorkDate()%></td>
					<td class="datatd" valign=center align="left" nowrap><%=bean.getReportType()%></td>
					<td class="datatd" valign=center align="left" nowrap><%=bean.getBlNum()%></td>
					<td class="datatd" valign=center align="left" nowrap><%=bean.getSbNum()%></td>
				</tr>
				<%
					}
					} else {
				%>
				<tr bgcolor="#ffffff" style="line-height: 22px;">
					<td colspan="4" align="center" class="datatd">没有需要处理的交易</td>
				</tr>
				<%
					}
				%>
			</table>
			 <br>  
        	 <br> 
        	 <p ><span style="text-align:center;float:left;height:20px;"><font size=3 color=#000000><b>部门待办</b></font></span></p>
			<table width="100%" class="grouptable" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td class="labeltd" valign=center align="left" nowrap><font size=3 ><b>交易日期</b></font></td>
					<td class="labeltd" valign=center align="left" nowrap><font size=3 ><b>报文类型</b></font></td>
					<td class="labeltd" valign=center align="left" nowrap><font size=3 ><b>待补录</b></font></td>
					<td class="labeltd" valign=center align="left" nowrap><font size=3 ><b>待上报</b></font></td>
					<td class="labeltd" valign=center align="left" nowrap><font size=3 ><b>待打包</b></font></td>
					<td class="labeltd" valign=center align="left" nowrap><font size=3 ><b>已打包</b></font></td>
				</tr>
				<%
					if (list2 != null && list2.size() > 0) {
						String bgcolor = "#FFFF6F";
						for (int i = 0; i < list2.size(); i++) {
							ViHomePageTodo02 bean = (ViHomePageTodo02) list2.get(i);
							if ("1".equals(bean.getT5Flag())) {
								bgcolor = "#FF0000";
							} else {
								bgcolor = "#FFFF6F";
							}
				%>
				<tr style="line-height: 22px;" bgcolor="<%=bgcolor%>">
					<td class="datatd" valign=center align="left" nowrap><%=bean.getWorkDate()%></td>
					<td class="datatd" valign=center align="left" nowrap><%=bean.getReportType()%></td>
					<td class="datatd" valign=center align="left" nowrap><%=bean.getBlNum()%></td>
					<td class="datatd" valign=center align="left" nowrap><%=bean.getSbNum()%></td>
					<td class="datatd" valign=center align="left" nowrap><%=bean.getNoPackageNum()%></td>
					<td class="datatd" valign=center align="left" nowrap><%=bean.getPackageNum()%></td>
				</tr>
				<%
					}
					} else {
				%>
				<tr bgcolor="#ffffff" style="line-height: 22px;">
					<td colspan="6" align="center" class="datatd">没有需要处理的交易</td>
				</tr>
				<%
					}
				%>
			</table>
			 <br>  
        	 <br> 
        	<% } %>
        	<% if(bool[1]){ %>
        	 <p ><span style="text-align:center;float:left;height:20px;"><font size=3 color=#000000><b>大额交易自查</b></font></span></p>
        	 <table width="100%" class="grouptable" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td class="labeltd" valign=center align="left" nowrap><font size=3 ><b>交易日期</b></font></td>
					<td class="labeltd" valign=center align="left" nowrap><font size=3 ><b>抽样总量</b></font></td>
					<td class="labeltd" valign=center align="left" nowrap><font size=3 ><b>待自查量</b></font></td>
				</tr>
				<%
					if (list3 != null && list3.size() > 0) {
						String bgcolor = "#FFFF6F";
						for (int i = 0; i < list3.size(); i++) {
							ViHomePageTodo03 bean = (ViHomePageTodo03) list3.get(i);
							if ("1".equals(bean.getT17Flag())) {
								bgcolor = "#FF0000";
							} else {
								bgcolor = "#FFFF6F";
							}
				%>
				<tr style="line-height: 22px;" bgcolor="<%=bgcolor%>">
					<td class="datatd" valign=center align="left" nowrap><%=bean.getWorkDate()%></td>
					<td class="datatd" valign=center align="left" nowrap><%=bean.getcNt()%></td>
					<td class="datatd" valign=center align="left" nowrap><%=bean.getsNt()%></td>
				</tr>
				<%
					}
					} else {
				%>
				<tr bgcolor="#ffffff" style="line-height: 22px;">
					<td colspan="3" align="center" class="datatd">没有需要处理的交易</td>
				</tr>
				<%
					}
				%>
			</table>
			<br>  
        	 <br>  
        	 <% } %>
        	 <% if(bool[2]){ %>
        	 <p ><span style="text-align:center;float:left;height:20px;"><font size=3 color=#000000><b>可疑交易自查</b></font></span></p>
        	 <table width="100%" class="grouptable" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td class="labeltd" valign=center align="left" nowrap><font size=3 ><b>报送日期</b></font></td>
					<td class="labeltd" valign=center align="left" nowrap><font size=3 ><b>抽样总量</b></font></td>
					<td class="labeltd" valign=center align="left" nowrap><font size=3 ><b>待自查量</b></font></td>
				</tr>
				<%
					if (list4 != null && list4.size() > 0) {
						String bgcolor = "#FFFF6F";
						for (int i = 0; i < list4.size(); i++) {
							ViHomePageTodo04 bean = (ViHomePageTodo04) list4.get(i);
							if ("1".equals(bean.getT17Flag())) {
								bgcolor = "#FF0000";
							} else {
								bgcolor = "#FFFF6F";
							}
				%>
				<tr style="line-height: 22px;" bgcolor="<%=bgcolor%>">
					<td class="datatd" valign=center align="left" nowrap><%=bean.getWorkDate()%></td>
					<td class="datatd" valign=center align="left" nowrap><%=bean.getcNt()%></td>
					<td class="datatd" valign=center align="left" nowrap><%=bean.getsNt()%></td>
				</tr>
				<%
					}
					} else {
				%>
				<tr bgcolor="#ffffff" style="line-height: 22px;">
					<td colspan="3" align="center" class="datatd">没有需要处理的交易</td>
				</tr>
				<%
					}
				%>
			</table>
			<% } %>
			
			
			<% if(bool[3]){ %>
        	 <p ><span style="text-align:center;float:left;height:20px;"><font size=3 color=#000000><b>操作员待办</b></font></span></p>
        	 <table width="100%" class="grouptable" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td class="labeltd" valign=center align="left" nowrap><font size=3 ><b>交易日期</b></font></td>
					<td class="labeltd" valign=center align="left" nowrap><font size=3 ><b>告警类型</b></font></td>
					<td class="labeltd" valign=center align="left" nowrap><font size=3 ><b>待调查</b></font></td>
				</tr>
				<%
					if (list5 != null && list5.size() > 0) {
						//String bgcolor = "#FFFF6F";
						String bgcolor = "#ffffff";
						for (int i = 0; i < list5.size(); i++) {
							ViHomePageTodo05 bean = (ViHomePageTodo05) list5.get(i);
							
				%>
				<tr style="line-height: 22px;" bgcolor="<%=bgcolor%>">
					<td class="datatd" valign=center align="left" nowrap><%=bean.getDataDate()%></td>
					<td class="datatd" valign=center align="left" nowrap><%=bean.getReportDOrM()%></td>
					<td class="datatd" valign=center align="left" nowrap><%=bean.getsNt()%></td>
				</tr>
				<%
					}
					} else {
				%>
				<tr bgcolor="#ffffff" style="line-height: 22px;">
					<td colspan="3" align="center" class="datatd">没有需要处理的交易</td>
				</tr>
				<%
					}
				%>
			</table>
			<% } %>
			<% if(bool[4]){ %>
        	 <p ><span style="text-align:center;float:left;height:20px;"><font size=3 color=#000000><b>管理员待办</b></font></span></p>
        	 <table width="100%" class="grouptable" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td class="labeltd" valign=center align="left" nowrap><font size=3 ><b>交易日期</b></font></td>
					<td class="labeltd" valign=center align="left" nowrap><font size=3 ><b>告警类型</b></font></td>
					<td class="labeltd" valign=center align="left" nowrap><font size=3 ><b>抽样总量</b></font></td>
					<td class="labeltd" valign=center align="left" nowrap><font size=3 ><b>待自查量</b></font></td>
				</tr>
				<%
					if (list6 != null && list6.size() > 0) {
						//String bgcolor = "#FFFF6F";
						String bgcolor = "#ffffff";
						for (int i = 0; i < list6.size(); i++) {
							ViHomePageTodo06 bean = (ViHomePageTodo06) list6.get(i);
				%>
				<tr style="line-height: 22px;" bgcolor="<%=bgcolor%>">
					<td class="datatd" valign=center align="left" nowrap><%=bean.getDataDate()%></td>
					<td class="datatd" valign=center align="left" nowrap><%=bean.getReportDOrM()%></td>
					<td class="datatd" valign=center align="left" nowrap><%=bean.getcNt()%></td>
					<td class="datatd" valign=center align="left" nowrap><%=bean.getsNt()%></td>
				</tr>
				<%
					}
					} else {
				%>
				<tr bgcolor="#ffffff" style="line-height: 22px;">
					<td colspan="3" align="center" class="datatd">没有需要处理的交易</td>
				</tr>
				<%
					}
				%>
			</table>
			<% } %>
			
			<% if(bool[5]){ %>
        	 <p ><span style="text-align:center;float:left;height:20px;"><font size=3 color=#000000><b>操作员待办</b></font></span></p>
        	 <table width="100%" class="grouptable" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td class="labeltd" valign=center align="left" nowrap><font size=3 ><b>交易日期</b></font></td>
					<td class="labeltd" valign=center align="left" nowrap><font size=3 ><b>告警类型</b></font></td>
					<td class="labeltd" valign=center align="left" nowrap><font size=3 ><b>待调查</b></font></td>
				</tr>
				<%
					if (list7 != null && list7.size() > 0) {
						//String bgcolor = "#FFFF6F";
						String bgcolor = "#ffffff";
						for (int i = 0; i < list7.size(); i++) {
							ViHomePageTodo07 bean = (ViHomePageTodo07) list7.get(i);
							
				%>
				<tr style="line-height: 22px;" bgcolor="<%=bgcolor%>">
					<td class="datatd" valign=center align="left" nowrap><%=bean.getDataDate()%></td>
					<td class="datatd" valign=center align="left" nowrap><%=bean.getReportDOrM()%></td>
					<td class="datatd" valign=center align="left" nowrap><%=bean.getsNt()%></td>
				</tr>
				<%
					}
					} else {
				%>
				<tr bgcolor="#ffffff" style="line-height: 22px;">
					<td colspan="3" align="center" class="datatd">没有需要处理的交易</td>
				</tr>
				<%
					}
				%>
			</table>
			<% } %>
			
			<% if(bool[6]||bool[7]){ %>
        	 <p ><span style="text-align:center;float:left;height:20px;"><font size=3 color=#000000><b>信用卡待办</b></font></span></p>
        	 <table width="100%" class="grouptable" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td class="labeltd" valign=center align="left" rowspan="2" nowrap><font size=3 ><b>Alert Cycle</b></font></td>
					<td class="labeltd" valign=center align="left" rowspan="2" nowrap><font size=3 ><b>Risk Level</b></font></td>
					<td class="labeltd" valign=center align="left" rowspan="2" nowrap><font size=3 ><b>Operator</b></font></td>
					<td class="labeltd" valign=center align="left" colspan="2" nowrap><font size=3 ><b>待调查(SMS Result)</b></font></td>
					<td class="labeltd" valign=center align="left" colspan="2" nowrap><font size=3 ><b>待调查(外呼结果)</b></font></td>
					<td class="labeltd" valign=center align="left" colspan="2" nowrap><font size=3 ><b>待调查(其他)</b></font></td>
				</tr>
				<tr>
					<td class="labeltd" valign=center align="left" nowrap><font size=3 ><b>告警号</b></font></td>
					<td class="labeltd" valign=center align="left" nowrap><font size=3 ><b>案件打开天数</b></font></td>
					<td class="labeltd" valign=center align="left" nowrap><font size=3 ><b>告警号</b></font></td>
					<td class="labeltd" valign=center align="left" nowrap><font size=3 ><b>案件打开天数</b></font></td>
					<td class="labeltd" valign=center align="left" nowrap><font size=3 ><b>告警号</b></font></td>
					<td class="labeltd" valign=center align="left" nowrap><font size=3 ><b>案件打开天数</b></font></td>
				</tr>
				<%
					if (list_credit != null && list_credit.size() > 0) {
						String bgcolor = "#ffffff";
						for (int i = 0; i < list_credit.size(); i++) {
							CreditCardToDoBeanShow bean = (CreditCardToDoBeanShow) list_credit.get(i);
							String bgMsg = "";
							String bgOut = "";
							String bgOther = "";
							Integer numMsg = bean.getNumMsg()==null?0:bean.getNumMsg();
							Integer numOut = bean.getNumOut()==null?0:bean.getNumOut();
							Integer numOther = bean.getNumOther()==null?0:bean.getNumOther();
							if(numMsg>=15){
								bgMsg = "#FF8080";
							}else if(numMsg>=10){
								bgMsg = "#FFFF80";
							}
							if(numOut>=15){
								bgOut = "#FF8080";
							}else if(numOut>=10){
								bgOut = "#FFFF80";
							}
							if(numOther>=15){
								bgOther = "#FF8080";
							}else if(numOther>=10){
								bgOther = "#FFFF80";
							}
							
							
				%>
				<tr style="line-height: 22px;" bgcolor="<%=bgcolor%>">
					<td class="datatd" valign=center align="left" nowrap><%=bean.getAlarmDate()%></td>
					<td class="datatd" valign=center align="left" nowrap><%=bean.getRiskLevel()%></td>
					<td class="datatd" valign=center align="left" nowrap><%=bean.getOperatorTlr()%></td>
					<td class="datatd" valign=center align="left" bgcolor="<%=bgMsg %>" nowrap>
						<%if(bool[6]){ %>
							<a href="javascript:doIndexWork('/fpages/creditcard/ftl/CreditCardApplyInfo.ftl?alarmNo=<%=bean.getAlarmNoMsg()%>&alarmDate=<%=bean.getAlarmDate()%>')">
								<%=bean.getAlarmNoMsg()==null?"":bean.getAlarmNoMsg()%>
							</a>
						<%}else{ %>
							<%=bean.getAlarmNoMsg()==null?"":bean.getAlarmNoMsg()%>
						<%} %>
					</td>
					<td class="datatd" valign=center align="left" bgcolor="<%=bgMsg %>" nowrap><%=bean.getNumMsg()==null?"":bean.getNumMsg()%></td>
					<td class="datatd" valign=center align="left" bgcolor="<%=bgOut %>" nowrap>
						<%if(bool[6]){ %>
							<a href="javascript:doIndexWork('/fpages/creditcard/ftl/CreditCardApplyInfo.ftl?alarmNo=<%=bean.getAlarmNoOut()%>&alarmDate=<%=bean.getAlarmDate()%>')">
								<%=bean.getAlarmNoOut()==null?"":bean.getAlarmNoOut()%>
							</a>
						<%}else{ %>
							<%=bean.getAlarmNoOut()==null?"":bean.getAlarmNoOut()%>
						<%} %>
					</td>
					<td class="datatd" valign=center align="left" bgcolor="<%=bgOut %>" nowrap><%=bean.getNumOut()==null?"":bean.getNumOut()%></td>
					<td class="datatd" valign=center align="left" bgcolor="<%=bgOther %>" nowrap>
						<%if(bool[6]){ %>
							<a href="javascript:doIndexWork('/fpages/creditcard/ftl/CreditCardApplyInfo.ftl?alarmNo=<%=bean.getAlarmNoOther()%>&alarmDate=<%=bean.getAlarmDate()%>')">
								<%=bean.getAlarmNoOther()==null?"":bean.getAlarmNoOther()%>
							</a>
						<%}else{ %>
							<%=bean.getAlarmNoOther()==null?"":bean.getAlarmNoOther()%>
						<%} %>
					</td>
					<td class="datatd" valign=center align="left" bgcolor="<%=bgOther %>" nowrap><%=bean.getNumOther()==null?"":bean.getNumOther()%></td>
				</tr>
				<%
					}
					} else {
				%>
				<tr bgcolor="#ffffff" style="line-height: 22px;">
					<td colspan="3" align="center" class="datatd">没有需要处理的交易</td>
				</tr>
				<%
					}
				%>
			</table>
			<% } %>
	</center>
	</div>
<script type="text/javascript">
function doIndexWork(url) {
	window.parent.parent.doWorkCredit('6001', "案件处理", url);
}
</script>
</body>
</html>