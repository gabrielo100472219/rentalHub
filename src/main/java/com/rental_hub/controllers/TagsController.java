package com.rental_hub.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.rental_hub.entities.*;
import com.rental_hub.services.*;

@RestController
public class TagsController {
    
    @Autowired
    TagService servicer;

    @PostMapping("/tags")
    public void postTag(@RequestBody Tag tag) {
       servicer.addTag(tag); 
    }
    
}
