<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%@ include file="/structure/meta.jsp" %>
    <title>View logs</title>
    <%@ include file="/structure/header.jsp" %>
</head>
<body>
<%@ include file="/structure/beans.jsp" %>
${user.verifyAcces(pageContext.request,pageContext.response)}
<%@ include file="/structure/statusbar.jsp" %>

<jsp:useBean id="log" class="com.stn.helpers.LogHelper"/>

<c:choose>
    <c:when test="${param.search == null}">
        <c:set var="logs" value='${log.getLogs(param.p)}'/>
    </c:when>
    <c:when test="${param.search != null}">
        <c:set var="logs" value='${log.getLogsbySearch(param.p,param.search)}'/>
    </c:when>
</c:choose>

<table class="black" style="margin-top: 8pt; width: 570pt">
    <tr>
        <td class="center"><h1>Site logs</h1></td>
    </tr>

    <tr>
        <td class="center">
            <form method='get' action='logs.jsp'>
                <input type="hidden" name="p" value="1">
            Search: <input type="text" name="search" style="width: 240px;">
                <input type="submit" value="Search!">
            </form>
        </td>
    </tr>

    <tr>
        <td class="center">
            <table class="black" border="1" style="margin-top: 5pt; width: 90%; border-collapse: collapse;">
                <tr>
                    <th style="text-align: left; padding: 3pt;">Event</th>
                    <th style="text-align: center; padding: 3pt">Type</th>
                    <th style="text-align: center; padding: 3pt">Date</th>
                </tr>
                <c:forEach items="${logs}" var="l">
                    <tr>
                        <td class='row2' style="text-align: left">${l.getContent()}</td>
                        <td class='row' style="text-align: center">
                            <c:if test="${l.getType() == 1}">
                                Login
                            </c:if>
                            <c:if test="${l.getType() == 2}">
                                Register
                            </c:if>
                            <c:if test="${l.getType() == 3}">
                                User
                            </c:if>
                        </td>
                        <td class='row' style="text-align: center">${tool.formatDate(l.getDate(),2)}</td>
                    </tr>
                </c:forEach>
            </table>

            <br/>
            <c:choose>
                <c:when test="${param.search == null}">
                    ${tool.pager("logs.jsp",log.countLogs(),param.p,15,1)}
                </c:when>
                <c:when test="${param.search != null}">
                    ${tool.pager("logs.jsp?search=".concat(param.search),log.countLogsbySearch(param.search),param.p,15,2)}
                </c:when>
            </c:choose>

        </td>
    </tr>

    <tr>
        <td>
            <br/><br/>
        </td>
    </tr>

</table>

<%@ include file="/structure/footer.jsp" %>
</body>
</html>
