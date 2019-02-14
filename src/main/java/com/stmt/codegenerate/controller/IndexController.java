package com.stmt.codegenerate.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

    @RequestMapping("/code")
    public String indexHtml(){

        return "index";
    }

}
