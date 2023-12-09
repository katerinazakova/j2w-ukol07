package cz.czechitas.java2webapps.ukol7.service;

import cz.czechitas.java2webapps.ukol7.entity.Post;
import cz.czechitas.java2webapps.ukol7.repository.PostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.Optional;

@Service
public class PostService {
    public final PostRepository postRepository;

    @Autowired
    public PostService(PostRepository postRepository) {
        this.postRepository = postRepository;
    }

    public Page<Post> list() {
        Pageable pageable = PageRequest.of(0, 20);
        return postRepository.findAll(pageable);
    }

    public Optional<Post> singlePost(String slug) {
        return postRepository.findBySlug(slug);
    }
    public Page <Post> dleDataPublikace(LocalDate published, Pageable pageable) {
        return postRepository.findByPublishedBeforeOrderByPublishedDesc(published, pageable);
    }
}
