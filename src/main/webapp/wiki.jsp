<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%@ include file="structure/meta.jsp" %>
    <title>Wiki</title>
    <%@ include file="structure/header.jsp" %>
</head>
<body>
<%@ include file="structure/statusbar.jsp" %>


<table class="black" style="margin-top: 8pt; width: 570pt">
    <tr>
        <td><br/>

            <fieldset style='background-color: #2c2c2c; margin:auto; width: 85%; text-align: left; border: solid 1px #62635f'>
                <legend><b>Reguli generale</b></legend><br/>
                <ul>
                    <li>Respecta toti studentii si userii acestei comunitati.</li>
                    <li>Site-ul este destintat studentilor,va rugam sa nu va faceti cont daca momentan nu sunteti in postura de student.</li>
                    <li>Falsificarea carnetelor/actelor doveditoare care atesta ca sunteti student este interzisa.</li>
                    <li>Intrarea in posesie a mai multor conturi pe acest site este interzisa.</li>
                    <li>Utilizarea comunitatii in alt scop poate duce la banarea tuturor utilizatorilor din acea grupa/serie/etc.</li>
                    <li>Insistam ca datele personale sa fie cele reale (acestea vor putea fi vazute decat de administratori).</li>
                </ul>
            </fieldset><br/>

            <fieldset style='background-color: #2c2c2c; margin:auto; width: 85%; text-align: left; border: solid 1px #62635f'>
                <legend><b>STN Features</b></legend>
                    <br/><br/>
                <table class="black" border="1" align='center' style="border-collapse: collapse;">
                    <tbody>
                    <tr>
                        <td class="row"><b>Feature</b></td>
                        <td class="row"><b>Status</b></td>
                    </tr>
                    <tr>
                        <td class="row">Login</td>
                        <td class="row" style="color: green">Enabled</td>
                    </tr>
                    <tr>
                        <td class="row">Register</td>
                        <td class="row" style="color: green">Enabled</td>
                    </tr>
                    <tr>
                        <td class="row">Recover Password</td>
                        <td class="row" style="color: green">Enabled</td>
                    </tr>
                    <tr>
                        <td class="row">Remember Me</td>
                        <td class="row" style="color: yellow">WIP</td>
                    </tr>
                    <tr>
                        <td class="row">School Module</td>
                        <td class="row" style="color: red">TBD</td>
                    </tr>
                    <tr>
                        <td class="row">Forum</td>
                        <td class="row" style="color: red">TBD</td>
                    </tr>
                    <tr>
                        <td class="row">Userdetails</td>
                        <td class="row" style="color: red">TBD</td>
                    </tr>
                    </tbody>
                </table>
                <br/>
                <p>Site version : 0.0.97</p>
                <br/>
            </fieldset><br/>

        </td>
    </tr>

</table>

<%@ include file="structure/footer.jsp" %>
</body>
</html>
