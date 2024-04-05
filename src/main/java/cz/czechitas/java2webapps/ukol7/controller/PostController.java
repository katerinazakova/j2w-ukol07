package cz.czechitas.java2webapps.ukol7.controller;

import cz.czechitas.java2webapps.ukol7.entity.Post;
import cz.czechitas.java2webapps.ukol7.service.PostService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PostController {
    private final PostService postService;

    @Autowired
    public PostController(PostService postService) {
        this.postService = postService;
    }

    @GetMapping("/")
    public ModelAndView listOfPosts(@PageableDefault(size = 8) Pageable pageable) {
        ModelAndView modelAndView = new ModelAndView("index");
        modelAndView.addObject("list", postService.list(pageable));
        return modelAndView;
    }

    @GetMapping("/post/{slug}")
    public ModelAndView detailOfPost(@PathVariable String slug) {
        return new ModelAndView("detail")
                .addObject("post", postService.singlePost(slug));
    }

    @GetMapping("/new")
    public ModelAndView newPost() {
        ModelAndView modelAndView = new ModelAndView("form-post");
        modelAndView.addObject("post", new Post());
        return modelAndView;
    }

    @PostMapping("/new")
    public Object createNewPost(@Valid @ModelAttribute("post") Post post, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "form-post";
        }
        postService.saveNewPost(post);
        return "redirect:/";
    }

    @PostMapping("/{id}")
    public String deletePostById(@PathVariable long id) {
        postService.deletePost(id);
        return "redirect:/";
    }

    @GetMapping("/{id}/edit")
    public ModelAndView editPost(@PathVariable long id) {
        ModelAndView modelAndView = new ModelAndView("form-post");
        modelAndView.addObject("post", postService.findId(id));
        return modelAndView;
    }

    @PostMapping("/{id}/edit")
    public Object ulozitPost(@Valid @ModelAttribute("post") Post post, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "form-post";
        }
        postService.savePost(post);
        return "redirect:/";
    }

}

