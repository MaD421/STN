<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="structure/meta.jsp" %>
<title>Orar grupa</title>
<link rel="stylesheet" href="/css/orar.css">
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
<%@ include file="structure/header.jsp" %>

<script src="/js/orar.js"></script>
</head>

<body>
<%@ include file="structure/beans.jsp" %>
${user.verifyAcces(pageContext.request,pageContext.response)}
<%@ include file="structure/statusbar.jsp" %>

<jsp:useBean id="userdetails" class="com.stn.pojo.User"/>
<jsp:useBean id="orar2" class="com.stn.helpers.OrarHelper"/>

<c:set var="userdetails" value='${user.getUserInfo(sessionScope.userId)}'/>
<c:if test="${userdetails.getId() > 0}">

<div class="container-orar">

    <div class="limiter">
        <div class="container-table100">
            <div class="wrap-table100">
                <div class="table100 ver2 m-b-0">
                    <table data-vertable="ver2">
                        <thead>
                            <tr class="row100 head">
                                <th class="column100 column1" data-column="column1">
                                    <a href="ora.jsp" class="btn btn-lg btn-dark">+</a>
                                </th>
                                <th class="column100 column2" data-column="column2">08:00-10:00</th>
                                <th class="column100 column3" data-column="column3">10:00-12:00</th>
                                <th class="column100 column4" data-column="column4">12:00-14:00</th>
                                <th class="column100 column5" data-column="column5">14:00-16:00</th>
                                <th class="column100 column6" data-column="column6">16:00-18:00</th>
                                <th class="column100 column7" data-column="column7">18:00-20:00</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:if test="${userdetails.getUserClass() == 2||userdetails.getUserClass() ==6||userdetails.getUserClass()==7}">
                            <tr class="row100" id="luni">
                                <td class="column100 column1" data-column="column1">Luni</td>
                                <td class="column100 column2" data-column="column2">
                                    <div class="ora_div" id="ora_1,2">-</div>
                                </td>
                                <td class="column100 column3" data-column="column3">
                                    <div class="ora_div" id="ora_1,3">-</div>
                                </td>
                                <td class="column100 column4" data-column="column4">
                                    <div class="ora_div" id="ora_1,4">-</div>
                                </td>
                                <td class="column100 column5" data-column="column5">
                                    <div class="ora_div" id="ora_1,5">-</div>
                                </td>
                                <td class="column100 column6" data-column="column6">
                                    <div class="ora_div" id="ora_1,6">-</div>
                                </td>
                                <td class="column100 column7" data-column="column7">
                                    <div class="ora_div" id="ora_1,7">-</div>
                                </td>

                                <c:set var="orar" value='${orar2.getOrar(userdetails.getIdGrupa())}'/>
                                <c:forEach items="${orar}" var="ore" varStatus="contor">
                                    <script>
                                        var obj = $("<div></div>");
                                        obj.addClass("ora_div");
                                        obj.html("${ore.getName()}");
                                        obj.click(function() {
                                            addNote("${ore.getId()}","${sessionScope.userId}");
                                        });
                                        <%--obj.data("durata", "${ore.getDurata()}");--%>
                                        <%--obj.data("id", "${ore.getId()}");--%>
                                        <%--obj.data("sala", "${ore.getSala()}");--%>
                                        <%--obj.data("sgr", "${ore.getSgr()}");--%>
                                        <%--obj.data("sapt", "${ore.getSapt()}");--%>
                                        <%--obj.data("prof", "${ore.getNume_prof()}");--%>
                                        <%--obj.data("zi", "${ore.getZi()}");--%>
                                        <%--obj.data("idgr", "${ore.getId_grupa()}");--%>
                                        <%--obj.data("tip", "${ore.getTip_act()}");--%>
                                    </script>
                                    <c:if test="${ore.getZi()=='1.Luni' }">
                                        <c:if test="${ore.getDurata()=='08:00-10:00'}">
                                            <script type="text/javascript">
                                                obj.id = "ora_1,2";
                                                addOra(1,2, obj);
                                            </script>
                                        </c:if>
                                        <c:if test="${ore.getDurata()=='10:00-12:00'}">
                                            <script type="text/javascript">
                                                obj.id = "ora_1,3";
                                                addOra(1,3, obj);
                                            </script>
                                        </c:if>
                                        <c:if test="${ore.getDurata()=='12:00-14:00'}">
                                            <script type="text/javascript">
                                                obj.id = "ora_1,4";
                                                addOra(1,4, obj);
                                            </script>
                                        </c:if>
                                        <c:if test="${ore.getDurata()=='14:00-16:00'}">
                                            <script type="text/javascript">
                                                obj.id = "ora_1,5";
                                                addOra(1,5, obj);
                                            </script>
                                        </c:if>
                                        <c:if test="${ore.getDurata()=='16:00-18:00'}">
                                            <script type="text/javascript">
                                                obj.id = "ora_1,6";
                                                addOra(1,6, obj);
                                            </script>
                                        </c:if>
                                        <c:if test="${ore.getDurata()=='18:00-20:00'}">
                                            <script type="text/javascript">
                                                obj.id = "ora_1,7";
                                                addOra(1,7, obj);
                                            </script>
                                        </c:if>
                                    </c:if>
                                </c:forEach>
                            </tr>
                            <tr class="row100" id="marti">
                                <td class="column100 column1" data-column="column1">Marti</td>
                                <td class="column100 column2" data-column="column2">
                                    <div class="ora_div" id="ora_2,2">-</div>
                                </td>
                                <td class="column100 column3" data-column="column3">
                                    <div class="ora_div" id="ora_2,3">-</div>
                                </td>
                                <td class="column100 column4" data-column="column4">
                                    <div class="ora_div" id="ora_2,4">-</div>
                                </td>
                                <td class="column100 column5" data-column="column5">
                                    <div class="ora_div" id="ora_2,5">-</div>
                                </td>
                                <td class="column100 column6" data-column="column6">
                                    <div class="ora_div" id="ora_2,6">-</div>
                                </td>
                                <td class="column100 column7" data-column="column7">
                                    <div class="ora_div" id="ora_2,7">-</div>
                                </td>

                                <c:set var="orar" value='${orar2.getOrar(userdetails.getIdGrupa())}'/>
                                <c:forEach items="${orar}" var="ore" varStatus="contor">
                                    <script>
                                        var obj = $("<div></div>");
                                        obj.addClass("ora_div");
                                        obj.html("${ore.getName()}");
                                        obj.click(function() {
                                            addNote("${ore.getId()}","${sessionScope.userId}");
                                        });
                                        <%--obj.data("durata", "${ore.getDurata()}");--%>
                                        <%--obj.data("id", "${ore.getId()}");--%>
                                        <%--obj.data("sala", "${ore.getSala()}");--%>
                                        <%--obj.data("sgr", "${ore.getSgr()}");--%>
                                        <%--obj.data("sapt", "${ore.getSapt()}");--%>
                                        <%--obj.data("prof", "${ore.getNume_prof()}");--%>
                                        <%--obj.data("zi", "${ore.getZi()}");--%>
                                        <%--obj.data("idgr", "${ore.getId_grupa()}");--%>
                                        <%--obj.data("tip", "${ore.getTip_act()}");--%>
                                    </script>
                                    <c:if test="${ore.getZi()=='2.Marti' }">
                                        <c:if test="${ore.getDurata()=='08:00-10:00'}">
                                            <script type="text/javascript">
                                                obj.id = "ora_2,2";
                                                addOra(2,2, obj);
                                            </script>
                                        </c:if>
                                        <c:if test="${ore.getDurata()=='10:00-12:00'}">
                                            <script type="text/javascript">
                                                obj.id = "ora_2,3";
                                                addOra(2,3, obj);
                                            </script>
                                        </c:if>
                                        <c:if test="${ore.getDurata()=='12:00-14:00'}">
                                            <script type="text/javascript">
                                                obj.id = "ora_2,4";
                                                addOra(2,4, obj);
                                            </script>
                                        </c:if>
                                        <c:if test="${ore.getDurata()=='14:00-16:00'}">
                                            <script type="text/javascript">
                                                obj.id = "ora_2,5";
                                                addOra(2,5, obj);
                                            </script>
                                        </c:if>
                                        <c:if test="${ore.getDurata()=='16:00-18:00'}">
                                            <script type="text/javascript">
                                                obj.id = "ora_2,6";
                                                addOra(2,6, obj);
                                            </script>
                                        </c:if>
                                        <c:if test="${ore.getDurata()=='18:00-20:00'}">
                                            <script type="text/javascript">
                                                obj.id = "ora_2,7";
                                                addOra(2,7, obj);
                                            </script>
                                        </c:if>
                                    </c:if>
                                </c:forEach>
                            </tr>
                            <tr class="row100" id="miercuri">
                                <td class="column100 column1" data-column="column1">Miercuri</td>
                                <td class="column100 column2" data-column="column2">
                                    <div class="ora_div" id="ora_3,2">-</div>
                                </td>
                                <td class="column100 column3" data-column="column3">
                                    <div class="ora_div" id="ora_3,3">-</div>
                                </td>
                                <td class="column100 column4" data-column="column4">
                                    <div class="ora_div" id="ora_3,4">-</div>
                                </td>
                                <td class="column100 column5" data-column="column5">
                                    <div class="ora_div" id="ora_3,5">-</div>
                                </td>
                                <td class="column100 column6" data-column="column6">
                                    <div class="ora_div" id="ora_3,6">-</div>
                                </td>
                                <td class="column100 column7" data-column="column7">
                                    <div class="ora_div" id="ora_3,7">-</div>
                                </td>

                                <c:set var="orar" value='${orar2.getOrar(userdetails.getIdGrupa())}'/>
                                <c:forEach items="${orar}" var="ore" varStatus="contor">
                                    <script>
                                        var obj = $("<div></div>");
                                        obj.addClass("ora_div");
                                        obj.html("${ore.getName()}");
                                        obj.click(function() {
                                            addNote("${ore.getId()}","${sessionScope.userId}");
                                        });
                                        <%--obj.data("durata", "${ore.getDurata()}");--%>
                                        <%--obj.data("id", "${ore.getId()}");--%>
                                        <%--obj.data("sala", "${ore.getSala()}");--%>
                                        <%--obj.data("sgr", "${ore.getSgr()}");--%>
                                        <%--obj.data("sapt", "${ore.getSapt()}");--%>
                                        <%--obj.data("prof", "${ore.getNume_prof()}");--%>
                                        <%--obj.data("zi", "${ore.getZi()}");--%>
                                        <%--obj.data("idgr", "${ore.getId_grupa()}");--%>
                                        <%--obj.data("tip", "${ore.getTip_act()}");--%>
                                    </script>
                                    <c:if test="${ore.getZi()=='3.Miercuri' }">
                                        <c:if test="${ore.getDurata()=='08:00-10:00'}">
                                            <script type="text/javascript">
                                                obj.id = "ora_3,2";
                                                addOra(3,2, obj);
                                            </script>
                                        </c:if>
                                        <c:if test="${ore.getDurata()=='10:00-12:00'}">
                                            <script type="text/javascript">
                                                obj.id = "ora_3,3";
                                                addOra(3,3, obj);
                                            </script>
                                        </c:if>
                                        <c:if test="${ore.getDurata()=='12:00-14:00'}">
                                            <script type="text/javascript">
                                                obj.id = "ora_3,4";
                                                addOra(3,4, obj);
                                            </script>
                                        </c:if>
                                        <c:if test="${ore.getDurata()=='14:00-16:00'}">
                                            <script type="text/javascript">
                                                obj.id = "ora_3,5";
                                                addOra(3,5, obj);
                                            </script>
                                        </c:if>
                                        <c:if test="${ore.getDurata()=='16:00-18:00'}">
                                            <script type="text/javascript">
                                                obj.id = "ora_3,6";
                                                addOra(3,6, obj);
                                            </script>
                                        </c:if>
                                        <c:if test="${ore.getDurata()=='18:00-20:00'}">
                                            <script type="text/javascript">
                                                obj.id = "ora_3,7";
                                                addOra(3,7, obj);
                                            </script>
                                        </c:if>
                                    </c:if>
                                </c:forEach>
                            </tr>
                            <tr class="row100" id="joi">
                                <td class="column100 column1" data-column="column1">Joi</td>
                                <td class="column100 column2" data-column="column2">
                                    <div class="ora_div" id="ora_4,2">-</div>
                                </td>
                                <td class="column100 column3" data-column="column3">
                                    <div class="ora_div" id="ora_4,3">-</div>
                                </td>
                                <td class="column100 column4" data-column="column4">
                                    <div class="ora_div" id="ora_4,4">-</div>
                                </td>
                                <td class="column100 column5" data-column="column5">
                                    <div class="ora_div" id="ora_4,5">-</div>
                                </td>
                                <td class="column100 column6" data-column="column6">
                                    <div class="ora_div" id="ora_4,6">-</div>
                                </td>
                                <td class="column100 column7" data-column="column7">
                                    <div class="ora_div" id="ora_4,7">-</div>
                                </td>

                                <c:set var="orar" value='${orar2.getOrar(userdetails.getIdGrupa())}'/>
                                <c:forEach items="${orar}" var="ore" varStatus="contor">
                                    <script>
                                        var obj = $("<div></div>");
                                        obj.addClass("ora_div");
                                        obj.html("${ore.getName()}");
                                        obj.click(function() {
                                            addNote("${ore.getId()}","${sessionScope.userId}");
                                        });
                                        <%--obj.data("durata", "${ore.getDurata()}");--%>
                                        <%--obj.data("id", "${ore.getId()}");--%>
                                        <%--obj.data("sala", "${ore.getSala()}");--%>
                                        <%--obj.data("sgr", "${ore.getSgr()}");--%>
                                        <%--obj.data("sapt", "${ore.getSapt()}");--%>
                                        <%--obj.data("prof", "${ore.getNume_prof()}");--%>
                                        <%--obj.data("zi", "${ore.getZi()}");--%>
                                        <%--obj.data("idgr", "${ore.getId_grupa()}");--%>
                                        <%--obj.data("tip", "${ore.getTip_act()}");--%>
                                    </script>
                                    <c:if test="${ore.getZi()=='4.Joi' }">
                                        <c:if test="${ore.getDurata()=='08:00-10:00'}">
                                            <script type="text/javascript">
                                                obj.id = "ora_4,2";
                                                addOra(4,2, obj);
                                            </script>
                                        </c:if>
                                        <c:if test="${ore.getDurata()=='10:00-12:00'}">
                                            <script type="text/javascript">
                                                obj.id = "ora_4,3";
                                                addOra(4,3, obj);
                                            </script>
                                        </c:if>
                                        <c:if test="${ore.getDurata()=='12:00-14:00'}">
                                            <script type="text/javascript">
                                                obj.id = "ora_4,4";
                                                addOra(4,4, obj);
                                            </script>
                                        </c:if>
                                        <c:if test="${ore.getDurata()=='14:00-16:00'}">
                                            <script type="text/javascript">
                                                obj.id = "ora_4,5";
                                                addOra(4,5, obj);
                                            </script>
                                        </c:if>
                                        <c:if test="${ore.getDurata()=='16:00-18:00'}">
                                            <script type="text/javascript">
                                                obj.id = "ora_4,6";
                                                addOra(4,6, obj);
                                            </script>
                                        </c:if>
                                        <c:if test="${ore.getDurata()=='18:00-20:00'}">
                                            <script type="text/javascript">
                                                obj.id = "ora_4,7";
                                                addOra(4,7, obj);
                                            </script>
                                        </c:if>
                                    </c:if>
                                </c:forEach>
                            </tr>
                            <tr class="row100" id="vineri">
                                <td class="column100 column1" data-column="column1">Vineri</td>
                                <td class="column100 column2" data-column="column2">
                                    <div class="ora_div" id="ora_5,2">-</div>
                                </td>
                                <td class="column100 column3" data-column="column3">
                                    <div class="ora_div" id="ora_5,3">-</div>
                                </td>
                                <td class="column100 column4" data-column="column4">
                                    <div class="ora_div" id="ora_5,4">-</div>
                                </td>
                                <td class="column100 column5" data-column="column5">
                                    <div class="ora_div" id="ora_5,5">-</div>
                                </td>
                                <td class="column100 column6" data-column="column6">
                                    <div class="ora_div" id="ora_5,6">-</div>
                                </td>
                                <td class="column100 column7" data-column="column7">
                                    <div class="ora_div" id="ora_5,7">-</div>
                                </td>

                                <c:set var="orar" value='${orar2.getOrar(userdetails.getIdGrupa())}'/>
                                <c:forEach items="${orar}" var="ore" varStatus="contor">
                                    <script>
                                        var obj = $("<div></div>");
                                        obj.addClass("ora_div");
                                        obj.html("${ore.getName()}");
                                        obj.click(function() {
                                            addNote("${ore.getId()}","${sessionScope.userId}");
                                        });
                                        <%--obj.data("durata", "${ore.getDurata()}");--%>
                                        <%--obj.data("id", "${ore.getId()}");--%>
                                        <%--obj.data("sala", "${ore.getSala()}");--%>
                                        <%--obj.data("sgr", "${ore.getSgr()}");--%>
                                        <%--obj.data("sapt", "${ore.getSapt()}");--%>
                                        <%--obj.data("prof", "${ore.getNume_prof()}");--%>
                                        <%--obj.data("zi", "${ore.getZi()}");--%>
                                        <%--obj.data("idgr", "${ore.getId_grupa()}");--%>
                                        <%--obj.data("tip", "${ore.getTip_act()}");--%>
                                    </script>
                                    <c:if test="${ore.getZi()=='5.Vineri' }">
                                        <c:if test="${ore.getDurata()=='08:00-10:00'}">
                                            <script type="text/javascript">
                                                obj.id = "ora_5,2";
                                                addOra(5,2, obj);
                                            </script>
                                        </c:if>
                                        <c:if test="${ore.getDurata()=='10:00-12:00'}">
                                            <script type="text/javascript">
                                                obj.id = "ora_5,3";
                                                addOra(5,3, obj);
                                            </script>
                                        </c:if>
                                        <c:if test="${ore.getDurata()=='12:00-14:00'}">
                                            <script type="text/javascript">
                                                obj.id = "ora_5,4";
                                                addOra(5,4, obj);
                                            </script>
                                        </c:if>
                                        <c:if test="${ore.getDurata()=='14:00-16:00'}">
                                            <script type="text/javascript">
                                                obj.id = "ora_5,5";
                                                addOra(5,5, obj);
                                            </script>
                                        </c:if>
                                        <c:if test="${ore.getDurata()=='16:00-18:00'}">
                                            <script type="text/javascript">
                                                obj.id = "ora_5,6";
                                                addOra(5,6, obj);
                                            </script>
                                        </c:if>
                                        <c:if test="${ore.getDurata()=='18:00-20:00'}">
                                            <script type="text/javascript">
                                                obj.id = "ora_5,7";
                                                addOra(5,7, obj);
                                            </script>
                                        </c:if>
                                    </c:if>
                                </c:forEach>
                            </tr>
                            <tr class="row100" id="sambata">
                                <td class="column100 column1" data-column="column1">Sambata</td>
                                <td class="column100 column2" data-column="column2">
                                    <div class="ora_div" id="ora_6,2">-</div>
                                </td>
                                <td class="column100 column3" data-column="column3">
                                    <div class="ora_div" id="ora_6,3">-</div>
                                </td>
                                <td class="column100 column4" data-column="column4">
                                    <div class="ora_div" id="ora_6,4">-</div>
                                </td>
                                <td class="column100 column5" data-column="column5">
                                    <div class="ora_div" id="ora_6,5">-</div>
                                </td>
                                <td class="column100 column6" data-column="column6">
                                    <div class="ora_div" id="ora_6,6">-</div>
                                </td>
                                <td class="column100 column7" data-column="column7">
                                    <div class="ora_div" id="ora_6,7">-</div>
                                </td>

                                <c:set var="orar" value='${orar2.getOrar(userdetails.getIdGrupa())}'/>
                                <c:forEach items="${orar}" var="ore" varStatus="contor">
                                    <script>
                                        var obj = $("<div></div>");
                                        obj.addClass("ora_div");
                                        obj.html("${ore.getName()}");
                                        obj.click(function() {
                                            addNote("${ore.getId()}","${sessionScope.userId}");
                                        });
                                        <%--obj.data("durata", "${ore.getDurata()}");--%>
                                        <%--obj.data("id", "${ore.getId()}");--%>
                                        <%--obj.data("sala", "${ore.getSala()}");--%>
                                        <%--obj.data("sgr", "${ore.getSgr()}");--%>
                                        <%--obj.data("sapt", "${ore.getSapt()}");--%>
                                        <%--obj.data("prof", "${ore.getNume_prof()}");--%>
                                        <%--obj.data("zi", "${ore.getZi()}");--%>
                                        <%--obj.data("idgr", "${ore.getId_grupa()}");--%>
                                        <%--obj.data("tip", "${ore.getTip_act()}");--%>
                                    </script>
                                    <c:if test="${ore.getZi()=='6.Sambata' }">
                                        <c:if test="${ore.getDurata()=='08:00-10:00'}">
                                            <script type="text/javascript">
                                                obj.id = "ora_6,2";
                                                addOra(6,2, obj);
                                            </script>
                                        </c:if>
                                        <c:if test="${ore.getDurata()=='10:00-12:00'}">
                                            <script type="text/javascript">
                                                obj.id = "ora_6,3";
                                                addOra(6,3, obj);
                                            </script>
                                        </c:if>
                                        <c:if test="${ore.getDurata()=='12:00-14:00'}">
                                            <script type="text/javascript">
                                                obj.id = "ora_6,4";
                                                addOra(6,4, obj);
                                            </script>
                                        </c:if>
                                        <c:if test="${ore.getDurata()=='14:00-16:00'}">
                                            <script type="text/javascript">
                                                obj.id = "ora_6,5";
                                                addOra(6,5, obj);
                                            </script>
                                        </c:if>
                                        <c:if test="${ore.getDurata()=='16:00-18:00'}">
                                            <script type="text/javascript">
                                                obj.id = "ora_6,6";
                                                addOra(6,6, obj);
                                            </script>
                                        </c:if>
                                        <c:if test="${ore.getDurata()=='18:00-20:00'}">
                                            <script type="text/javascript">
                                                obj.id = "ora_6,7";
                                                addOra(6,7, obj);
                                            </script>
                                        </c:if>
                                    </c:if>
                                </c:forEach>
                            </tr>
                            <tr class="row100" id="duminica">
                                <td class="column100 column1" data-column="column1">Duminica</td>
                                <td class="column100 column2" data-column="column2">
                                    <div class="ora_div" id="ora_7,2">-</div>
                                </td>
                                <td class="column100 column3" data-column="column3">
                                    <div class="ora_div" id="ora_7,3">-</div>
                                </td>
                                <td class="column100 column4" data-column="column4">
                                    <div class="ora_div" id="ora_7,4">-</div>
                                </td>
                                <td class="column100 column5" data-column="column5">
                                    <div class="ora_div" id="ora_7,5">-</div>
                                </td>
                                <td class="column100 column6" data-column="column6">
                                    <div class="ora_div" id="ora_7,6">-</div>
                                </td>
                                <td class="column100 column7" data-column="column7">
                                    <div class="ora_div" id="ora_7,7">-</div>
                                </td>

                                <c:set var="orar" value='${orar2.getOrar(userdetails.getIdGrupa())}'/>
                                <c:forEach items="${orar}" var="ore" varStatus="contor">
                                    <script>
                                        var obj = $("<div></div>");
                                        obj.addClass("ora_div");
                                        obj.html("${ore.getName()}");
                                        obj.click(function() {
                                            addNote("${ore.getId()}","${sessionScope.userId}");
                                        });
                                        <%--obj.data("durata", "${ore.getDurata()}");--%>
                                        <%--obj.data("id", "${ore.getId()}");--%>
                                        <%--obj.data("sala", "${ore.getSala()}");--%>
                                        <%--obj.data("sgr", "${ore.getSgr()}");--%>
                                        <%--obj.data("sapt", "${ore.getSapt()}");--%>
                                        <%--obj.data("prof", "${ore.getNume_prof()}");--%>
                                        <%--obj.data("zi", "${ore.getZi()}");--%>
                                        <%--obj.data("idgr", "${ore.getId_grupa()}");--%>
                                        <%--obj.data("tip", "${ore.getTip_act()}");--%>
                                    </script>
                                    <c:if test="${ore.getZi()=='7.Duminica' }">
                                        <c:if test="${ore.getDurata()=='08:00-10:00'}">
                                            <script type="text/javascript">
                                                obj.id = "ora_7,2";
                                                addOra(7,2, obj);
                                            </script>
                                        </c:if>
                                        <c:if test="${ore.getDurata()=='10:00-12:00'}">
                                            <script type="text/javascript">
                                                obj.id = "ora_7,3";
                                                addOra(7,3, obj);
                                            </script>
                                        </c:if>
                                        <c:if test="${ore.getDurata()=='12:00-14:00'}">
                                            <script type="text/javascript">
                                                obj.id = "ora_7,4";
                                                addOra(7,4, obj);
                                            </script>
                                        </c:if>
                                        <c:if test="${ore.getDurata()=='14:00-16:00'}">
                                            <script type="text/javascript">
                                                obj.id = "ora_7,5";
                                                addOra(7,5, obj);
                                            </script>
                                        </c:if>
                                        <c:if test="${ore.getDurata()=='16:00-18:00'}">
                                            <script type="text/javascript">
                                                obj.id = "ora_7,6";
                                                addOra(7,6, obj);
                                            </script>
                                        </c:if>
                                        <c:if test="${ore.getDurata()=='18:00-20:00'}">
                                            <script type="text/javascript">
                                                obj.id = "ora_7,7";
                                                addOra(7,7, obj);
                                            </script>
                                        </c:if>
                                    </c:if>
                                </c:forEach>
                            </tr>
                        </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>


</c:if>
<c:remove var="error" scope="session"/>
<%@ include file="structure/footer.jsp" %>
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