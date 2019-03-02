package com.stn.pojo;

import java.sql.Timestamp;

public class Log {

    int idLog;
    String content;
    int type;
    Timestamp date;

    public void setIdLog(int idLog) {
        this.idLog = idLog;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setType(int type) {
        this.type = type;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public int getIdLog() {
        return idLog;
    }

    public String getContent() {
        return content;
    }

    public int getType() {
        return type;
    }

    public Timestamp getDate() {
        return date;
    }
}
