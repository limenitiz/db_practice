SET search_path TO theatre;

create or replace function
    count_name_details(name_detail)
    returns int language sql as
    $$
        select count(d.name)
        from detail d
        where d.name = $1
        group by d.name;
    $$;

create or replace function
    is_left_larger(td1 name_detail, td2 name_detail)
    returns boolean language sql as
    $$
        select count_name_details($1) > count_name_details($2);
    $$;


create operator > (
    leftarg = name_detail,
    rightarg = name_detail,
    procedure = is_left_larger,
    commutator = >
);


create or replace function max_name_detail(nd1 name_detail, nd2 name_detail)
    returns name_detail language sql as
    $$
        select case
            when nd1 > nd2
                then nd1
                else nd2
        end;
    $$;


create aggregate max_name_details (name_detail) (
    sfunc = max_name_detail,
    stype = name_detail
);

-- max_detail = 0;
-- for (d in detail) {
--     // compare
-- }


select max_name_details(d.name) from detail d;

select * from detail;

select d.name, count(d.name) as c
    from detail d
    group by d.name
    order by c desc;



