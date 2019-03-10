<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%@ include file="structure/meta.jsp" %>
    <title>Advanced Search</title>
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
                        <p>Acest motor de cautare este construit special pentru a cauta informatii pe acest site.</p>
                        <p>In cazul in care informatiile nu sunt gasite(sau nu sunt suficiente),se vor adauga si rezultate din
                            <font style="color: #2e7cf7">G</font><font style="color: red">o</font><font style="color: yellow">o</font><font style="color: #2e7cf7">g</font><font style="color: #16c942">l</font><font style="color: red">e</font>.</p>
                        <input type="hidden" name="p" value="1">
                        <input type="text" name="search" style="width: 600px;">
                        <br/><br/>
                        <input type="submit" value="Search!" disabled>
                        </form>
                        <br/><br/>
                    </td>
                </tr>
            </table>
            <br/><br/>
        </td>
    </tr>

</table>

<%@ include file="structure/footer.jsp" %>
</body>
</html>
