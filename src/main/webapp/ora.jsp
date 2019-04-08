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
    <title>Adaugare Ora</title>
    <%@ include file="structure/header_orar.jsp" %>
    <script>
        window.onload = function () {
            var agr = document.getElementById("selector");
            agr.onchange = function () {
                var elem = document.getElementById("g");
                var elem2=elem.getElementsByTagName("select")
                if (agr.value != "Curs") {
                    elem.style.display = "block";
                    elem2[0].selectedIndex = "1";
                }
                else {
                    elem.style.display = "none";
                    elem2[0].selectedIndex = "0";
                }
            }
        }
    </script>
    <style>

    </style>
</head>
<body>
<%@ include file="structure/statusbar.jsp" %>

<%@ include file="structure/beans.jsp" %>
${user.verifyAcces(pageContext.request,pageContext.response)}

    <c:set var="grupa" value='${user.getUserInfo(sessionScope.userId)}'/>
    <c:if test="${grupa.getId() > 0}">
        <div class="container-orar">
            ${sessionScope.error}
            <form action="AddOra" method="post">
                <div class="float-right"><b style="font-size: 20px;">Grupa ${grupa.getGrupa()}</b></div>
                <div class="form-group">
                    <label for="nume"><b style="font-size: 20px;">Nume materie:</b></label>
                    <input type="text" class="form-control" placeholder="Numele materiei" id="nume" name="nume_m" value="${sessionScope.nume_m}">
                </div>
                <div class="form-group">
                    <label for="durata"><b style="font-size: 20px;">Durata:</b></label>
                    <select class="form-control" id="durata" name="durata_select">
                        <option selected>none</option>
                        <option>08:00-10:00</option>
                        <option>10:00-12:00</option>
                        <option>12:00-14:00</option>
                        <option>14:00-16:00</option>
                        <option>16:00-18:00</option>
                        <option>18:00-20:00</option>
                    </select>
                </div>

                <input type="hidden" id="durata_hidden" name="durata" value="${sessionScope.durata}">

                <div class="form-group">
                    <label for="selector"><b style="font-size: 20px;">Durata:</b></label>
                    <select class="form-control" name="tip" id="selector" value="${sessionScope.tip}">
                        <option selected>Curs</option>
                        <option>Seminar</option>
                        <option>Laborator</option>
                    </select>
                </div>

                <div id="g" style="display: none;">
                    <div class="form-group">
                        <label for="semig"><b style="font-size: 20px;">Semigrupa:</b></label>
                        <select class="form-control" name="semig" id="semig" value="${sessionScope.semig}">
                            <option selected value="0">toti</option>
                            <option>1</option>
                            <option>2</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label for="sala"><b style="font-size: 20px;">Sala:</b></label>
                    <input type="text" class="form-control" placeholder="Sala" id="sala" name="sala" value="${sessionScope.sala}">
                </div>

                <div class="form-group">
                    <label for="nume_p"><b style="font-size: 20px;">Nume profesor:</b></label>
                    <input type="text" class="form-control" placeholder="Nume profesor" id="nume_p" name="nume_p" value="${sessionScope.nume_p}">
                </div>

                <div class="form-group">
                    <label for="zi"><b style="font-size: 20px;">Zi:</b></label>
                    <select class="form-control" name="zi" id="zi" value="${sessionScope.zi}">
                        <option selected>1.Luni</option>
                        <option>2.Marti</option>
                        <option>3.Miercuri</option>
                        <option>4.Joi</option>
                        <option>5.Vineri</option>
                        <option>6.Sambata</option>
                        <option>7.Duminica</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="sapt"><b style="font-size: 20px;">Saptamana:</b></label>
                    <select class="form-control" name="sapt" id="sapt" value="${sessionScope.sapt}">
                        <option selected>Toate</option>
                        <option>Para</option>
                        <option>Impara</option>
                    </select>
                </div>


                <input type="hidden" name="id_gr" value="${grupa.getGrupa()}"/>
                <input type="hidden" name="id_user" value="${grupa.getId()}" />
                <input type="submit" value="Adauga" class="btn btn-info">
            </form>
        </div>
    </c:if>
<c:remove var="error" scope="session" />
<c:remove var="id_gr" scope="session" />
<c:remove var="id_user" scope="session"/>
<%@ include file="structure/footer.jsp" %>
<!--===============================================================================================-->
<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/bootstrap/js/popper.js"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
<script>
    $("#durata").change(function() {
        $("#durata_hidden").val(this.value);
    });
</script>
</body>
</html>
