create table if not exists Clothes (
    id_clothes int not null auto_increment primary key,
    nameClothes varchar(40) not null,
    dataCreate date not null,
    sizeClothes int not null
);

create table if not exists Performance(
    id_performance int not null auto_increment primary key,

    namePerformance varchar(40) not null,
    datePerformance date not null
);

create table if not exists Role (
    id_role int not null auto_increment primary key,

    id_performance int not null,
    FOREIGN KEY (id_performance) REFERENCES Performance (id_performance)
        on delete cascade
        on update restrict,

    nameRole varchar(40)
);

create table if not exists Author (
    id_author int not null auto_increment primary key,

    firstNameAuthor varchar(40) default null,
    secondNameAuthor varchar(40) default null,
    thirdNameAuthor varchar(40) default null
);

create table if not exists Type_Detail (
    id_type_detail int not null auto_increment primary key,

    nameType varchar(20)
);

create table if not exists Concrete_Detail (
    id_concrete_detail int not null auto_increment primary key,

    id_type_detail int not null,
    constraint FOREIGN KEY (id_type_detail)
    REFERENCES Type_Detail (id_type_detail)
        on delete cascade
        on update cascade,

    colorDetail varchar(20)
);

create table if not exists Clothes_Role (
    id_clothes int not null ,
    FOREIGN KEY (id_clothes) REFERENCES Clothes (id_clothes)
        on delete cascade
        on update cascade,

    id_role int not null ,
    FOREIGN KEY (id_role) REFERENCES Role (id_role)
        on delete cascade
        on update cascade
);

create table if not exists Clothes_Author (
    id_clothes int not null,
    FOREIGN KEY (id_clothes) REFERENCES Clothes (id_clothes)
        on delete cascade
        on update restrict,

    id_author int not null,
    FOREIGN KEY (id_author) REFERENCES Author (id_author)
        on delete restrict
        on update restrict
);

create table if not exists Clothes_Concrete_Detail (
    id_clothes int not null,
    FOREIGN KEY (id_clothes) REFERENCES Clothes (id_clothes)
        on delete cascade
        on update cascade,

    id_concrete_detail int not null,
    FOREIGN KEY (id_concrete_detail) REFERENCES Concrete_Detail (id_concrete_detail)
        on delete cascade
        on update cascade
);

