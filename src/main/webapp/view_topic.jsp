<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%@ include file="structure/meta.jsp" %>
    <%@ include file="structure/header.jsp" %>
    <title>View topic</title>
</head>
<body>
<%@ include file="structure/beans.jsp" %>
${user.verifyAcces(pageContext.request,pageContext.response)}
<%@ include file="structure/statusbar.jsp" %>

<jsp:useBean id="commsb" class="com.stn.helpers.CommentsHelper"/>
<jsp:useBean id="topicc" class="com.stn.helpers.TopicHelper"/>
<jsp:useBean id="catc" class="com.stn.helpers.CategoryHelper"/>
<c:set var="useri" value='${user.getUsers()}'/>
<c:set var="comminfo" value="${commsb.getComments(param.id,param.p)}"/>
<c:set var="tp" value='${topicc.getTopic(param.id)}'/>
<c:set var="ct" value='${catc.getCategoryByTopic(tp.getGroupId(),userInfo.getIdFacultate())}'/>

<table class="black" style="margin-top: 5pt; width: 570pt">

    <tr>
        <td class="center">
            <h1 style="color: white">
                <a class="ui" href="forums.jsp">${userInfo.getFacultate()}</a> &raquo; <a class="ui" href="view_forum.jsp?id=${ct.getId()}">${ct.getCategorie()}</a> &raquo; ${tp.getName()}
            </h1>
        </td>
    </tr>

    <tr>
        <td style="padding-top: 10pt; padding-bottom: 15pt">
            ${tool.pager("view_topic.jsp?id=".concat(param.id),commsb.countComments(param.id),param.p,25,2)}<br/>
            <table align="center" width="98%" style="background-color: #353535;border-style: solid; border-width: 1px;border-color: #62635f">

                <tr>
                    <td class="center">
                        <c:forEach items="${comminfo}" var="cw">
                            <c:set var="us" value='${user.getUserInfo(cw.getIdUser())}'/>
                            <table style="background-color: #353535;">
                                <tr>
                                    <td class="left">
                                        <font size="1">
                                            <b>#<a id="${cw.getId()}" class="ui" href="#${cw.getId()}">${cw.getId()}</a></b> by <a href='/userdetails.jsp?id=${cw.getIdUser()}' style="text-decoration: none"><b style="color: ${user.classColor(cw.getUserClass())}">${e:forHtml(cw.getUsername())}</b></a>
                                        at ${tool.formatDate(cw.getDop(),2)} - [<a class="ui" href="javascript:void(0);"><b>Reply</b></a>]
                                        <c:if test="${userInfo.getUserClass() > 4}">
                                        - [<a class="ui" href="javascript:void(0);" onclick="return deleteComment(${cw.getId()},${param.id});"><b>Delete</b></a>]
                                        </c:if>
                                        </font>
                                    </td>
                                </tr>
                            </table>
                            <table style="border-collapse: collapse;">
                                <tr>
                                    <td class="row2" style="padding: 0" width="150">
                                        <img src="${e:forHtmlAttribute(us.getAvatar())}" width="150">
                                        Forum posts: ${us.getPosts()}<br/>
                                        Rank: ${user.forumClassName(us.getPosts())}<br/>
                                        Joined: ${tool.formatDate(us.getJoinDate(),4)}<br/>
                                    </td>
                                    <td class="row2" style="text-align: left;vertical-align: top;" width="550">
                                            ${tool.formatText(e:forHtml(cw.getCont()))}
                                    </td>
                                </tr>
                            </table>
                            <br/>
                        </c:forEach>
                    </td>
                </tr>

            </table>
            <br/>
            ${tool.pager("view_topic.jsp?id=".concat(param.id),commsb.countComments(param.id),param.p,25,2)}
        </td>

    </tr>
    <tr>
        <td>
            <table align="center" style="background-color: #353535;border-style: solid; border-width: 1px;border-color: #62635f">
                <tr>
                    <td class="center">
                        <h1 style="color: white">
                            Reply to topic : ${tp.getName()}
                        </h1>
                    </td>
                </tr>
                <tr>
                    <td class="center" style="padding-top: 5pt;padding-left: 8pt;padding-right: 8pt">
                        <form method="post" action="/AddComment">
                            <div style="text-align: right"><a class="ui" href="/bbcode_legend.jsp" target="_blank" style="color: #b3daff;">[BBCode Legend]</a></div>
                            <textarea rows="9" cols="90" style="margin-top: 1pt" name="body"></textarea><br/>
                            <input type="hidden" name="idPost" value="${tp.getTopicId()}">
                            <input type="hidden" name="page" value="${param.p}">
                            <input type="submit" name="Add" value="Submit" style="margin-top: 5pt">
                            <br/><br/><br/>
                        </form>
                    </td>
                </tr>
            </table>
            <br/><br/>
        </td>
    </tr>

</table>

<c:remove var="error" scope="session" />

<%@ include file="structure/footer.jsp" %>
</body>
</html>
