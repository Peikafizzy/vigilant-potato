package com.gok.pboot;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloWorld {
    @RequestMapping("/hello")
    public String hello(){
        System.out.println("执行----------");
        return "hello";
    }

    @RequestMapping("/helloAuth")
    public String helloAuth(){
        System.out.println("执行----------");
        return "helloAuth";
    }
}
