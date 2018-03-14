package cn.com.konyo.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * 盛康 MD5加密类
 * 
 * @author dengcj
 */
public class MD5 {

    public static String Md5(String plainText) {
        String result = null;
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(plainText.getBytes());
            byte b[] = md.digest();
            int i;
            StringBuffer buf = new StringBuffer("");
            for (int offset = 0; offset < b.length; offset++) {
                i = b[offset];
                if (i < 0)
                    i += 256;
                if (i < 16)
                    buf.append("0");
                buf.append(Integer.toHexString(i));
            }
            result = buf.toString();
            // result = buf.toString().substring(8, 24);
            // System.out.println("mdt 16bit: " + buf.toString().substring(8, 24));
            // System.out.println("md5 32bit: " + buf.toString());
        }
        catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return result;
    }

    public static void main(String args[]) {
        String passwd = null;
        String loginpasswd = null;
        passwd = "123456";
        loginpasswd = Md5(passwd);
        // System.out.println("MD5 16Bit : " + loginpasswd);
    }
}
