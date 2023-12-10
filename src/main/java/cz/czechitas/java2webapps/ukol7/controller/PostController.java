package cz.czechitas.java2webapps.ukol7.controller;

import cz.czechitas.java2webapps.ukol7.entity.Post;
import cz.czechitas.java2webapps.ukol7.service.PostService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.data.domain.Pageable;

import java.util.Optional;

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

    @GetMapping("/datum-publikace")
    public ModelAndView datumPublikace(Pageable pageable) {
        ModelAndView modelAndView = new ModelAndView("index");
        modelAndView.addObject("seznam", postService.dleDataPublikovani(pageable));
        return modelAndView;
    }


    @GetMapping("/post/{slug}")
    public ModelAndView detailPost(@PathVariable String slug) {
        Optional<Post> postOptional = postService.singlePost(slug);
        postOptional.orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
        return new ModelAndView("detail")
                .addObject("post", postOptional.get());
    }

    @GetMapping("/novy")
    public ModelAndView novyPost() {
        ModelAndView modelAndView = new ModelAndView("novy-post");
        modelAndView.addObject("post", new Post());
        return modelAndView;
    }

    @PostMapping("/novy")
    public Object pridatPost (@Valid @ModelAttribute ("post") Post post, BindingResult bindingResult){
        if (bindingResult.hasErrors()){
            return "/novy-post";
        }
        postService.novyPost(post);
        return "redirect:/";
    }

    @PostMapping("/post/{slug}")
    public String smazatPost(@PathVariable String slug) {
        postService.smazatPost(slug);
        return "redirect:/";
    }

    @GetMapping("/post/{slug}/edit")
    public ModelAndView editacePost(@PathVariable String slug) {
        Optional<Post> post = postService.singlePost(slug);
        ModelAndView modelAndView = new ModelAndView("novy-post");
        modelAndView.addObject("post", post.get());
        return modelAndView;
    }

   @PostMapping("/post/{slug}/edit")
    public String upravitPost(@Valid @ModelAttribute("post") Post post, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "novy-post";
        }
        postService.upravitPost(post);
        return "redirect:/post/{slug}";
    }

}