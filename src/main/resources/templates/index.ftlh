[#ftl]
[@c.page]
    <h1>Running blog</h1>

    <a class="btn btn-outline-primary" href="/new">new entry</a>
    <table class="table table-hover">
        <thead>
        <tr>
            <th scope="col">Title</th>
            <th scope="col">Perex</th>
            <th scope="col">Date of published</th>
            <th scope="col">Author</th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody>
        [#list list.content as post]
            <tr class="table-row">
                <td>${post.title}</td>
                <td>${post.perex?no_esc}</td>
                <td>${post.published?date}</td>
                <td>${post.author}</td>
                <td><a class="btn btn-primary btn-sm" href="/post/${post.slug}">Read</a></td>
                <td>
                    <form method="post" action="/${post.id}">
                        <div>
                            <input type="hidden" name="id" value="${post.id}"/>
                            <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                        </div>
                    </form>
                </td>
                <td>
                    <form method="get" action="/${post.id}/edit">
                        <input type="hidden" name="id" value="${post.id}"/>
                        <button type="submit" class="btn btn-secondary btn-sm">Edit</button>
                    </form>
                </td>
            </tr>

        [/#list]
        </tbody>
    </table>

    <div class="previous">
        [#if list.hasPrevious()]
            <a href="?page=${list.number - 1}"
               class="link-danger link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">Previous</a>
        [/#if]
    </div>
    <div class="next">
        [#if list.hasNext()]
            <a href="?page=${list.number + 1}"
               class="link-dark link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">Next</a>
        [/#if]
    </div>

[/@c.page]