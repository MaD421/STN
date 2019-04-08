<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="css/util.css">
    <link rel="stylesheet" type="text/css" href="css/orar.css">
    <!--===============================================================================================-->
    <%@ include file="structure/meta.jsp" %>
    <%@ include file="structure/header_orar.jsp" %>
    <%@ include file="structure/beans.jsp" %>

    <jsp:useBean id="notes" class="com.stn.helpers.OrarHelper"/>
    <c:set var="note" value="${notes.getSchool(param.id,sessionScope.userId)}"/>
    <c:set var="ora" value="${notes.getOra(param.id,notes.getOrar(userInfo.getIdGrupa()))}"/>
    <c:if test="${note.getId()>0}">
        <title>Edit ${ora.getName()}</title>
    </c:if>
</head>
<body>


<%@ include file="structure/statusbar.jsp" %>

<div class="container-orar">
    ${user.verifyAcces(pageContext.request,pageContext.response)}
    <c:if test="${note.getId()>0}">

        <b style="color: #2db300;">${sessionScope.error}</b>

        <a style="display:block; margin: auto;" href="javascript:void(0);" onclick="return deleteOra(${ora.getId()})" class="btn btn-lg btn-danger">Delete!</a>
        <br>
        <div class="limiter">
            <div class="container-table100">
                <div class="wrap-table100">
                    <div class="table100 ver2 m-b-0">
                        <table data-vertable="ver2">
                            <thead>
                                <tr class="row100 head">
                                    <th class="column100 column1" data-column="column1">Materie</th>
                                    <th class="column100 column2" data-column="column2">Profesor</th>
                                    <th class="column100 column3" data-column="column3">Interval</th>
                                    <th class="column100 column4" data-column="column4">Tip</th>
                                    <th class="column100 column5" data-column="column5">Grupa</th>
                                    <th class="column100 column6" data-column="column6">Sala</th>
                                    <th class="column100 column7" data-column="column7">Zi</th>
                                    <th class="column100 column8" data-column="column8">Saptamana</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="row100" id="luni">
                                    <td class="column100 column1" data-column="column1" style="background: none; !important; color: #808080;">${ora.getName()}</td>
                                    <td class="column100 column2" data-column="column2">${ora.getNume_prof()}</td>
                                    <td class="column100 column3" data-column="column3">${ora.getDurata()}</td>
                                    <td class="column100 column4" data-column="column4">${ora.getTip_act()}</td>
                                    <td class="column100 column5" data-column="column5">
                                        <c:choose>
                                            <c:when test="${ora.getSgr()==0}">
                                                Toata grupa
                                            </c:when>
                                            <c:otherwise>
                                                ${ora.getSgr()}
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="column100 column6" data-column="column6">${ora.getSala()}</td>
                                    <td class="column100 column7" data-column="column7">${ora.getZi()}</td>
                                    <td class="column100 column8" data-column="column8">${ora.getSapt()}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>


        <form action="/AddNotes" method="post">
            <input type="hidden" name="name" value="${ora.getName()}">
            <input type="hidden" name="id_ora" value="${param.id}">
            <input type="hidden" name="id_user" value="${userInfo.getId()}">
            <br>
            <div class="form-group">
                <label for="teme"><b style="font-size: 20px;">Tema:</b></label>
                <textarea class="form-control" name="teme" rows="5" id="teme">${note.getTema()}</textarea>
            </div>
            <div class="form-group">
                <label for="examen"><b style="font-size: 20px;">Examen:</b></label>
                <textarea class="form-control" name="examen" rows="5" id="examen">${note.getExamen()}</textarea>
            </div>

            <div class="form-group">
                <label for="nota"><b style="font-size: 20px;">Nota:</b></label>
                <select class="form-control" id="nota" name="nota">
                    <c:forEach var="i" begin="0" end="10" step="1">
                        <c:if test="${note.getNota()==i||i==0}">
                            <option selected>${i}</option>
                        </c:if>
                        <c:if test="${note.getNota()!=i&&i!=0}">
                            <option>${i}</option>
                        </c:if>
                    </c:forEach>
                </select>
            </div>
            <input type="submit" value="Save" class="btn btn-info">
        </form>
    </c:if>
    <c:remove var="error" scope="session"/>

    <%@ include file="structure/footer.jsp" %>
</div>

<!--===============================================================================================-->
<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/bootstrap/js/popper.js"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
<script src="js/orar.js"></script>
</body>

</html>
