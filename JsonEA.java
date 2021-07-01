package kr.smhrd.web;

import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.io.BufferedReader;
import java.io.InputStreamReader;


import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
 
public class JsonEA {
 
    public static void main(String[] args) {
        // 미세먼지 경보 정보 조회 서비스 - 한국환경공단 api 서비스
        BufferedReader br=null;
        try {
            // 인증키

            
            String urlStr = "http://data4library.kr/api/libSrch?authKey=318e50933ed226a17c0181b02c4aabf9c59a92825ebc6b0305e564625c5cd945&pageNo=1&pageSize=10";
            
            URL url = new URL(urlStr);
            HttpURLConnection urlConnection= (HttpURLConnection) url.openConnection();
            urlConnection.setRequestMethod("GET");
            
            
            br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream(),"utf-8"));
            String result = "";
            String line;
           
            while ((line = br.readLine()) != null) {
                result = result + line+"\n";
                //System.out.println(line);                
            }            
            System.out.println(result);
            
        } catch (Exception e) {
        	 System.out.println(e.getMessage());
        }
 
    }
 
}

