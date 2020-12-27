package com.kiriya.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 一些跳转
 *
 * @author Kirito
 * @date 2020/12/15 14:29 <br>
 */
@Controller
public class MainController {

    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    @RequestMapping("/index")
    public String index() {
        return "index";
    }

    @RequestMapping("/mainPage")
    public String mainPage() {
        return "main";
    }

    @RequestMapping("/loginPage")
    public String loginPage() {
        return "login";
    }

    @RequestMapping("/studentMsgPage")
    public String studentMsgPage() {
        return "studentMsg";
    }

    @RequestMapping("/allCoursePage")
    public String allCoursePage() {
        return "allCourse";
    }


}
