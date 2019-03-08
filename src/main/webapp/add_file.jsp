<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%@ include file="structure/meta.jsp" %>
    <title>Add File</title>
    <%@ include file="structure/header.jsp" %>
</head>
<body>
<%@ include file="structure/beans.jsp" %>
${user.verifyAcces(pageContext.request,pageContext.response)}
<%@ include file="structure/statusbar.jsp" %>

<jsp:useBean id="fileCategory" class="com.stn.helpers.FileCategoriesHelper"/>
<c:set var="fileCategories" value='${fileCategory.getFileCategories()}'/>

<table class="black" style="margin-top: 5pt; width: 570pt">

    <tr>
        <td class="center"><h1>Add File</h1></td>
    </tr>

    <tr>
        <td class="center">
            <table class="black" border="1" style="margin-top: 5pt; width: 90%; border-collapse: collapse;">
                <form name="add_file" action="AddFileProcess" method="post">
                    <tr>
                        <td class='row2' style="text-align: left;">Name</td>
                        <td class='row3' style="text-align: left">
                            <input style="height: 9pt" type="text" name="name" value="${sessionScope.fname}" size="95">
                        </td>
                    </tr>
                    <tr>
                        <td class='row2' style="text-align: left;">Description</td>
                        <td class='row3' style="text-align: left">
                            <textarea rows="9" cols="95" name="description">${sessionScope.fdescription}</textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class='row2' style="text-align: left;">Link</td>
                        <td class='row3' style="text-align: left">
                            <input style="height: 9pt" type="text" name="link" value="${sessionScope.flink}" size="95">
                        </td>
                    </tr>
                    <tr>
                        <td class='row2' style="text-align: left;">Type</td>
                        <td class='row3' style="text-align: left">
                            <select name='type'>
                                <option value="0" selected>--</option>
                                <c:forEach items="${fileCategories}" var="c">
                                    <option value="${c.getFileCategoryId()}">${c.getName()}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class='row2' style="text-align: left;">Facultate</td>
                        <td class='row3' style="text-align: left">
                            ${userInfo.getFacultate()}
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="center" style="padding-top: 7pt; padding-bottom: 7pt; background-color: #2c2c2c">
                            <b style="color: red;">${sessionScope.error}</b>
                            <input name="add_file" type="submit" value="Add File">
                        </td>
                    </tr>
                </form>
            </table>
            <br/><br/>
        </td>
    </tr>

</table>

<%@ include file="structure/footer.jsp" %>
</body>
</html>