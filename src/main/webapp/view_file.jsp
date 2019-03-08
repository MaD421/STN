<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%@ include file="structure/meta.jsp" %>
    <title>View file</title>
    <%@ include file="structure/header.jsp" %>
</head>
<body>
<%@ include file="structure/beans.jsp" %>
${user.verifyAcces(pageContext.request,pageContext.response)}
<%@ include file="structure/statusbar.jsp" %>

<c:if test="${param.id != null}">

<jsp:useBean id="file" class="com.stn.helpers.FilesHelper"/>
${file.updateView(param.id)}
<c:set var="f" value='${file.getFile(param.id)}'/>

<table class="black" style="margin-top: 8pt; width: 570pt">

    <tr>
        <td class="center"><h1>${e:forHtml(f.getName())}</h1></td>
    </tr>

    <tr>
        <td class="center">
            <table class="black" border="1" style="margin-top: 5pt; width: 90%; border-collapse: collapse;">
                <tr>
                    <td class='row2' style="text-align: right;" width="70"><b>File Name</b></td>
                    <td class='row3' style="text-align: left">${e:forHtml(f.getName())}</td>
                </tr>
                <tr>
                    <td class='row2' style="text-align: right;" width="70"><b>Link</b></td>
                    <td class='row3' style="text-align: left"><a class="ui" href="${f.getLink()}" target="_blank" style="color: #b3daff;">${f.getLink()}</a></td>
                </tr>
                <tr>
                    <td class='row2' style="text-align: right;"><b>Description</b></td>
                    <td class='row3' style="text-align: left">${tool.formatText(e:forHtml(f.getDescription()))}</td>
                </tr>
                <tr>
                    <td class='row2' style="text-align: right;"><b>Type</b></td>
                    <td class='row3' style="text-align: left">${(f.getFileCategory().getName())}</td>
                </tr>
                <tr>
                    <td class='row2' style="text-align: right;"><b>Added</b></td>
                    <td class='row3' style="text-align: left">${tool.formatDate(f.getDate(),2)}</td>
                </tr>
                <tr>
                    <td class='row2' style="text-align: right;"><b>Views</b></td>
                    <td class='row3' style="text-align: left">${f.getViews()}</td>
                </tr>
                <tr>
                    <td class='row2' style="text-align: right;"><b>Added By</b></td>
                    <td class='row3' style="text-align: left">
                        <a href='/userdetails.jsp?id=${f.getUser().getId()}' style="text-decoration: none"><b style="color: ${user.classColor(f.getUser().getUserClass())}">${e:forHtml(f.getUser().getUserName())}</b></a>
                    </td>
                </tr>
            </table>
            <br/><br/>
            <c:if test="${userInfo.getUserClass() > 4 || f.getUser().getId() == userInfo.getId()}">
            <form method="get" action="edit_file.jsp">
                <input type="hidden" value="${param.id}" name="id">
                <input type="submit" value="Edit File">
            </form>
            </c:if>
            <br/><br/>
        </td>
    </tr>

</table>

</c:if>

<%@ include file="structure/footer.jsp" %>
</body>
</html>