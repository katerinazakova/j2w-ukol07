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

    <form method="post" action="/${post.id}">
        <div>
            <input type="hidden" name="id" value="${post.id}"/>
            <button type="submit" class="btn btn-danger btn-sm">Smazat</button>
        </div>
    </form>
    </td>
    <td>
        <form method="get" action="/${post.slug}/editace">
            <input type="hidden" name="id" value="${post.slug}"/>
            <button type="submit" class="btn btn-secondary btn-sm">Editovat</button>
        </form>
    </td>

[/@c.page]