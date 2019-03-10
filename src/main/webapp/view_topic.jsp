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
<c:set var="categories" value="${catc.getCategories(userInfo.getIdFacultate())}"/>

${topicc.updateView(param.id)}

<table class="black" style="margin-top: 5pt; width: 570pt">

    <tr>
        <td class="center">
            <h1 style="color: white">
                <a class="ui" href="forums.jsp">${userInfo.getFacultate()}</a> &raquo; <a class="ui" href="view_forum.jsp?id=${ct.getId()}&p=1">${ct.getCategorie()}</a> &raquo; ${tp.getName()}
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
                                            <b>#<a id="${cw.getId()}" class="ui" href="#${cw.getId()}">${cw.getId()}</a></b> by <a href='/userdetails.jsp?id=${cw.getIdUser()}' style="text-decoration: none"><b style="color: ${user.classColor(cw.getUserClass())}" id="username${cw.getIdUser()}">${e:forHtml(cw.getUsername())}</b></a>
                                        at ${tool.formatDate(cw.getDop(),2)} - [<a class="ui" href="#add_comment" onclick="return addQuote(${cw.getIdUser()},${cw.getId()});"><b>Quote</b></a>]
                                        <c:if test="${userInfo.getUserClass() > 4}">
                                        - [<a class="ui" href="javascript:void(0);" onclick="return editComment(${cw.getId()},${param.id},${param.p});"><b>Edit</b></a>]
                                        - [<a class="ui" href="javascript:void(0);" onclick="return deleteComment(${cw.getId()},${param.id},${param.p});"><b>Delete</b></a>]
                                        </c:if>
                                        </font>
                                        <input type="hidden" value="${cw.getCont()}" id="content${cw.getId()}">
                                    </td>
                                </tr>
                            </table>
                            <table style="border-collapse: collapse;">
                                <tr>
                                    <td class="row2" style="padding: 0" width="150" valign="top">
                                        <img src="${e:forHtmlAttribute(us.getAvatar())}" width="150">
                                        Forum posts: ${us.getPosts()}<br/>
                                        Rank: ${user.forumClassName(us.getPosts())}<br/>
                                        Joined: ${tool.formatDate(us.getJoinDate(),4)}<br/>
                                    </td>
                                    <td class="row2" style="text-align: left;vertical-align: top; padding-left: 5pt" width="550" id="body_${cw.getId()}">
                                            ${tool.formatText(e:forHtml(cw.getCont()))}
                                                <c:if test="${cw.getLastEdit() != null}">
                                                    <br/><br/>
                                                    <font size="1" style="font-size: 7pt;">Last edited on ${tool.formatDate(cw.getLastEdit(),3)}</font>
                                                </c:if>
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
                        <form method="post" action="/AddComment" id="add_comment">
                            <div style="text-align: right"><a class="ui" href="/bbcode_legend.jsp" target="_blank" style="color: #b3daff;">[BBCode Legend]</a></div>
                            <textarea rows="9" cols="90" style="margin-top: 1pt" name="body" id="comment_body"></textarea><br/>
                            <input type="hidden" name="idPost" value="${tp.getTopicId()}">
                            <input type="hidden" name="page" value="${param.p}">
                            <input type="submit" name="Add" value="Submit" style="margin-top: 5pt">
                            <br/><br/><br/>
                        </form>
                    </td>
                </tr>
            </table>
            <c:if test="${userInfo.getUserClass() < 4 }">
                <br/><br/>
            </c:if>
        </td>
    </tr>

<c:if test="${userInfo.getUserClass() > 4 }">

    <tr>
        <td>
            <table class="black" border="1" style="margin-top: 10pt; border-collapse: collapse;">
                <form method="post" action="/EditTopic">
                <tr>
                    <td class='row2' style="text-align: center;">Topic Name</td>
                    <td class=""><input type="text" name="topicName" value="${tp.getName()}" style="width: 150pt"></td>
                </tr>
                    <tr>
                        <td class='row2' style="text-align: center;">Category</td>
                        <td class='row' style="text-align: center">
                            <select name='topicCategory'>
                                <c:forEach items="${categories}" var="ctg">
                                    <option value="${ctg.getId()}"
                                            <c:if test="${ct.getId() == ctg.getId()}">selected</c:if>
                                    >${ctg.getCategorie()}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class='row2' style="text-align: center;">Delete</td>
                        <td class='row' style="text-align: center;">
                            <input type="radio" name="deleteTopic" value="0" style="vertical-align: middle;" checked >
                            <label style="vertical-align: middle;">No</label>
                            <input type="radio" name="deleteTopic" value="1" style="vertical-align: middle;">
                            <label style="vertical-align: middle;">Yes</label>
                        </td>
                    </tr>
                    <tr>
                        <td class="row" style="text-align: center" colspan="2">
                            <input type="hidden" name="topicId" value="${param.id}">
                            <input type="hidden" name="categoryId" value="${ct.getId()}">
                            <input type="hidden" name="page" value="${param.p}">
                            <br/>
                            <input name="save_changes" type="submit" value="Save Changes">
                            <br/><br/>${sessionScope.error2}
                        </td>
                    </tr>
                </form>
            </table>
            <br/><br/>
        </td>
    </tr>

</c:if>

</table>

<c:remove var="error" scope="session" />

<%@ include file="structure/footer.jsp" %>
</body>
</html>
