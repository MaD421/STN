package com.stn.pojo;

import java.sql.Timestamp;

public class File {

    int fileId;
    String name;
    String description;
    String link;
    Timestamp date;
    int views;
    int idFacultate;
    User user;
    FileCategory fileCategory;

    public void setFileId(int fileId) {
        this.fileId = fileId;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public void setViews(int views) {
        this.views = views;
    }

    public void setIdFacultate(int idFacultate) {
        this.idFacultate = idFacultate;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public void setFileCategory(FileCategory fileCategory) {
        this.fileCategory = fileCategory;
    }

    public int getFileId() {
        return fileId;
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }

    public String getLink() {
        return link;
    }

    public Timestamp getDate() {
        return date;
    }

    public int getViews() {
        return views;
    }

    public int getIdFacultate() {
        return idFacultate;
    }

    public User getUser() {
        return user;
    }

    public FileCategory getFileCategory() {
        return fileCategory;
    }
}
