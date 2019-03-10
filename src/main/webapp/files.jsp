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

<c:choose>
    <c:when test="${param.search == null}">
        <c:set var="files" value='${file.getFiles(userInfo.getIdFacultate(),param.p)}'/>
    </c:when>
    <c:when test="${param.search != null && param.cat == null}">
        <c:set var="files" value='${file.getFilesBySearch(userInfo.getIdFacultate(),param.p,param.search,param.search_in,0)}'/>
    </c:when>
    <c:when test="${param.search != null && param.cat != null}">
        <c:set var="files" value='${file.getFilesBySearch(userInfo.getIdFacultate(),param.p,param.search,param.search_in,param.cat)}'/>
    </c:when>
</c:choose>

<jsp:useBean id="fileCategory" class="com.stn.helpers.FileCategoriesHelper"/>
<c:set var="fileCategories" value='${fileCategory.getFileCategories()}'/>

<form method='get' action='files.jsp'>
<table class="black" style="margin-top: 8pt; width: 570pt">
    <tr>
        <td class="center">
            <br/>
            <table cellspacing='0' cellpadding='0' align="center">
                <tr>
                    <c:forEach items="${fileCategories}" var="c">
                        <td align='center' valign='middle' style="padding: 0">
                            <input class="single-checkbox" name="cat" type='checkbox'  value="${c.getFileCategoryId()}" <c:if test="${c.getFileCategoryId() == param.cat}">checked = "checked"</c:if> >
                        </td>
                        <td align='left' style="padding: 0">
                                <a class="ui" href="/files.jsp?cat=${c.getFileCategoryId()}&p=1&search=&search_in=1">${c.getName()}</a>
                        </td>
                    </c:forEach>
                </tr>
            </table>
            <br/>
        </td>
    </tr>

    <tr>
        <td class="center">

                <input type="hidden" name="p" value="1">
                Search: <input type="text" name="search" style="width: 240px;">&nbspin&nbsp;
                <select name="search_in">
                    <option value="1"  selected>Names only</option>
                    <option value="2" >Names and descriptions</option>
                </select>
                <input type="submit" value="Search!">
                <br/><br/><a class="ui" href="/add_file.jsp" style="color: #b3daff">[Add New File]</a>
        </td>
    </tr>
    <tr>
        <td class="center">
            <br/>

            <c:choose>
                <c:when test="${param.search == null}">
                    ${tool.pager("files.jsp",file.countFiles(userInfo.getIdFacultate()),param.p,30,1)}
                </c:when>
                <c:when test="${param.search != null && param.cat == null}">
                    ${tool.pager("files.jsp?search=".concat(param.search).concat("&search_in=").concat(param.search_in),file.countFilesBySearch(userInfo.getIdFacultate(),param.search,param.search_in,0),param.p,30,2)}
                </c:when>
                <c:when test="${param.search != null && param.cat != null}">
                    ${tool.pager("files.jsp?search=".concat(param.search).concat("&search_in=").concat(param.search_in).concat("&cat=").concat(param.cat),file.countFilesBySearch(userInfo.getIdFacultate(),param.search,param.search_in,param.cat),param.p,30,2)}
                </c:when>
            </c:choose>

            <table class="black" border="1" style="margin-top: 5pt; border-collapse: collapse;">
                <tr>
                    <th style="text-align: center; padding: 3pt;">Type</th>
                    <th style="text-align: left; padding: 3pt;" width="500">Name</th>
                    <th style="text-align: left; padding: 3pt;"><img src="img/columns/comments.png"></th>
                    <th style="text-align: center; padding: 3pt"><img src="img/columns/added.png"></th>
                    <th style="text-align: center; padding: 3pt">Views</th>
                    <th style="text-align: center; padding: 3pt">Added By</th>
                </tr>
                <c:if test="${fn:length(files) == 0}">
                    <tr><td class="row2" style="text-align: center" colspan="6">Nothing found!</td></tr>
                </c:if>
                <c:forEach items="${files}" var="f">
                <tr>
                    <td style="padding: 0">
                        <a href="/files.jsp?cat=${f.getFileCategory().getFileCategoryId()}&p=1&search=&search_in=1">
                        <img src="img/categories/${f.getFileCategory().getPicture()}" title="${f.getFileCategory().getName()}">
                        </a>
                    </td>
                    <td class='row2' style="text-align: left">
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

            <c:choose>
                <c:when test="${param.search == null}">
                    ${tool.pager("files.jsp",file.countFiles(userInfo.getIdFacultate()),param.p,30,1)}
                </c:when>
                <c:when test="${param.search != null && param.cat == null}">
                    ${tool.pager("files.jsp?search=".concat(param.search).concat("&search_in=").concat(param.search_in),file.countFilesBySearch(userInfo.getIdFacultate(),param.search,param.search_in,0),param.p,30,2)}
                </c:when>
                <c:when test="${param.search != null && param.cat != null}">
                    ${tool.pager("files.jsp?search=".concat(param.search).concat("&search_in=").concat(param.search_in).concat("&cat=").concat(param.cat),file.countFilesBySearch(userInfo.getIdFacultate(),param.search,param.search_in,param.cat),param.p,30,2)}
                </c:when>
            </c:choose>

            <br/>
            <b>Disclaimer</b>
            <p>None of the files shown here are actually hosted on this server. The links are provided solely by this site's users. The administrator of this site cannot be held responsible for what its users post, or any other actions of its users.
                You may not use this site to distribute or download any material when you do not have the legal rights to do so. It is your own responsibility to adhere to these terms.</p>
            <br/>
        </td>
    </tr>

</table>
</form>

<%@ include file="structure/footer.jsp" %>
</body>
</html>
