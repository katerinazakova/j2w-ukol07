package cz.czechitas.java2webapps.ukol7.controller;

import cz.czechitas.java2webapps.ukol7.entity.Post;
import cz.czechitas.java2webapps.ukol7.service.PostService;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.data.domain.Pageable;

import java.time.LocalDate;
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
        modelAndView.addObject("seznam", postService.dleDataPublikace(pageable));
        return modelAndView;
    }


   @GetMapping ("/post/{slug}")
    public ModelAndView detailPost (@PathVariable String slug){
    Optional<Post> postOptional = postService.singlePost(slug);
        postOptional.orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
        return new ModelAndView("detail")
                .addObject("post", postOptional.get());
   }


}