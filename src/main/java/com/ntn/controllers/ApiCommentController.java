/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ntn.controllers;

import com.ntn.pojos.Comment;
import com.ntn.service.CommentService;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author ACER
 */
@RestController
public class ApiCommentController {
    @Autowired
    private CommentService commentService;
    @PostMapping(path = "/api/add-comment", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Comment> addComment(@RequestBody Map<String, String> params) {
        try {
            
            String content = params.get("content");
            int foodId = Integer.parseInt(params.get("foodId"));
        
            Comment c = this.commentService.addComment(content, foodId);
            
            return new ResponseEntity<>(c, HttpStatus.CREATED);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return  new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
}
