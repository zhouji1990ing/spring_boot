package cn.com.konyo.util;

public class FilePathUtils {

    /**
     * 文件图片-绝对路径-截取
     * 
     * @param imageUrl
     * @return imageUrl = /home/chensheng/files/mhgh/images/course/ce59ab2c-075c-4947-822b-2419e5c6974b.jpg return =
     *         mhgh/images/course/ce59ab2c-075c-4947-822b-2419e5c6974b.jpg
     */
    public static String getAbsoluteFilePath(String imageUrl) {

        if (imageUrl.indexOf(Constants.UPLOAD_FILE_SAVE_PATH) >= 0) {
            imageUrl = imageUrl.substring(Constants.UPLOAD_FILE_SAVE_PATH.length()); // 去掉绝对路径
        }
        return imageUrl;
    }
}
