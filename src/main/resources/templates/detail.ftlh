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
<form method="get">
<div>${post.title}</div>
    <div>${post.perex?no_esc}</div>
    <div>${post.body?no_esc}</div>
    <div>${post.author}</div>
    <div>${post.published?date}</div>
</form>
</body>
</html>
