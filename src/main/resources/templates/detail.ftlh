[#ftl]
[@c.page]
    <form method="get">
        <h2>${post.title}</h2>
        <div>${post.perex?no_esc}</div>
        <div>${post.body?no_esc}</div>
        <div>${post.author}</div>
        <div>${post.published?date}</div>
    </form>
    <br>
    <br>
    <div>

        <a href="/"><button type="button" class="btn btn-outline-primary">Back to homepage</button></a>
    </div>


[/@c.page]