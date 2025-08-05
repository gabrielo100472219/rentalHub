package com.rental_hub.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rental_hub.entities.*;
import com.rental_hub.repositories.*;

@Service
public class TagService {
    
    @Autowired
    private TagRepository repo;

    public void addTag(Tag tag) {
        repo.save(tag);
    }
}
