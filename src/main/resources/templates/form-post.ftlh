[#ftl]
[#import "/spring.ftl" as spring]
[@c.page]
    <h1>Running blog</h1>
    <form class="formular" method="post">
        <div class="form-group">
            <label for="slug" class="radek">Slug:</label>

            <div class="input">[@spring.formInput path="post.slug" /]</div>
        </div>
        <div class="error">[@spring.showErrors "<br>"/]</div>

        <div class="form-group">
            <label for="author" class="radek">Author:</label>
            <div class="input">[@spring.formInput path="post.author" /]</div>
        </div>
        <div class="error">[@spring.showErrors "<br>"/]</div>

        <div class="form-group">
            <label for="title" class="radek">Title:</label>
            <div class="input">[@spring.formInput path="post.title" /]</div>
        </div>
        <div class="error">[@spring.showErrors "<br>"/]</div>

        <div class="form-group">
            <label for="perex" class="radek">Perex:</label>
            <div class="input">[@spring.formInput path="post.perex" /]</div>
        </div>
        <div class="error">[@spring.showErrors "<br>"/]</div>

        <div class="form-group">
            <label for="body" class="radek">Body:</label>
            <div class="input">[@spring.formInput path="post.body" /]</div>
        </div>
        <div class="error">[@spring.showErrors "<br>"/]</div>

        <div class="form-group">
            <label for="published" class="radek">Date of published:</label>
            <div class="input">[@spring.formInput path="post.published" fieldType="date"/]</div>
        </div>
        <div class="error">[@spring.showErrors "<br>"/]</div>

        <button type="submit" class="btn btn-outline-primary">Save</button>
    </form>

[/@c.page]