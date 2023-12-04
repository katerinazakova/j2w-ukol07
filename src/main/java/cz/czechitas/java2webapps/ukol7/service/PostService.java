package cz.czechitas.java2webapps.ukol7.service;

import cz.czechitas.java2webapps.ukol7.entity.Post;
import cz.czechitas.java2webapps.ukol7.repository.PostRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class PostService {
    public final PostRepository postRepository;

    public PostService(PostRepository postRepository) {
        this.postRepository = postRepository;
    }

    public List<Post> findAllPost() {
        return postRepository.findAll();
    }

    public Optional<Post> singlePost(String slug) {
        return postRepository.findBySlug(slug);
    }
}
