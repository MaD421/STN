<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%@ include file="structure/meta.jsp" %>
    <title>View forum</title>
    <%@ include file="structure/header.jsp" %>
</head>
<body>

<%@ include file="structure/beans.jsp" %>
${user.verifyAcces(pageContext.request,pageContext.response)}
<%@ include file="structure/statusbar.jsp" %>

<c:if test="${param.id != null}">

<jsp:useBean id="topics" class="com.stn.helpers.TopicHelper"/>
<jsp:useBean id="catc" class="com.stn.helpers.CategoryHelper"/>
<c:set var="topic" value='${topics.getTopics(param.id,param.p)}'/>
<c:set var="ct" value='${catc.getCategory(param.id)}'/>

<table class="black" style="margin-top: 5pt; width: 570pt">
    <tr>
        <td class="center">
            <h1 style="color: white">
                <a class="ui" href="forums.jsp">${userInfo.getFacultate()}</a> &raquo; ${ct.getCategorie()}
            </h1>
        </td>
    </tr>
    <tr>
        <td class="center">
            <br/><br/>
                ${tool.pager("view_forum.jsp?id=".concat(param.id),topics.countTopics(param.id),param.p,25,2)}
            <table class="black" border="1" style="margin-top: 5pt; width: 96%; border-collapse: collapse;">
                <tr>
                    <th style="text-align: left; padding: 3pt; width: 320pt">Topic</th>
                    <th style="text-align: center; padding: 3pt">Replies</th>
                    <th style="text-align: center; padding: 3pt">Views</th>
                    <th style="text-align: center; padding: 3pt">Author</th>
                    <th style="text-align: left; padding: 3pt">Last Post</th>
                </tr>
                <c:if test="${fn:length(topic) == 0}">
                    <tr><td class="row2" style="text-align: center" colspan="5">Nothing found!</td></tr>
                </c:if>
                <c:forEach items="${topic}" var="t">
                    <tr>
                        <td class='row3' style="text-align: left">
                            <img src="img/cat.png" style="vertical-align: middle">
                            <b><a class="ui" href='/view_topic.jsp?id=${t.getTopicId()}&p=1' style="margin-left: 3pt">${t.getName()}</a></b>
                        </td>
                        <td class='row2' style="text-align: right">${t.getTotalposts()}</td>
                        <td class='row2' style="text-align: right">${t.getViews()}</td>
                        <td class='row3' style="text-align: center"><a href='/userdetails.jsp?id=${t.getAuthorId()}' style="text-decoration: none"><b style="color: ${user.classColor(t.getAuthorClass())}">${e:forHtml(t.getAuthorName())}</b></a></td>
                        <td class='row3' style="text-align: left">
                            <font style="font-size: 7pt;">${tool.formatDate(t.getLastPostDate(),2)}<br/>
                                by </font><a href='/userdetails.jsp?id=${t.getLastPoster().getId()}' style="text-decoration: none"><b style="color: ${user.classColor(t.getLastPoster().getUserClass())}">${e:forHtml(t.getLastPoster().getUserName())}</b></a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <br/>
            ${tool.pager("view_forum.jsp?id=".concat(param.id),topics.countTopics(param.id),param.p,25,2)}
            <br/><br/>
        </td>
    </tr>
    <tr>
        <td>
            <table align="center" style="background-color: #353535;border-style: solid; border-width: 1px;border-color: #62635f">
                <tr>
                    <td class="center">
                        <h1 style="color: white">
                            Add new topic
                        </h1>
                    </td>
                </tr>
                <tr>
                    <td class="center" style="padding-top: 5pt;padding-left: 8pt;padding-right: 8pt">
                        <form method="post" action="/AddTopic">
                            <p style="display: inline">Topic Name:</p><input type="text" name="topic_name" style="width: 180pt; margin-left: 8pt"><br/>
                            <textarea rows="6" cols="60" style="margin-top: 8pt" name="body"></textarea><br/>
                            <input type="hidden" name="group_id" value="${param.id}">
                            <input type="submit" name="Add" value="Add Topic" style="margin-top: 5pt"><br/>
                        </form>
                            ${sessionScope.error}
                        <br/>
                        <br/>
                    </td>
                </tr>
            </table>
            <br/><br/>
        </td>
    </tr>
</table>
</c:if>

<c:remove var="error" scope="session" />

<%@ include file="structure/footer.jsp" %>
</body>
</html>
