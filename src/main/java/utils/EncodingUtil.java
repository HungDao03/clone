package utils;


import java.io.UnsupportedEncodingException;

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
