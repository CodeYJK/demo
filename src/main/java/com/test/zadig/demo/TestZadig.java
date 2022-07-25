package com.test.zadig.demo;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("zadig/")
public class TestZadig {


    @RequestMapping(value = "/test", method = RequestMethod.GET)
    public String testZadig(){
        return "zadig测试-Hellworld";
    }
}
