<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%@ include file="structure/meta.jsp" %>
    <title>BBCode Legend</title>
    <%@ include file="structure/header.jsp" %>
</head>
<body>
<%@ include file="structure/beans.jsp" %>
${user.verifyAcces(pageContext.request,pageContext.response)}
<%@ include file="structure/statusbar.jsp" %>

<table class="black" style="margin-top: 5pt; width: 570pt">

    <tr>
        <td class="center"><h1 style="color: ${user.classColor(userdetails.getUserClass())} ">BBCode Legend</h1>
        </td>
    </tr>

<tr>
    <td class="center">

        <table class="black" border="1" style="margin-top: 5pt; border-collapse: collapse;">

            <tr>
                <td class='row2' style="text-align: center;">[b]Random word.[/b]</td>
                <td class='row' style="text-align: center">${tool.formatText('[b]Random word.[/b]')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">[i]Random word.[/i]</td>
                <td class='row' style="text-align: center">${tool.formatText('[i]Random word.[/i]')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">[u]Random word.[/u]</td>
                <td class='row' style="text-align: center">${tool.formatText('[u]Random word.[/u]')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">[center]Random word.[/center]</td>
                <td class='row' style="text-align: center">${tool.formatText('[center]Random word.[/center]')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">[align=left]Random word.[/align]</td>
                <td class='row' style="text-align: center">${tool.formatText('[align=left]Random word.[/align]')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">[color=#54bbbb]Random word.[/color]</td>
                <td class='row' style="text-align: center">${tool.formatText('[color=#54bbbb]Random word.[/color]')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">[size=13]Random word.[/size]</td>
                <td class='row' style="text-align: center">${tool.formatText('[size=13]Random word.[/size]')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">[url]https://www.google.ro[/url]</td>
                <td class='row' style="text-align: center">${tool.formatText('[url]https://www.google.ro[/url]')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">[url=https://www.google.ro]Link Oficial Google[/url]</td>
                <td class='row' style="text-align: center">${tool.formatText('[url=https://www.google.ro]Link Oficial Google[/url]')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">[email]schoolingtheinternet@gmail.com[/email]</td>
                <td class='row' style="text-align: center">${tool.formatText('[email]schoolingtheinternet@gmail.com[/email]')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">[img]http://schoolingtheinter.net/img/profile.png[/img]</td>
                <td class='row' style="text-align: center">${tool.formatText('[img]http://schoolingtheinter.net/img/profile.png[/img]')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">[quote]Simple quote[/quote]</td>
                <td class='row' style="text-align: center">${tool.formatText('[quote]Simple quote[/quote]')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">[quote=Someone]User quote[/quote]</td>
                <td class='row' style="text-align: center">${tool.formatText('[quote=Someone]User quote[/quote]')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">[youtube]Vs3981DoINw[/youtube]</td>
                <td class='row' style="text-align: center">${tool.formatText('[youtube]Vs3981DoINw[/youtube]')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:)</td>
                <td class='row' style="text-align: center">${tool.formatText(':)')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:|</td>
                <td class='row' style="text-align: center">${tool.formatText(':|')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:(</td>
                <td class='row' style="text-align: center">${tool.formatText(':(')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:O</td>
                <td class='row' style="text-align: center">${tool.formatText(':O')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:D</td>
                <td class='row' style="text-align: center">${tool.formatText(':D')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:o)</td>
                <td class='row' style="text-align: center">${tool.formatText(':o)')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:-/</td>
                <td class='row' style="text-align: center">${tool.formatText(':-/')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">;)</td>
                <td class='row' style="text-align: center">${tool.formatText(';)')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:p</td>
                <td class='row' style="text-align: center">${tool.formatText(':p')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">'(</td>
                <td class='row' style="text-align: center"><img src='/img/smilies/cry.gif' class='smile'></td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:-(</td>
                <td class='row' style="text-align: center">${tool.formatText(':-(')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">8)</td>
                <td class='row' style="text-align: center">${tool.formatText('8)')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:king:</td>
                <td class='row' style="text-align: center">${tool.formatText(':king:')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:chef:</td>
                <td class='row' style="text-align: center">${tool.formatText(':chef:')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:flowers:</td>
                <td class='row' style="text-align: center">${tool.formatText(':flowers:')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:pope:</td>
                <td class='row' style="text-align: center">${tool.formatText(':pope:')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:angel:</td>
                <td class='row' style="text-align: center">${tool.formatText(':angel:')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:evil:</td>
                <td class='row' style="text-align: center">${tool.formatText(':evil:')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:alien:</td>
                <td class='row' style="text-align: center">${tool.formatText(':alien:')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:axe:</td>
                <td class='row' style="text-align: center">${tool.formatText(':axe:')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:cap:</td>
                <td class='row' style="text-align: center">${tool.formatText(':cap:')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:bike:</td>
                <td class='row' style="text-align: center">${tool.formatText(':bike:')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:rock:</td>
                <td class='row' style="text-align: center">${tool.formatText(':rock:')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:smartass:</td>
                <td class='row' style="text-align: center">${tool.formatText(':smartass:')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:clown:</td>
                <td class='row' style="text-align: center">${tool.formatText(':clown:')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:cigar:</td>
                <td class='row' style="text-align: center">${tool.formatText(':cigar:')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:crockett:</td>
                <td class='row' style="text-align: center">${tool.formatText(':crockett:')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:detective:</td>
                <td class='row' style="text-align: center">${tool.formatText(':detective:')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:cowboy:</td>
                <td class='row' style="text-align: center">${tool.formatText(':cowboy:')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:innocent:</td>
                <td class='row' style="text-align: center">${tool.formatText(':innocent:')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:oldtimer:</td>
                <td class='row' style="text-align: center">${tool.formatText(':oldtimer:')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:hmmm:</td>
                <td class='row' style="text-align: center">${tool.formatText(':hmmm:')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:book:</td>
                <td class='row' style="text-align: center">${tool.formatText(':book:')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:laugh:</td>
                <td class='row' style="text-align: center">${tool.formatText(':laugh:')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:clap:</td>
                <td class='row' style="text-align: center">${tool.formatText(':clap:')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:clap2:</td>
                <td class='row' style="text-align: center">${tool.formatText(':clap2:')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:hooray:</td>
                <td class='row' style="text-align: center">${tool.formatText(':hooray:')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:wall:</td>
                <td class='row' style="text-align: center">${tool.formatText(':wall:')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:judge:</td>
                <td class='row' style="text-align: center">${tool.formatText(':judge:')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:happy2:</td>
                <td class='row' style="text-align: center">${tool.formatText(':happy2:')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:cake:</td>
                <td class='row' style="text-align: center">${tool.formatText(':cake:')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:computer:</td>
                <td class='row' style="text-align: center">${tool.formatText(':computer:')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:hbd:</td>
                <td class='row' style="text-align: center">${tool.formatText(':hbd:')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:hi:</td>
                <td class='row' style="text-align: center">${tool.formatText(':hi:')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:horse:</td>
                <td class='row' style="text-align: center">${tool.formatText(':horse:')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:beer:</td>
                <td class='row' style="text-align: center">${tool.formatText(':beer:')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:gathering:</td>
                <td class='row' style="text-align: center">${tool.formatText(':gathering:')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:console:</td>
                <td class='row' style="text-align: center">${tool.formatText(':console:')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:beer2:</td>
                <td class='row' style="text-align: center">${tool.formatText(':beer2:')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:chair:</td>
                <td class='row' style="text-align: center">${tool.formatText(':chair:')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:drunk:</td>
                <td class='row' style="text-align: center">${tool.formatText(':drunk:')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:fishing:</td>
                <td class='row' style="text-align: center">${tool.formatText(':fishing:')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:hang:</td>
                <td class='row' style="text-align: center">${tool.formatText(':hang:')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:mml:</td>
                <td class='row' style="text-align: center">${tool.formatText(':mml:')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:pepsi:</td>
                <td class='row' style="text-align: center">${tool.formatText(':pepsi:')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:rant:</td>
                <td class='row' style="text-align: center">${tool.formatText(':rant:')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:rb:</td>
                <td class='row' style="text-align: center">${tool.formatText(':rb:')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:rip:</td>
                <td class='row' style="text-align: center">${tool.formatText(':rip:')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:rofl:</td>
                <td class='row' style="text-align: center">${tool.formatText(':rofl:')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:shoot2:</td>
                <td class='row' style="text-align: center">${tool.formatText(':shoot2:')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:kissing:</td>
                <td class='row' style="text-align: center">${tool.formatText(':kissing:')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:dancing:</td>
                <td class='row' style="text-align: center">${tool.formatText(':dancing:')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:chop:</td>
                <td class='row' style="text-align: center">${tool.formatText(':chop:')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:soldiers:</td>
                <td class='row' style="text-align: center">${tool.formatText(':soldiers:')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:strongbench:</td>
                <td class='row' style="text-align: center">${tool.formatText(':strongbench:')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:trampoline:</td>
                <td class='row' style="text-align: center">${tool.formatText(':trampoline:')}</td>
            </tr>
            <tr>
                <td class='row2' style="text-align: center;">:mbounce:</td>
                <td class='row' style="text-align: center">${tool.formatText(':mbounce:')}</td>
            </tr>
        </table>

    <br/><br/>
    </td>

</tr>

</table>

<%@ include file="structure/footer.jsp" %>
</body>
</html>
