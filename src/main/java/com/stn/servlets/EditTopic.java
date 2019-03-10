package com.stn.servlets;

import com.stn.helpers.TopicHelper;
import com.stn.pojo.Topic;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/EditTopic")
public class EditTopic extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        TopicHelper topicHelper = new TopicHelper();
        Topic topic = new Topic();

        String url = "";

        int idTopic = Integer.parseInt(request.getParameter("topicId"));
        String name = request.getParameter("topicName");
        int category = Integer.parseInt(request.getParameter("topicCategory"));
        int delete = Integer.parseInt(request.getParameter("deleteTopic"));
        int oldCategory = Integer.parseInt(request.getParameter("categoryId"));
        int page = Integer.parseInt(request.getParameter("page"));

        topic.setTopicId(idTopic);
        topic.setName(name);
        topic.setGroupId(category);

        if(delete == 1) {
            try {
                topicHelper.deleteTopic(idTopic);
            } catch (SQLException | ClassNotFoundException e) {
                out.println(e);
            }
            url = "/view_forum.jsp?id="+oldCategory+"&p="+page;
        } else {
            try {
                topicHelper.updateTopic(topic);
            } catch (SQLException | ClassNotFoundException e) {
                out.println(e);
            }
            url = "/view_topic.jsp?id="+idTopic+"&p="+page;
        }

        response.sendRedirect(url);
    }
}
