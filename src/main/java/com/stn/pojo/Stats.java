package com.stn.pojo;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.Month;
import java.time.Period;
import java.util.List;

public class Stats {

    private Timestamp launchDate = java.sql.Timestamp.valueOf("2018-04-19 00:00:00.0");

    private int userCount;
    private int facultatiCount;
    private int seriiCount;
    private int grupeCount;

    private int commentsCount;
    private int topicsCount;
    private int categoriesCount;
    private int filesCount;
    private float commentsPerUser;
    private float topicsPerUser;
    private float commentsPerMonth;
    private float topicsPerMonth;

    private int latestUserId;
    private String latestUserUsername;
    private int latestUserUserClass;
    private int latestUserDonor;

    public void setStats(List<Facultate> facultate, List<Serie> serie, List<Grupa> grupa, List<User> user,int commentsCnt,int topicsCnt,int categoriesCnt,int filesCnt) {
        userCount = user.size();
        facultatiCount = facultate.size();
        seriiCount = serie.size();
        grupeCount = grupa.size();

        commentsCount = commentsCnt;
        topicsCount = topicsCnt;
        categoriesCount = categoriesCnt;
        filesCount = filesCnt;
        commentsPerUser = (float) commentsCount / (float) userCount;
        topicsPerUser = (float) topicsCount / (float) userCount;

        LocalDate lDay = LocalDate.of(2018, Month.APRIL, 19);
        LocalDate today = LocalDate.now();
        Period age = Period.between(lDay, today);
        int months = age.getMonths();

        commentsPerMonth = (float) commentsCount / (float) months;
        topicsPerMonth = (float) topicsCount / (float) months;

        for(User u : user) {

            latestUserId = u.getId();
            latestUserUsername = u.getUserName();
            latestUserUserClass = u.getUserClass();
            latestUserDonor = u.getDonor();

        }
    }

    public Timestamp getLaunchDate() {
        return launchDate;
    }

    public int getUserCount() {
        return userCount;
    }

    public int getFacultatiCount() {
        return facultatiCount;
    }

    public int getSeriiCount() {
        return seriiCount;
    }

    public int getGrupeCount() {
        return grupeCount;
    }

    public int getLatestUserId() {
        return latestUserId;
    }

    public String getLatestUserUsername() {
        return latestUserUsername;
    }

    public int getLatestUserUserClass() {
        return latestUserUserClass;
    }

    public int getLatestUserDonor() {
        return latestUserDonor;
    }

    public int getCommentsCount() {
        return commentsCount;
    }

    public int getTopicsCount() {
        return topicsCount;
    }

    public int getCategoriesCount() {
        return categoriesCount;
    }

    public int getFilesCount() {
        return filesCount;
    }

    public float getCommentsPerUser() {
        return commentsPerUser;
    }

    public float getTopicsPerUser() {
        return topicsPerUser;
    }

    public float getCommentsPerMonth() {
        return commentsPerMonth;
    }

    public float getTopicsPerMonth() {
        return topicsPerMonth;
    }

    public String getCommentsPerUserString() {
        return String.format("%.2f",commentsPerUser);
    }

    public String getTopicsPerUserString() {
        return String.format("%.2f",topicsPerUser);
    }

    public String getCommentsPerMonthString() {
        return String.format("%.2f",commentsPerMonth);
    }

    public String getTopicsPerMonthString() {
        return String.format("%.2f",topicsPerMonth);
    }
}
