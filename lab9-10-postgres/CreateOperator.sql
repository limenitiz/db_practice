SET search_path TO theatre;

create or replace function
    is_equal_name_detail_with_varchar(td name_detail, str varchar)
    returns boolean as
        $$ select cast($1 as varchar(100))
                      = concat('(', str, ')'); $$ language SQL;

create or replace function
    is_equal_name_details(td1 name_detail, td2 name_detail)
    returns boolean as
        $$ select cast($1 as varchar(100))
              = cast($2 as varchar(100)); $$ language SQL;

create operator = (
    leftarg = name_detail,
    rightarg = varchar,
    procedure = is_equal_name_detail_with_varchar
);

create operator = (
    leftarg = name_detail,
    rightarg = name_detail,
    procedure = is_equal_name_details,
    commutator = =
);

-- =================================
-- tests

select is_equal_name_detail_with_varchar('(test)','test');
select not is_equal_name_detail_with_varchar('(test)','(test)');
select is_equal_name_details('(test)', '(test)');

select cast('(test)' as name_detail)
           =
       cast('test' as varchar);

select cast('(test)' as name_detail)
           =
       cast('(test)' as name_detail);

