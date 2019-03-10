<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%@ include file="structure/meta.jsp" %>
    <title>Edit File</title>
    <%@ include file="structure/header.jsp" %>
</head>
<body>
<%@ include file="structure/beans.jsp" %>
${user.verifyAcces(pageContext.request,pageContext.response)}
<%@ include file="structure/statusbar.jsp" %>

<jsp:useBean id="file" class="com.stn.helpers.FilesHelper"/>
<c:set var="f" value='${file.getFile(param.id)}'/>

<jsp:useBean id="fileCategory" class="com.stn.helpers.FileCategoriesHelper"/>
<c:set var="fileCategories" value='${fileCategory.getFileCategories()}'/>

<table class="black" style="margin-top: 5pt; width: 570pt">

    <tr>
        <td class="center"><h1>Edit file: ${e:forHtml(f.getName())}</h1></td>
    </tr>

    <tr>
        <td class="center">
            <table class="black" border="1" style="margin-top: 5pt; width: 90%; border-collapse: collapse;">
                <form name="add_file" action="EditFileProcess" method="post">
                    <tr>
                        <td class='row2' style="text-align: left;">Name</td>
                        <td class='row3' style="text-align: left">
                            <input style="height: 9pt" type="text" name="name" value="${f.getName()}" size="95">
                        </td>
                    </tr>
                    <tr>
                        <td class='row2' style="text-align: left;">Description</td>
                        <td class='row3' style="text-align: left">
                            <textarea rows="9" cols="95" name="description">${f.getDescription()}</textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class='row2' style="text-align: left;">Link</td>
                        <td class='row3' style="text-align: left">
                            <input style="height: 9pt" type="text" name="link" value="${f.getLink()}" size="95">
                        </td>
                    </tr>
                    <tr>
                        <td class='row2' style="text-align: left;">Type</td>
                        <td class='row3' style="text-align: left">
                            <select name='type'>
                                <c:forEach items="${fileCategories}" var="c">
                                    <option value="${c.getFileCategoryId()}" <c:if test="${f.getFileCategory().getFileCategoryId() == c.getFileCategoryId()}">selected</c:if> >${c.getName()}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="center" style="padding-top: 7pt; padding-bottom: 7pt; background-color: #2c2c2c">
                            <input type="hidden" value="${param.id}" name="fileId">
                            <b style="color: red;">${sessionScope.error}</b>
                            <input name="edit_file" type="submit" value="Update Information">
                        </td>
                    </tr>
                </form>
            </table>
            <br/><br/>
        </td>
    </tr>

</table>

<c:remove var="error" scope="session" />

<%@ include file="structure/footer.jsp" %>
</body>
</html>
