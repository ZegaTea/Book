/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import com.google.gson.Gson;
import pojo.User;

/**
 *
 * @author DUC
 */
public class APIWrapper {

    private static String appID = "170059843736358";
    private static String appSecret = "0688a9cb81003936589bfd692cff3807";
    private static String redirectUrl = "http://localhost:8081/FBLogin/FacebookServlet";
    private String accessToken;
    private Gson gson;

    public APIWrapper() {
        gson = new Gson();
    }

    public static String getDialogLink() {
        String dialogLink = "https://www.facebook.com/v2.11/dialog/oauth?client_id=%s&redirect_uri=%s";
        return String.format(dialogLink, appID, redirectUrl);
    }

    public String getAccessToken(String code) {
        String accessTokenLink = "https://graph.facebook.com/v2.11/oauth/access_token?"
                + "client_id=%s"
                + "&redirect_uri=%s"
                + "&client_secret=%s"
                + "&code=%s";
        accessTokenLink = String.format(accessTokenLink, appID, redirectUrl, appSecret, code);

        String result = NetUtils.getResult(accessTokenLink);
//        String token = result.substring(result.indexOf("access_token=") + 1, result.indexOf("&"));
       
        String token = result.substring(result.indexOf(":")+2 , result.indexOf(",")-1);
//        String token = "EAACaqySTkyYBAC3Cb8hr3ul4ZBljOPqj6jYBXpbXZAyndimIGefnwQcrGALJD7dixV0PeXpIKOCQGuWyU2PxEsaXtUuZCZBDS7IEz1FdPmwnbeSb9MhZAhJb3EX1b0XDfXnLqZC6x4d1cliMYvjGP4YtGKZBZAHax2TgEgrgbnp0RqWdbHLQk9KX";
        
        return token;
    }

    public User getUserInfor() {
        String infoUrl = "https://graph.facebook.com/me?access_token=%s";
        infoUrl = String.format(infoUrl, this.accessToken);

        String result = NetUtils.getResult(infoUrl);
        User userInfo = gson.fromJson(result, User.class);

        return userInfo;
    }

    public String getAccessToken() {
        return accessToken;
    }

    public void setAccessToken(String accessToken) {
        this.accessToken = accessToken;
    }
}
