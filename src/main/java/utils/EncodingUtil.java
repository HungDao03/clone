package utils;


import java.io.UnsupportedEncodingException;
//Ghi chú: có một vài lỗi ký tự trong quá trình truyền dữ liệu , cần phương thức này để chuyển đổi ký tự lỗi thành tiếng việt

public class EncodingUtil {
    public static String fixEncoding(String input) {
        try {
            byte[] bytes = input.getBytes("ISO-8859-1");
            return new String(bytes, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return input;
        }
    }
}
