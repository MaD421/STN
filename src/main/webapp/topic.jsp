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
<c:set var="useri" value='${user.getUsers()}'/>
<c:set var="comminfo" value="${commsb.getComments(param.id)}"/>

<table class="black" style="margin-top: 5pt; width: 570pt">

    <tr>
        <td style="padding-top: 10pt; padding-bottom: 15pt">

            <table align="center" width="98%" border="0" style="background-color: #353535;">

                <tr>
                    <td class="center">
                        <c:forEach items="${comminfo}" var="cw">

                            <table style="background-color: #353535;">
                                <tr>
                                    <td class="left">
                                        <b>#${cw.getId()}</b> by <a href='/userdetails.jsp?id=${cw.getIdUser()}' style="text-decoration: none"><b style="color: ${user.classColor(cw.getUserClass())}">${e:forHtml(cw.getUsername())}</b></a>
                                        at ${tool.formatDate(cw.getDop(),2)} - [<a class="ui" href="javascript:void(0);" onclick="return deleteComment(${cw.getId()},${param.id});"><b>Delete</b></a>]
                                    </td>
                                </tr>
                            </table>
                            <table>
                                <tr>
                                    <td class="row2">

                                    </td>
                                    <td class="row2">
                                            ${tool.formatText(e:forHtml(cw.getCont()))}
                                    </td>
                                </tr>
                            </table>
                            <br/>
                        </c:forEach>
                    </td>
                </tr>

            </table>
        </td>

    </tr>
</table>

<c:remove var="error" scope="session" />

<%@ include file="structure/footer.jsp" %>
</body>
</html>
