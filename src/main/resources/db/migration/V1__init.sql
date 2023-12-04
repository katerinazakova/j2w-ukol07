CREATE TABLE post
(
    id IDENTITY,
    slug      VARCHAR(100) NOT NULL UNIQUE,
    author    VARCHAR(100) NOT NULL,
    title     VARCHAR(255) NOT NULL,
    perex     TEXT         NOT NULL,
    body      TEXT         NOT NULL,
    published DATE
);

INSERT INTO post (slug, author, title, perex, body, published)
VALUES ('rizika-nizke-energeticke-dostupnosti-netykaji-se-vas-take','Martin Dřímal','Rizika nízké energetické dostupnosti: netýkají se vás také?','<p>Perfektní kondice, nízké procento tuku a neustálá motivace k tréninkům je snem nejen každého sportovce. I snaha o zdravý životní styl, zahnaná do extrémů, však může mít negativní dopady.</p>', '<h1>CO JE TO ENERGETICKÁ DOSTUPNOST?</h1>
<p>Energetická dostupnost (angl. EA, energy availability) se používá pro popis energie, kterou má tělo volně k dispozici pro pokrytí aktuálních potřeb. Jedná se o rozdíl přijatých kalorií ze stravy a kalorií vydaných na sportovní výkon; vztahuje se na beztukovou hmotnost těla.</p>

<p>Optimální hodnota EA u žen by se měla pohybovat kolem 45, u mužů kolem 40. U žádného z pohlaví by neměla klesat pod 30. Výzkumy však ukazují, že u profesionálních sportovců konkrétních odvětví EA nedosahuje hodnoty 30 téměř nikdy. Trend zdravého životního stylu šíří tuto potíž i mezi rekreačně sportující populaci. Nízká energetická dostupnost představuje přitom vážná zdravotní rizika, a to u mužské i ženské populace.</p>','2023-11-20');

CREATE
    INDEX ON post(published);
