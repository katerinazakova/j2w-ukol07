package cz.czechitas.java2webapps.ukol7.controller;

import cz.czechitas.java2webapps.ukol7.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PostController {
    private final PostService postService;

    @Autowired
    public PostController(PostService postService) {
        this.postService = postService;
    }

    @GetMapping("/")
    public ModelAndView seznamPost() {
        ModelAndView modelAndView = new ModelAndView("index");
        modelAndView.addObject("seznam", postService.list());
        return modelAndView;
    }

    @GetMapping("/post/{slug}")
    public ModelAndView detailPost(@PathVariable String slug) {
        return new ModelAndView("detail")
                .addObject("post", postService.singlePost(slug));
    }

}