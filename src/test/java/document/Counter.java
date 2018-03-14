/**************************************************************************************** 
 Copyright © 2003-2012 ZTEsoft Corporation. All rights reserved. Reproduction or       <br>
 transmission in whole or in part, in any form or by any means, electronic, mechanical <br>
 or otherwise, is prohibited without the prior written consent of the copyright owner. <br>
 ****************************************************************************************/
package document;

/**
 * <Description> <br>
 * 
 * @author zhou.ji<br>
 * @version 1.0<br>
 * @taskId <br>
 * @CreateDate 2017年7月18日 <br>
 * @since V8.1<br>
 * @see document <br>
 */

public class Counter {
    public volatile static int count = 0;

    public static synchronized void inc() {

        // 这里延迟1毫秒，使得结果明显
        try {
            Thread.sleep(1);
        }
        catch (InterruptedException e) {
        }

        count++;
        System.out.println(count);
    }

    public static void main(String[] args) {

        // 同时启动1000个线程，去进行i++计算，看看实际结果

        for (int i = 0; i < 1000; i++) {
            new Thread(new Runnable() {
                public void run() {
                    Counter.inc();
                }
            }).start();
        }

        // 这里每次运行的值都有可能不同,可能为1000
        System.out.println("运行结果:Counter.count=" + Counter.count);
    }
}
