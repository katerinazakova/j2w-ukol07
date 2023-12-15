[#ftl]
[@c.page]
    <h1>Blog o běhu</h1>

    <a class="btn btn-outline-primary" href="/novy">Nový záznam</a>
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
                <td><a class="btn btn-primary btn-sm" href="/post/${post.slug}">Přečíst</a></td>
                [#--<td>
                    <form method="post" action="/${post.id}">
                        <div>
                            <input type="hidden" name="id" value="${post.id}"/>
                            <button type="submit" class="btn btn-danger btn-sm">Smazat</button>
                        </div>
                    </form>
                </td>
                <td>
                    <form method="get" action="/${post.id}/editace">
                        <input type="hidden" name="id" value="${post.id}"/>
                        <button type="submit" class="btn btn-secondary btn-sm">Editovat</button>
                    </form>
                </td>
            </tr>--]

        [/#list]
        </tbody>
    </table>

    <div class="predchozi">
        [#if seznam.hasPrevious()]
            <a href="?page=${seznam.number - 1}"
               class="link-danger link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">Předchozí</a>
        [/#if]
    </div>
    <div class="dalsi">
        [#if seznam.hasNext()]
            <a href="?page=${seznam.number + 1}"
               class="link-dark link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">Další</a>
        [/#if]
    </div>

[/@c.page]