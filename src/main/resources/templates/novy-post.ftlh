[#ftl]
[#import "/spring.ftl" as spring]
[@c.page]
    <h1>Blog o běhu</h1>
   <form class="formular" method="post" action="/novy">
       <div class="form-group">
           <label for="slug" class="radek">Slug:</label>

           <div class="input">[@spring.formInput path="post.slug" /]</div>
       </div>
       <div class="error">[@spring.showErrors "<br>"/]</div>

       <div class="form-group">
           <label for="author" class="radek">Autor:</label>
           <div class="input">[@spring.formInput path="post.author" /]</div>
       </div>
       <div class="error">[@spring.showErrors "<br>"/]</div>

       <div class="form-group">
           <label for="title" class="radek">Titulek:</label>
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
           <label for="published" class="radek">Datum publikace:</label>
           <div class="input">[@spring.formInput path="post.published" fieldType="date"/]</div>
       </div>
       <div class="error">[@spring.showErrors "<br>"/]</div>

       <button class="tlacitko" type="submit">Ulozit</button>
   </form>

[/@c.page]