package com.stn.utils;

import com.sun.management.OperatingSystemMXBean;

import java.lang.management.ManagementFactory;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.text.SimpleDateFormat;

public class Tools {

    public static Timestamp getDate() {
        Timestamp date = new Timestamp(System.currentTimeMillis());
        return date;
    }

    public static String formatDate(Timestamp date,int type) {
        String s = "";
        if(type == 1)
            s = new SimpleDateFormat("HH:mm").format(date);
        else if(type == 2)
            s = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss").format(date);
        else if(type == 3)
            s = new SimpleDateFormat("dd-MM-yyyy HH:mm").format(date);
        else if(type == 4)
            s = new SimpleDateFormat("dd-MM-yyyy").format(date);
        else if(type == 5)
            s = new SimpleDateFormat("HH:mm:ss").format(date);
        return s;
    }

    public Boolean userIsOnline(Timestamp lastSeen) {

        long timeout = 5 * 60 * 1000;
        java.sql.Timestamp current = new java.sql.Timestamp(new java.util.Date().getTime() - timeout );

        if(lastSeen.after(current))
            return true;
        else
            return false;
    }

    public void sendEmail(String to, String subject, String body) throws MessagingException {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");

        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("schoolingthenet","as5235$#%RETR");
            }
        });

        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress("no-reply@schoolingtheinter.net"));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
        message.setSubject(subject);
        message.setContent(body, "text/html; charset=utf-8");

        Transport.send(message);
    }

    public static String formatText(String text) {
        String html = text;

        Map<String,String> bbMap = new HashMap<String , String>();

        //Smilies

        bbMap.put(":\\)", "<img src='/img/smilies/smile1.gif' class='smile'>");
        bbMap.put(":D", "<img src='/img/smilies/grin.gif' class='smile'>");
        bbMap.put(":\\|", "<img src='/img/smilies/noexpression.gif' class='smile'>");
        bbMap.put(":O", "<img src='/img/smilies/ohmy.gif' class='smile'>");
        bbMap.put(":\\(", "<img src='/img/smilies/sad.gif' class='smile'>");
        bbMap.put(":o\\)", "<img src='/img/smilies/clown.gif' class='smile'>");
        bbMap.put(":-\\/", "<img src='/img/smilies/confused.gif' class='smile'>");
        bbMap.put(";\\)", "<img src='/img/smilies/wink.gif' class='smile'>");
        bbMap.put(":p", "<img src='/img/smilies/tongue.gif' class='smile'>");
        bbMap.put("'\\(", "<img src='/img/smilies/cry.gif' class='smile'>");
        bbMap.put(":-\\(", "<img src='/img/smilies/weep.gif' class='smile'>");
        bbMap.put("8\\)", "<img src='/img/smilies/cool1.gif' class='smile'>");
        bbMap.put(":king:", "<img src='/img/smilies/king.gif' class='smile'>");
        bbMap.put(":chef:", "<img src='/img/smilies/chef.gif' class='smile'>");
        bbMap.put(":flowers:", "<img src='/img/smilies/flowers.gif' class='smile'>");
        bbMap.put(":pope:", "<img src='/img/smilies/pope.gif' class='smile'>");
        bbMap.put(":angel:", "<img src='/img/smilies/angel.gif' class='smile'>");
        bbMap.put(":evil:", "<img src='/img/smilies/evil.gif' class='smile'>");
        bbMap.put(":alien:", "<img src='/img/smilies/alien.gif' class='smile'>");
        bbMap.put(":axe:", "<img src='/img/smilies/axe.gif' class='smile'>");
        bbMap.put(":cap:", "<img src='/img/smilies/cap.gif' class='smile'>");
        bbMap.put(":bike:", "<img src='/img/smilies/bike.gif' class='smile'>");
        bbMap.put(":rock:", "<img src='/img/smilies/rock.gif' class='smile'>");
        bbMap.put(":smartass:", "<img src='/img/smilies/smartass.gif' class='smile'>");
        bbMap.put(":clown:", "<img src='/img/smilies/clown.gif' class='smile'>");
        bbMap.put(":cigar:", "<img src='/img/smilies/cigar.gif' class='smile'>");
        bbMap.put(":crockett:", "<img src='/img/smilies/crockett.gif' class='smile'>");
        bbMap.put(":detective:", "<img src='/img/smilies/detective.gif' class='smile'>");
        bbMap.put(":cowboy:", "<img src='/img/smilies/cowboy.gif' class='smile'>");
        bbMap.put(":innocent:", "<img src='/img/smilies/innocent.gif' class='smile'>");
        bbMap.put(":oldtimer:", "<img src='/img/smilies/oldtimer.gif' class='smile'>");
        bbMap.put(":hmmm:", "<img src='/img/smilies/hmmm.gif' class='smile'>");
        bbMap.put(":book:", "<img src='/img/smilies/book.gif' class='smile'>");
        bbMap.put(":laugh:", "<img src='/img/smilies/laugh.gif' class='smile'>");
        bbMap.put(":clap:", "<img src='/img/smilies/clap.gif' class='smile'>");
        bbMap.put(":clap2:", "<img src='/img/smilies/clap2.gif' class='smile'>");
        bbMap.put(":hooray:", "<img src='/img/smilies/hooray.gif' class='smile'>");
        bbMap.put(":wall:", "<img src='/img/smilies/wall.gif' class='smile'>");
        bbMap.put(":judge:", "<img src='/img/smilies/judge.gif' class='smile'>");
        bbMap.put(":happy2:", "<img src='/img/smilies/happy2.gif' class='smile'>");
        bbMap.put(":cake:", "<img src='/img/smilies/cake.gif' class='smile'>");
        bbMap.put(":computer:", "<img src='/img/smilies/computer.gif' class='smile'>");
        bbMap.put(":hbd:", "<img src='/img/smilies/hbd.gif' class='smile'>");
        bbMap.put(":hi:", "<img src='/img/smilies/hi.gif' class='smile'>");
        bbMap.put(":horse:", "<img src='/img/smilies/horse.gif' class='smile'>");
        bbMap.put(":beer:", "<img src='/img/smilies/beer.gif' class='smile'>");
        bbMap.put(":gathering:", "<img src='/img/smilies/gathering.gif' class='smile'>");
        bbMap.put(":console:", "<img src='/img/smilies/console.gif' class='smile'>");
        bbMap.put(":beer2:", "<img src='/img/smilies/beer2.gif' class='smile'>");
        bbMap.put(":chair:", "<img src='/img/smilies/chair.gif' class='smile'>");
        bbMap.put(":drunk:", "<img src='/img/smilies/drunk.gif' class='smile'>");
        bbMap.put(":fishing:", "<img src='/img/smilies/fishing.gif' class='smile'>");
        bbMap.put(":hang:", "<img src='/img/smilies/hang.gif' class='smile'>");
        bbMap.put(":mml:", "<img src='/img/smilies/mml.gif' class='smile'>");
        bbMap.put(":pepsi:", "<img src='/img/smilies/pepsi.gif' class='smile'>");
        bbMap.put(":rant:", "<img src='/img/smilies/rant.gif' class='smile'>");
        bbMap.put(":rb:", "<img src='/img/smilies/rb.gif' class='smile'>");
        bbMap.put(":rip:", "<img src='/img/smilies/rip.gif' class='smile'>");
        bbMap.put(":rofl:", "<img src='/img/smilies/rofl.gif' class='smile'>");
        bbMap.put(":shoot2:", "<img src='/img/smilies/shoot2.gif' class='smile'>");
        bbMap.put(":kissing:", "<img src='/img/smilies/kissing.gif' class='smile'>");
        bbMap.put(":dancing:", "<img src='/img/smilies/dancing.gif' class='smile'>");
        bbMap.put(":chop:", "<img src='/img/smilies/chop.gif' class='smile'>");
        bbMap.put(":soldiers:", "<img src='/img/smilies/soldiers.gif' class='smile'>");
        bbMap.put(":strongbench:", "<img src='/img/smilies/strongbench.gif' class='smile'>");
        bbMap.put(":trampoline:", "<img src='/img/smilies/trampoline.gif' class='smile'>");
        bbMap.put(":mbounce:", "<img src='/img/smilies/mbounce.gif' class='smile'>");

        //Text

        bbMap.put("(\r\n|\r|\n|\n\r)", "<br/>");
        bbMap.put("\\[b\\](.+?)\\[/b\\]", "<strong>$1</strong>");
        bbMap.put("\\[i\\](.+?)\\[/i\\]", "<i>$1</i>");
        bbMap.put("\\[u\\](.+?)\\[/u\\]", "<span style='text-decoration:underline;'>$1</span>");
        bbMap.put("\\[center\\](.+?)\\[/center\\]", "<div align='center'>$1</div>");
        bbMap.put("\\[align=(.+?)\\](.+?)\\[/align\\]", "<div style='text-align:$1'>$2</div>");
        bbMap.put("\\[color=(.+?)\\](.+?)\\[/color\\]", "<font color='$1'>$2</font>");
        bbMap.put("\\[size=(.+?)\\](.+?)\\[/size\\]", "<span style='font-size:$1pt'>$2</span>");
        bbMap.put("\\[img\\](.+?)\\[/img\\]", "<img src='$1' style='max-width: 50%'/>");
        bbMap.put("\\[email\\](.+?)\\[/email\\]", "<a class='ui' href='mailto:$1' style='color: #66ba5b'>$1</a>");
        bbMap.put("\\[url\\](.+?)\\[/url\\]", "<a class='ui' href='$1' style='color: #99ccff' target='_blank'>$1</a>");
        bbMap.put("\\[url=(.+?)\\](.+?)\\[/url\\]", "<a class='ui' href='$1' style='color: #99ccff' target='_blank'>$2</a>");
        bbMap.put("\\[youtube\\](.+?)\\[/youtube\\]", "<object width='380' height='300'><param name='movie' value='http://www.youtube.com/v/$1'></param><embed src='http://www.youtube.com/v/$1' type='application/x-shockwave-flash' width='640' height='380'></embed></object>");
        //bbMap.put("\\[video\\](.+?)\\[/video\\]", "<video src='$1' />");
        bbMap.put("\\[quote=(.+?)\\]", "<p class='sub'><b>$1 wrote:</b></p><table style='padding-top: 1pt' border=0 cellspacing=0 cellpadding=10><tr><td style='border: 1px white dotted'>");
        bbMap.put("\\[quote\\]", "<table border=0 cellspacing=0 cellpadding=10><tr><td style='border: 1px white dotted'>");
        bbMap.put("\\[/quote\\]", "</td></tr></table>");

        for (Map.Entry entry: bbMap.entrySet()) {
            html = html.replaceAll(entry.getKey().toString(), entry.getValue().toString());
        }

        return html;
    }

    public double getSystemLoad() {
        OperatingSystemMXBean osBean = ManagementFactory.getPlatformMXBean(OperatingSystemMXBean.class);
        return Math.round(osBean.getSystemCpuLoad() *100);
    }


    public String pager(String page,int totalItems,int currentPage,int itemPerPage,int reqType) {
        String symbol;
        if(reqType == 1)
            symbol = "?";
        else
            symbol = "&";

        int totalPages = totalItems / itemPerPage;
        int totalItems2 = totalItems - (totalPages * itemPerPage);
        int i;
        String spacer = " <b style='color: #921c1c'>|</b> ";

        if(totalItems2 > 0)
            totalPages++;

        String html = "";
        html = html + "<div style='text-align: center'><b>";

        if(totalPages == 1) {
            html = html + "<b style='color: gray'>1 - " + currentPage * itemPerPage + "</b>";
        } else {
            // Generare partea din stanga
            if(currentPage - 3 > 0) {
                for(i=1;i<=3;i++) {
                    html = html + "<a class='ui' href='"+ page + symbol + "p=" + i + "'>" + (i * itemPerPage - itemPerPage + 1) + " - " + (i * itemPerPage) + "</a>";
                    html = html + spacer;
                }
            } else {
                for(i=1;i<currentPage;i++) {
                    html = html + "<a class='ui' href='"+ page + symbol + "p=" + i + "'>" + (i * itemPerPage - itemPerPage + 1) + " - " + (i * itemPerPage) + "</a>";
                    html = html + spacer;
                }
            }
            if(currentPage - 5 > 0) {
                if(currentPage - 5 != 1) {
                    html = html + "...";
                    html = html + spacer;
                }

                for(i=currentPage-2;i<currentPage;i++) {
                    html = html + "<a class='ui' href='"+ page + symbol + "p=" + i + "'>" + (i * itemPerPage - itemPerPage + 1) + " - " + (i * itemPerPage) + "</a>";
                    html = html + spacer;
                }
            } else {
                for(i=4;i<currentPage;i++) {
                    html = html + "<a class='ui' href='"+ page + symbol + "p=" + i + "'>" + (i * itemPerPage - itemPerPage + 1) + " - " + (i * itemPerPage) + "</a>";
                    html = html + spacer;
                }
            }

            //Generare pagina mijloc(pagina curenta)
            html = html + "<b style='color: gray'>" + (currentPage * itemPerPage - itemPerPage + 1) + " - " + (currentPage * itemPerPage) + "</b>";
            if(currentPage != totalPages && totalItems != 0) // Verificare pentru ultimul caracter |
            html = html + spacer;

            String temp1 = "";
            String temp2 = "";
            //Generarea partea din dreapta
            if(currentPage + 3 < totalPages) {
                for(i=totalPages - 3;i<=totalPages;i++) {
                    temp1 = temp1 + "<a class='ui' href='"+ page + symbol + "p=" + i + "'>" + (i * itemPerPage - itemPerPage + 1) + " - " + (i * itemPerPage) + "</a>";
                    if(i != totalPages)
                    temp1 = temp1 + spacer;
                }
            } else {
                for(i=currentPage + 1;i<=totalPages;i++) {
                    temp1 = temp1 + "<a class='ui' href='"+ page + symbol + "p=" + i + "'>" + (i * itemPerPage - itemPerPage + 1) + " - " + (i * itemPerPage) + "</a>";
                    if(i != totalPages)
                    temp1 = temp1 + spacer;
                }
            }

            if(currentPage + 5 < totalPages) {
                for(i=currentPage+1;i<=currentPage+2;i++) {
                    temp2 = temp2 + "<a class='ui' href='"+ page + symbol + "p=" + i + "'>" + (i * itemPerPage - itemPerPage + 1) + " - " + (i * itemPerPage) + "</a>";
                    if(i != totalPages)
                    temp2 = temp2 + spacer;
                }
                if(currentPage+5 != totalPages - 1) {
                    temp2 = temp2 + "...";
                    temp2 = temp2 + spacer;
                }
            } else {
                for(i=currentPage + 1;i<=totalPages - 3;i++) {
                    temp2 = temp2 + "<a class='ui' href='"+ page + symbol + "p=" + i + "'>" + (i * itemPerPage - itemPerPage + 1) + " - " + (i * itemPerPage) + "</a>";
                    temp2 = temp2 + spacer;
                }
            }

            html = html + temp2;
            html = html + temp1;
        }

        html = html + "</b></div>";
        return html;
    }

}

