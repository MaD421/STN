<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%@ include file="structure/meta.jsp" %>
    <title>Files</title>
    <%@ include file="structure/header.jsp" %>
</head>
<body>
<%@ include file="structure/beans.jsp" %>
${user.verifyAcces(pageContext.request,pageContext.response)}
<%@ include file="structure/statusbar.jsp" %>

<jsp:useBean id="file" class="com.stn.helpers.FilesHelper"/>
<c:set var="files" value='${file.getFiles(userInfo.getIdFacultate(),param.p)}'/>

<jsp:useBean id="fileCategory" class="com.stn.helpers.FileCategoriesHelper"/>
<c:set var="fileCategories" value='${fileCategory.getFileCategories()}'/>

<table class="black" style="margin-top: 8pt; width: 570pt">

    <tr>
        <td class="center">
            <br/>
            <table cellspacing='0' cellpadding='0' align="center">
                <tr>
                    <c:forEach items="${fileCategories}" var="c">
                        <td align='center' valign='middle' style="padding: 0"><input name="${c.getName()}" type='checkbox'  value=""${c.getFileCategoryId()}"></td>
                        <td align='left' style="padding: 0">${c.getName()}</td>
                    </c:forEach>
                </tr>
            </table>
            <br/>
        </td>
    </tr>

    <tr>
        <td class="center">
            <form method='get' action='files.jsp'>
                <input type="hidden" name="p" value="1">
                Search: <input type="text" name="search" style="width: 240px;">&nbspin&nbsp;
                <select name="search_in">
                    <option value="names"  selected>Names only</option>
                    <option value="all" >Names and descriptions</option>
                </select>
                <input type="submit" value="Search!" disabled="disabled">
                <br/><br/><a class="ui" href="/add_file.jsp" style="color: #b3daff">[Add New File]</a>
            </form>
        </td>
    </tr>

    <tr>
        <td class="center">
            <br/>
            ${tool.pager("files.jsp",file.countFiles(userInfo.getIdFacultate()),param.p,30,1)}
            <table class="black" border="1" style="margin-top: 5pt; border-collapse: collapse;">
                <tr>
                    <th style="text-align: center; padding: 3pt;">Type</th>
                    <th style="text-align: left; padding: 3pt;">Name</th>
                    <th style="text-align: left; padding: 3pt;"><img src="img/columns/comments.png"></th>
                    <th style="text-align: center; padding: 3pt"><img src="img/columns/added.png"></th>
                    <th style="text-align: center; padding: 3pt">Views</th>
                    <th style="text-align: center; padding: 3pt">Added By</th>
                </tr>
                <c:forEach items="${files}" var="f">
                <tr>
                    <td style="padding: 0"><img src="img/categories/${f.getFileCategory().getPicture()}" title="${f.getFileCategory().getName()}"></td>
                    <td class='row2' style="text-align: left" width="500">
                        <b><a class="ui" href="/view_file.jsp?id=${f.getFileId()}">${f.getName()}</a></b>
                    </td>
                    <td class='row2' style="text-align: center">0</td>
                    <td class='row2' style="text-align: center">${tool.formatDate(f.getDate(),4)}<br/>${tool.formatDate(f.getDate(),5)}</td>
                    <td class='row2' style="text-align: center">${f.getViews()}</td>
                    <td class='row2' style="text-align: center">
                        <a href='/userdetails.jsp?id=${f.getUser().getId()}' style="text-decoration: none"><b style="color: ${user.classColor(f.getUser().getUserClass())}">${e:forHtml(f.getUser().getUserName())}</b></a>
                    </td>
                </tr>
                </c:forEach>
            </table>
            <br/>
            ${tool.pager("files.jsp",file.countFiles(userInfo.getIdFacultate()),param.p,30,1)}
            <br/>
            <b>Disclaimer</b>
            <p>None of the files shown here are actually hosted on this server. The links are provided solely by this site's users. The administrator of this site cannot be held responsible for what its users post, or any other actions of its users.
                You may not use this site to distribute or download any material when you do not have the legal rights to do so. It is your own responsibility to adhere to these terms.</p>
            <br/>
        </td>
    </tr>

</table>

<%@ include file="structure/footer.jsp" %>
</body>
</html>
