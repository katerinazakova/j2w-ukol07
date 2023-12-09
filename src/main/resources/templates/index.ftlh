[#ftl]
<!DOCTYPE html>
<html lang="cs">
<head>
    <meta charset="UTF-8">
    <title>Můj blog</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/png" href="/images/favicon.png">
</head>
<body>
    <h1>Blog o běhu</h1>
    [#include "datum-publikace.ftlh"]

    <table class="table">
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
        <tr>
            <td>${post.title}</td>
            <td>${post.perex?no_esc}</td>
            <td>${post.published?date}</td>
            <td>${post.author}</td>
            <td><a href="/post/${post.slug}">Přečíst</a></td>
        </tr>
        [/#list]
        </tbody>
    </table>

</body>
</html>
