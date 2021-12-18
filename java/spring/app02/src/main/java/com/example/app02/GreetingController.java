package com.example.app02;

import com.example.app02.repository.ClassEventRepository;
import com.example.app02.vo.ClassEvent;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.concurrent.atomic.AtomicLong;

@RestController
public class GreetingController {
    @Autowired
    private ClassEventRepository eventRepository;
    private static final String template = "Hello, %s!";
    private final AtomicLong counter = new AtomicLong();
    private static final Logger log = LoggerFactory.getLogger(GreetingController.class);

    @GetMapping("/greeting")
    public Greeting greeting(@RequestParam(value = "name", defaultValue = "World") String name) {
        return new Greeting(counter.incrementAndGet(), String.format(template, name));
    }

    @PostMapping("/greeting")
    public ClassEvent greeting(@RequestBody ClassEvent event) {
        log.info(event.toString());
        if("".equals(event.getId())){
            event.setId(null);
        }

        ClassEvent result = eventRepository.save(event);

        return result;
    }
}
