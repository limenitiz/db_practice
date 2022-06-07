SET search_path TO theatre;

drop table if exists role_props cascade ;
drop table if exists clothes_detail cascade ;
drop table if exists clothes_author cascade ;
drop table if exists clothes_role cascade ;
drop table if exists props cascade ;
drop table if exists detail cascade ;
drop type if exists name_detail cascade ;
drop type if exists author_fio cascade ;
drop table if exists theatre.author cascade ;
drop table if exists role cascade ;
drop table if exists performance cascade ;
drop table if exists clothes cascade ;
drop table if exists clothes_props cascade ;

create table clothes (
    id_clothes serial primary key,
    name varchar(50) not null,
    date date not null,
    size int not null
);

create table performance (
    id_performance serial primary key,
    name varchar(40) not null,
    date date not null
);

create table role (
    id_role serial primary key,
    name varchar(50),
    id_performance int not null,
    foreign key (id_performance) references performance (id_performance)
);

create type author_fio AS (
    first_name varchar(40),
    second_name varchar(40),
    third_name varchar(40)
);

create table author (
    id_author serial primary key,
    author_fio author_fio
);

create type name_detail AS (
    name varchar(100)
);

create table detail (
    id_detail serial primary key,
    name name_detail,
    color varchar(50)
);

create table props (
    primary key (id_detail)
) inherits (detail);

create table clothes_role (
    id_clothes int,
    id_role int,
    foreign key (id_clothes) references clothes (id_clothes),
    foreign key (id_role) references role (id_role),

    primary key (id_clothes, id_role)
);

create table clothes_author (
    id_clothes int,
    id_author int,
    foreign key (id_clothes) references clothes (id_clothes),
    foreign key (id_author) references author (id_author),

    primary key (id_clothes, id_author)
);

create table clothes_detail (
    id_clothes int,
    id_detail int default null,
    foreign key (id_clothes) references clothes (id_clothes),
    foreign key (id_detail) references detail (id_detail),

    primary key (id_clothes, id_detail)
);

create table role_props (
    id_role int,
    id_props int,
    foreign key (id_role) references role (id_role),
    foreign key (id_props) references props (id_detail),

    primary key (id_props, id_role)
);

create table clothes_props(
    id_clothes int,
    id_props int,
    foreign key (id_clothes) references clothes (id_clothes),
    foreign key (id_props) references props (id_detail),

    primary key (id_clothes, id_props)
);


