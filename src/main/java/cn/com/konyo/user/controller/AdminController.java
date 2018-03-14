package cn.com.konyo.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/")
public class AdminController {

    private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

    @RequestMapping(value = "")
    public String index() {
        logger.info("Controller End AdminController->index - login ;");
        return "admin_login";
    }
}
