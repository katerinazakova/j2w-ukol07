package cz.czechitas.java2webapps.ukol7.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;

@Getter
@Setter
@Entity
public class Post {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(unique = true)
    @NotBlank
    private String slug;
    @NotBlank
    private String author;
    @NotBlank
    private String title;
    @NotBlank
    private String perex;
    @NotBlank
    private String body;
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private LocalDate published;
}
