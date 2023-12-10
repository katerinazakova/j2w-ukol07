package cz.czechitas.java2webapps.ukol7.service;

import cz.czechitas.java2webapps.ukol7.entity.Post;
import cz.czechitas.java2webapps.ukol7.repository.PostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
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
        Pageable pageableSort = PageRequest.of(0, 20, Sort.by("published").descending());
        return postRepository.findAll(pageableSort);
    }

    public Optional<Post> singlePost(String slug) {
        return postRepository.findBySlug(slug);
    }

    public Page<Post> dleDataPublikovani(Pageable pageable) {
        LocalDate currentDate = LocalDate.now();
        return postRepository.findByPublishedBeforeOrderByPublishedDesc(currentDate, pageable);
    }

    public Post novyPost(Post post){
        post.setId(null);
        return postRepository.save(post);
    }

    public Post smazatPost (String slug){
        return postRepository.deleteBySlug(slug);

    }

    public Post upravitPost (Post post){
        return postRepository.save(post);
    }

}
