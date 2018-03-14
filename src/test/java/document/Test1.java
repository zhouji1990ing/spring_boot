/**************************************************************************************** 
 Copyright © 2003-2012 ZTEsoft Corporation. All rights reserved. Reproduction or       <br>
 transmission in whole or in part, in any form or by any means, electronic, mechanical <br>
 or otherwise, is prohibited without the prior written consent of the copyright owner. <br>
 ****************************************************************************************/
package document;

import java.util.Optional;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * <Description> <br>
 * 
 * @author zhou.ji<br>
 * @version 1.0<br>
 * @taskId <br>
 * @CreateDate 2017年7月12日 <br>
 * @since V8.1<br>
 * @see document <br>
 */
@RunWith(SpringJUnit4ClassRunner.class)
// 表示继承了SpringJUnit4ClassRunner类
@ContextConfiguration(locations = {
    "classpath:application-context.xml"
})
public class Test1 {

    /**
     * Description: <br>
     * 
     * @author zhou.ji<br>
     * @taskId <br>
     * @param args <br>
     */
    public static void main(String[] args) {

    }

    @Test
    public void test1() {
        try {
            Optional<String> str = Optional.of("1321");
            Optional<String> str2 = Optional.ofNullable(null);
            Optional<String> str3 = Optional.empty();

            System.out.println(str2.orElse(null));
            System.out.println(str3.orElse(""));
        }
        catch (Exception e) {
            e.printStackTrace();
        }

    }

    public int print(Optional<String> str) {
        System.out.println(str);
        return 0;
    }
}
