<%@ page import="java.io.IOException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%@ include file="structure/meta.jsp" %>
    <title>Image to Text</title>
    <%@ include file="structure/header.jsp" %>
</head>
<body>
<%@ include file="structure/beans.jsp" %>
${user.verifyAcces(pageContext.request,pageContext.response)}
<%@ include file="structure/statusbar.jsp" %>

<table class="black" style="margin-top: 5pt; width: 570pt">

    <tr>
        <td class="center">
            <h1 style="color: white">
                Advanced Search
            </h1>
        </td>
    </tr>

    <tr>
        <td>
            <table align="center" style="background-color: #353535;border-style: solid; border-width: 1px;border-color: #62635f">
                <tr>
                    <td class="center" style="padding-top: 5pt;padding-left: 8pt;padding-right: 8pt">
                        <div class="text-center">
                            <form class="form" action="/ParseImage" method="post" id="imgFile-form" enctype="multipart/form-data">
                                <input type="file" name="imgFile" multiple="multiple" class="text-center center-block file-upload">
                                <input type="submit" id="imgFile-submit" value="Parse Image"/>
                            </form>

                        </div>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center; padding-top: 2pt;padding-bottom: 2pt">
                        <b style="color: red; display: inline"> ${sessionScope.error} </b>
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