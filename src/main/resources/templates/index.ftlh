[#ftl]
[@c.page]
    <h1>Blog o běhu</h1>
    [#include "_forms/datum-publikace.ftlh"]
    <div>
        <button type="button" class="btn btn-outline-success"><a href="/novy">Vytvořit nový post</a></button>
    </div>
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
                <td><a class= "precist" href="/post/${post.slug}">Přečíst</a></td>
            </tr>
        [/#list]
        </tbody>
    </table>
<div class="pagination">
    [#if seznam.hasPrevious()]
        <a href="?page=${seznam.number - 1}">Předchozí</a>
    [/#if]

    [#if seznam.hasNext()]
        <a href="?page=${seznam.number + 1}">Další</a>
    [/#if]
</div>

[/@c.page]