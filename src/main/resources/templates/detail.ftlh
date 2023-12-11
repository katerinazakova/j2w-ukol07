[#ftl]
[@c.page]
    <form method="get">
        <h2>${post.title}</h2>
        <div>${post.perex?no_esc}</div>
        <div>${post.body?no_esc}</div>
        <div>${post.author}</div>
        <div>${post.published?date}</div>
        <div><a href="/">Zpět na úvodní stránku</a></div>
    </form>

[/@c.page]