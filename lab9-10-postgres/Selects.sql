SET search_path TO theatre;

-- а. спектакли, в которых используются костюмы, имеющие в названии слово шут
select p.name, r.name, c.name
    from clothes_role cr
        join clothes c
            on cr.id_clothes = c.id_clothes
        join role r
            on cr.id_role = r.id_role
        join performance p
            on r.id_performance = p.id_performance
    where lower(c.name) like '%шут%';


-- б. костюм, в котором есть и куртка и штаны
select c.name, d.color, d.name, d2.name, d2.color
    from clothes c
        join clothes_detail cd on c.id_clothes = cd.id_clothes
        join detail d on d.id_detail = cd.id_detail

        join clothes_detail cd2 on c.id_clothes = cd2.id_detail
        join detail d2 on d2.id_detail = cd2.id_detail

     where d.name = '(Штаны)' and
           d2.name = '(Куртка)';


-- в. автор, разработавший самый старый из костюмов
select a.id_author, (author_fio).first_name
    from clothes_author ca
    join clothes c on c.id_clothes = ca.id_clothes
    join author a on a.id_author = ca.id_author
    where c.date >= all (select date from clothes);


-- г. спектаклю, к которому разработано наибольшее число костюмов
drop table if exists prc;
create temporary table prc as (
    select p.id_performance, p.name as performance_name,
           c.id_clothes, c.name as clothes_name
        from performance p
        join role r on p.id_performance = r.id_performance
        join clothes_role cr on r.id_role = cr.id_role
        join clothes c on c.id_clothes = cr.id_clothes
);
select * from prc;


select prc.performance_name,
       prc.id_performance,
       count(prc.id_clothes)
from prc
group by prc.id_performance, prc.performance_name
having count(id_clothes) = (
    select max(t.count_clothes) from (
        select count(id_clothes) as count_clothes from prc group by id_performance
    ) as t
);


-- д. автор, не разрабатывавший костюмы к «Золушке»
select (author_fio).first_name, a.id_author
    from author a
    where a.id_author not in

(select a.id_author
    from clothes_author ca
        join author a
            on a.id_author = ca.id_author
        join clothes c
            on c.id_clothes = ca.id_clothes
        join clothes_role cr
            on c.id_clothes = cr.id_clothes
        join role r
            on cr.id_role = r.id_role
        join performance p
            on r.id_performance = p.id_performance
    where lower(p.name) like lower('%Золушка%'));

-- ================================================================================

-- К предку и потомку
select d.id_detail, name, color, p.relname
from detail d, pg_class p
where d.TABLEOID = p.oid;


-- К потомку
select pr.id_detail, name, color, id_detail, p.relname
from props pr, pg_class p
where pr.TABLEOID = p.oid;


-- К предку
select d.id_detail, name, color, p.relname
from only detail d, pg_class p
where d.TABLEOID = p.oid;






insert into detail (name, color)
    values
           ('(test)',     'test'   );
