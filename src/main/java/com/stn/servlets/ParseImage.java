package com.stn.servlets;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.poi.xwpf.usermodel.XWPFRun;
import org.json.JSONException;
import org.json.JSONObject;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URL;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@WebServlet("/ParseImage")
@MultipartConfig
public class ParseImage extends HttpServlet {

    private static String readAll(Reader rd) throws IOException {
        StringBuilder sb = new StringBuilder();
        int cp;
        while ((cp = rd.read()) != -1) {
            sb.append((char) cp);
        }
        return sb.toString();
    }

    public static JSONObject readJsonFromUrl(String url) throws IOException, JSONException {
        InputStream is = new URL(url).openStream();
        try {
            BufferedReader rd = new BufferedReader(new InputStreamReader(is, Charset.forName("UTF-8")));
            String jsonText = readAll(rd);
            JSONObject json = new JSONObject(jsonText);
            return json;
        } finally {
            is.close();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
                "cloud_name", "arashishinga",
                "api_key", "952573286613164",
                "api_secret", "yeAfqxXyRfOlmisyCM1EVuDBGq4"));
        List<Part> fileParts = request.getParts().stream().filter(part -> "imgFile".equals(part.getName())).collect(Collectors.toList());
        XWPFDocument document = new XWPFDocument();
        if (fileParts.size() <= 5) {
            for (Part filePart : fileParts) {
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                String[] nameSplit = fileName.split("\\.");
                String extension = nameSplit[nameSplit.length - 1].toLowerCase();
                if (extension.equals("jpg") || extension.equals("png")) {
                    InputStream fileContent = filePart.getInputStream();
                    File uploads = new File(getServletContext().getRealPath("/img"));
                    File file = File.createTempFile(fileName, "." + extension, uploads);
                    Files.copy(fileContent, file.toPath(), StandardCopyOption.REPLACE_EXISTING);

                    Map uploadResult = cloudinary.uploader().upload(file, ObjectUtils.emptyMap());
                    System.out.println(uploadResult.toString());
                    JSONObject json = null;
                    try {
                        json = readJsonFromUrl("https://api.ocr.space/parse/imageurl?apikey=d2e028e7aa88957&url=" + uploadResult.get("url"));
                    } catch (JSONException e) {
                        e.printStackTrace();
                    }
                    try {
                        if (json != null) {
                            String text = json.getJSONArray("ParsedResults").getJSONObject(0).getString("ParsedText");
                            String[] textSplit = text.split("\\r\\n");
                            for (String s : textSplit) {
                                XWPFParagraph para2 = document.createParagraph();
                                XWPFRun para2Run = para2.createRun();
                                para2Run.setText(s);
                            }

                        } else {
                            request.setAttribute("imageParseError", "The image cannot be parsed!");
                        }
                    } catch (JSONException e) {
                        e.printStackTrace();
                    }
                    file.delete();
                    cloudinary.uploader().destroy(uploadResult.get("public_id").toString(), ObjectUtils.emptyMap());
                    XWPFParagraph para2 = document.createParagraph();
                    para2.setPageBreak(true);
                } else {
                    request.setAttribute("imageParseError", "The image has no jps or png extension!");
                }
            }
            response.setHeader("Content-disposition", "attachment; filename=" + "test" + ".docx");
            document.write(response.getOutputStream());
        } else {
            request.setAttribute("imageParseError", "Maximum 5 files!");
            //Setat eroare :)
    }
        request.getRequestDispatcher("/search.jsp").forward(request,response);
    }
}
