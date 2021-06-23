package com.example.actiontest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {
    @GetMapping(value="/")
    public String test() {
        String tests = "42 Seoul helper site. site update!!!!";
        System.out.println(tests);
        return tests;
    }
}
