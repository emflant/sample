package com.example.app02.controller;

import com.example.app02.biz.ClassEventBiz;
import com.example.app02.vo.ClassEvent;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

@Controller
public class ClassController {

    private static final Logger log = LoggerFactory.getLogger(ClassController.class);

    @Autowired
    private ClassEventBiz classEventBiz;

    @GetMapping("/class")
    public String classCalendar(@RequestParam(value = "date", defaultValue = "") String date, Model model) {
        model.addAllAttributes(classEventBiz.select(date));
        return "class";
    }

    @PostMapping("/class")
    public RedirectView classCalendar(@ModelAttribute ClassEvent event) {
        classEventBiz.save(event);
        return new RedirectView("/class?date="+event.getClassDate());
    }
}
