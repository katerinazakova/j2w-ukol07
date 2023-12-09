[#ftl]
[@c.page]
    <form method="get">
        <div>${post.title}</div>
        <div>${post.perex?no_esc}</div>
        <div>${post.body?no_esc}</div>
        <div>${post.author}</div>
        <div>${post.published?date}</div>
        <div><a href="/">Zpět na úvodní stránku</a></div>
    </form>
[/@c.page]