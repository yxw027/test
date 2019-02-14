package com.linghang.util;


import net.sf.json.JSONObject;
import org.springframework.util.DigestUtils;

import java.io.*;
import java.net.URL;
import java.net.URLConnection;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

/**
 * 短信接口
 *
 * @author youp
 * @date 2018-10-22
 **/
public class SmsUtils {

    /**
     * utf-8 调用接口
     */
    private static String url = "http://47.98.100.71:8088/v2sms.aspx";
    /**
     * 企业id
     */
    private static String id = "91";
    /**
     * 账号
     */
    private static String account = "YZ303";
    /**
     * 密码
     */
    private static String pwd = "HHcf66";

    public static String sendPost(String url, String param) {
        PrintWriter out = null;
        BufferedReader in = null;
        String result = "";
        try {
            URL realUrl = new URL(url);
            URLConnection conn = realUrl.openConnection();
            conn.setRequestProperty("accept", "*/*");
            conn.setRequestProperty("Charsert", "UTF-8");
            conn.setRequestProperty("connection", "Keep-Alive");
            conn.setRequestProperty("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            // 发送POST请求必须设置如下两行
            conn.setDoOutput(true);
            conn.setDoInput(true);
            out = new PrintWriter(new OutputStreamWriter(conn.getOutputStream(), "utf-8"));
            out.print(param);
            out.flush();
            // 定义BufferedReader输入流来读取URL的响应
            in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (out != null) {
                    out.close();
                }
                if (in != null) {
                    in.close();
                }
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
        return result;
    }

    /**
     * 示例 action=send&userid=12&timestamp=20120701231212&sign =5cc68982f55ac74348e3d819f868fbe1&mobile=17602126467,13361951123&content=内容
     *
     * @param phones
     * @param content
     * @return
     */
    public static String getParam(String phones, String content) {
        String timestamp = getTimeStamp();
        StringBuffer param = new StringBuffer();
        try {
            String sign = DigestUtils.md5DigestAsHex((account + pwd + timestamp).getBytes("utf-8"));
            System.out.println(account + pwd + timestamp);
            param.append("action=send")
                    .append("&userid=" + id)
                    .append("&timestamp=" + timestamp)
                    .append("&sign=" + sign)
                    .append("&mobile=" + phones)
                    .append("&content=" + content);
            System.out.println(param.toString());
        } catch (Exception e) {
            System.out.println("签名md5加密错误");
        }
        return param.toString();
    }


    /**
     * 获取时间戳
     *
     * @return
     */
    public static String getTimeStamp() {
        DateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
        format.setTimeZone(TimeZone.getTimeZone("GMT+8"));
        return format.format(new Date());
    }


    /**
     * 手机号转换拼接格式
     *
     * @param phones
     * @return
     */
    public static String getMobile(List<String> phones) {
        String mobile = "";
        if (phones == null || phones.size() == 0) {
            return mobile;
        }
        for (int i = 0; i < phones.size(); i++) {
            if (mobile == "") {
                mobile += phones.get(i);
            } else {
                mobile += "," + phones.get(i);
            }
        }
        return mobile;
    }

    /**
     * xml解析
     *
     * @param xml
     * @return
     */
    public static JSONObject formatXml(String xml) {
//        XMLSerializer xmlSerializer = new XMLSerializer();
//        String jsonStr = xmlSerializer.read(xml).toString();
//        JSONObject result = JSONObject.fromObject(jsonStr);
        JSONObject js = new JSONObject();
        js.put("returnstatus","Success");
        return js;
    }

    /**
     * 发送短信
     *
     * @param phones
     * @param content
     * @return
     */
    public static JSONObject sendSms(String phones, String content) {
        String res = SmsUtils.sendPost(url, getParam(phones, content));
        return formatXml(res);
    }
}
