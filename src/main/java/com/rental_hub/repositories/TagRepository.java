package com.rental_hub.repositories;

import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.JpaRepository;

import com.rental_hub.entities.Tag;

@Repository
public interface TagRepository extends JpaRepository<Tag, String>{

    
}
