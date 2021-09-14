<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="models.Calendars,java.util.ArrayList,java.util.Calendar,java.text.SimpleDateFormat" %>
<%Calendars cls=(Calendars)request.getAttribute("cls"); %>
<%ArrayList<Calendar> cals=(ArrayList<Calendar>)request.getAttribute("cal2"); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <h2>今日も勉強おつかれさまでした！</h2>
        	<div id="container">
			    <h3><%=cls.getYear() %>年<%=cls.getMonth() %>月のカレンダー</h3>
			    <p>
					<a href="?year=<%=cls.getYear()%>&month=<%=cls.getMonth()-1%>">前月</a>
			    	<a href="?year=<%=cls.getYear()%>&month=<%=cls.getMonth()+1%>">翌月</a>
			    </p>
			    <table>
			      <tr>
			        <th>日</th>
			        <th>月</th>
			        <th>火</th>
			        <th>水</th>
			        <th>木</th>
			        <th>金</th>
			        <th>土</th>
			      </tr>
			      <%for(String[] row: cls.getDate()){ %>
    			  <tr>
      				<%for(String col:row) {%>
      					<%if (col.startsWith("●")){ %>
      						<td class="today"><%= col %></td>
      					<%}else{ %>
      						<td><%=cls.getYear()%>/<%=cls.getMonth()%>/<%=col %></td>
      					<%} %>
      				<%} %>
      			   </tr>
      			  <%} %>
			      </table>
  			</div><!-- end container-->
  			<div id="record">
  			<%--パターン① --%>
  				<h3>${daily}の学習記録</h3>
			<%--パターン② --%>
  				<h4>の勉強時間</h4>
  				<a href="<c:url value='/daily' />">学習時間を記録する</a>
  			</div>
    </c:param>
</c:import>
<%
  // 今日
  Calendar today = Calendar.getInstance();
  // d.getDay() で、その月の１日が何曜日かがわかる（3なら水曜日）
  java.util.Date d = cals.get(0).getTime();
	SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
%>
<% for (int i = 0; i < 30; i++) {
	String value = "";
	if (i < d.getDay()) {
		value = "x";
	} else {
		value = sf.format(cals.get(i-d.getDay()).getTime());
	}
%>
<%= value %>
<% }%>
<% for(Calendar cal: cals) {
	//yyyy年MM月dd日
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	String s = sdf.format(cal.getTime());
%>  <%= s %>
<% } %>

