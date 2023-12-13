[#ftl]
[@c.page]
    <h1>Blog o běhu</h1>

    <button type="button" class="btn btn-outline-primary"><a href="/novy">Nový záznam</a></button>
    <table class="table table-hover">
        <thead>
        <tr>
            <th scope="col">Titulek</th>
            <th scope="col">Perex</th>
            <th scope="col">Datum publikace</th>
            <th scope="col">Autor</th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody>
        [#list seznam.content as post]
            <tr class="table-row">
                <td>${post.title}</td>
                <td>${post.perex?no_esc}</td>
                <td>${post.published?date}</td>
                <td>${post.author}</td>
                <td><a class="precist" href="/post/${post.slug}">Přečíst</a></td>
            </tr>
        [/#list]
        </tbody>
    </table>

    <div class="predchozi">
        [#if seznam.hasPrevious()]
            <a href="?page=${seznam.number - 1}" class="link-danger link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">Předchozí</a>
        [/#if]
    </div>
    <div class="dalsi">
        [#if seznam.hasNext()]
            <a href="?page=${seznam.number + 1}" class=link-secondary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">Další</a>
        [/#if]
    </div>

[/@c.page]