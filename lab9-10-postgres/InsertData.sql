SET search_path TO theatre;

insert into performance (date, name)
    values
           ('2021-10-11',   'Представление с шутом'                 ),
           ('2021-10-12',   'Представление с королем'               ),
           ('2021-10-13',   'Представление (без ролей и одежды)'    ),
           ('2021-10-18',   'Золушка'                               ),
           ('2021-10-19',   'Мастер и Маргарита'                    ),
           ('2021-10-20',   'Представление (с ролями и без одежды)' );


insert into author (author_fio)
    values
           ('(Имя 1, Фамилия 1, Отчество 1)'),
           ('(Имя 2, Фамилия 2, Отчество 2)'),
           ('(Имя 3, Фамилия 3, Отчество 3)'),
           ('(Имя 4, Фамилия 4, Отчество 4)');


insert into clothes (name, date, size)
    values
           ('Шут',               '2020-12-11',  30),
           ('Маленький король',  '2020-12-14',  30),
           ('Платье Золушки',    '2020-12-10',  25),
           ('Костюм Мастера',    '2020-12-13',  30),
           ('Костюм Маргариты',  '2020-12-09',  25);


insert into role (id_performance, name)
    values
           ((select id_performance
           from performance where name like 'Представление с шутом'),
                                            'Роль шута'),

           ((select id_performance
           from performance where name like 'Представление с королем'),
                                            'Роль короля'),

           ((select id_performance
           from performance where name like 'Золушка'),
                                            'Золушка'),

           ((select id_performance
           from performance where name like 'Мастер и Маргарита'),
                                            'Мастер'),

           ((select id_performance
           from performance where name like 'Мастер и Маргарита'),
                                            'Маргарита'),

           ((select id_performance
           from performance where name like 'Представление (с ролями и без одежды)'),
                                            'Роль для пустого представления');


insert into detail (name, color)
    values
           ('(Куртка)',     'Черный'   ),
           ('(Куртка)',     'Белый'    ),
           ('(Куртка)',     'Серый'    ),
           ('(Штаны)',      'Черный'   ),
           ('(Штаны)',      'Белый'    ),
           ('(Штаны)',      'Серый'    ),
           ('(Шляпа)',      'Черный'   ),
           ('(Шляпа)',      'Красный'  ),
           ('(Шляпа)',      'Желтый'   ),
           ('(Шляпа)',      'Белый'    ),
           ('(Шляпа)',      'Серый'    ),
           ('(Брюки)',      'Черный'   ),
           ('(Брюки)',      'Белый'    ),
           ('(Брюки)',      'Серый'    ),
           ('(Цилиндр)',    'Черный'   ),
           ('(Цилиндр)',    'Белый'    ),
           ('(Цилиндр)',    'Серый'    ),
           ('(Ботинки)',    'Черный'   ),
           ('(Ботинки)',    'Белый'    ),
           ('(Ботинки)',    'Серый'    );


insert into props (name, color)
    values
               ('(Жезл)',     'Золотой'     ),
               ('(Жезл)',     'Серебрянный' ),
               ('(Посох)',    'Золотой'     ),
               ('(Посох)',    'Серебрянный' ),
               ('(Трон)',     'Золотой'     ),
               ('(Трон)',     'Серебрянный' ),
               ('(Туфли)',    'Хрусталь'    );


insert into clothes_author (id_clothes, id_author)
    values
           ((select id_clothes from clothes where name like 'Шут'),
            (select id_author from author where (author_fio).first_name like 'Имя 1')),

           ((select id_clothes from clothes where name like 'Маленький король'),
            (select id_author from author where (author_fio).first_name like 'Имя 2')),

           ((select id_clothes from clothes where name like 'Платье Золушки'),
            (select id_author from author where (author_fio).first_name like 'Имя 2')),

           ((select id_clothes from clothes where name like 'Костюм Мастера'),
            (select id_author from author where (author_fio).first_name like 'Имя 2')),

           ((select id_clothes from clothes where name like 'Костюм Мастера'),
            (select id_author from author where (author_fio).first_name like 'Имя 3')),

           ((select id_clothes from clothes where name like 'Костюм Маргариты'),
            (select id_author from author where (author_fio).first_name like 'Имя 2'));


insert into clothes_detail (id_clothes, id_detail)
values
       ((select id_clothes from clothes where name like 'Шут'),
        (select id_detail from detail where name = cast('Куртка' as varchar)
                                            and color = 'Черный')),

       ((select id_clothes from clothes where name like 'Шут'),
        (select id_detail from detail where name = cast('Штаны' as varchar)
                                            and color = 'Черный')),

       ((select id_clothes from clothes where name like 'Шут'),
        (select id_detail from detail where name = cast('Шляпа' as varchar)
                                            and color = 'Черный')),

       ((select id_clothes from clothes where name like 'Шут'),
        (select id_detail from detail where name = cast('Брюки' as varchar)
                                            and color = 'Черный')),

       ((select id_clothes from clothes where name like 'Шут'),
        (select id_detail from detail where name = cast('Цилиндр' as varchar)
                                            and color = 'Черный')),

       ((select id_clothes from clothes where name like 'Шут'),
        (select id_detail from detail where name = cast('Ботинки' as varchar)
                                            and color = 'Черный')),

       ((select id_clothes from clothes where name like 'Маленький король'),
        (select id_detail from detail where name = cast('Куртка' as varchar)
                                            and color = 'Белый')),

       ((select id_clothes from clothes where name like 'Маленький король'),
        (select id_detail from detail where name = cast('Шляпа' as varchar)
                                            and color = 'Белый')),

       ((select id_clothes from clothes where name like 'Маленький король'),
        (select id_detail from detail where name = cast('Ботинки' as varchar)
                                            and color = 'Белый')),

       ((select id_clothes from clothes where name like 'Маленький король'),
        (select id_detail from detail where name = cast('Штаны' as varchar)
                                            and color = 'Белый')),

       ((select id_clothes from clothes where name like 'Платье Золушки'),
        (select id_detail from detail where name = cast('Куртка' as varchar)
                                            and color = 'Серый')),

       ((select id_clothes from clothes where name like 'Костюм Мастера'),
        (select id_detail from detail where name = cast('Штаны' as varchar)
                                            and color = 'Черный')),

       ((select id_clothes from clothes where name like 'Костюм Маргариты'),
        (select id_detail from detail where name = cast('Штаны' as varchar)
                                            and color = 'Серый'));


-- Добавить props для role
insert into role_props (id_role, id_props)
values
       ((select id_role from role where name like 'Золушка'),
        (select id_detail from props p where name = cast('Туфли' as varchar)
                                            and color = 'Хрусталь')),

       ((select id_role from role where name like 'Мастер'),
        (select id_detail from props p where name = cast('Жезл' as varchar)
                                            and color = 'Золотой')),

       ((select id_role from role where name like 'Роль шута'),
        (select id_detail from props p where name = cast('Жезл' as varchar)
                                            and color = 'Серебрянный'));


-- Добавить props для clothes
insert into clothes_props (id_clothes, id_props)
values
       ((select id_clothes from clothes where name like 'Платье Золушки'),
        (select id_detail from props where name = cast('Туфли' as varchar)
                                            and color = 'Хрусталь')),

       ((select id_clothes from clothes where name like 'Костюм Мастера'),
        (select id_detail from props where name = cast('Жезл' as varchar)
                                            and color = 'Золотой')),

       ((select id_clothes from clothes where name like 'Шут'),
        (select id_detail from props where name = cast('Жезл' as varchar)
                                            and color = 'Серебрянный'));


insert into clothes_role (id_clothes, id_role)
    values ((select id_clothes from clothes where name like 'Шут'),
            (select id_role from role where name like 'Роль шута')),

           ((select id_clothes from clothes where name like 'Маленький король'),
            (select id_role from role where name like 'Роль короля')),

           ((select id_clothes from clothes where name like 'Платье Золушки'),
            (select id_role from role where name like 'Золушка')),

           ((select id_clothes from clothes where name like 'Костюм Мастера'),
            (select id_role from role where name like 'Мастер')),

           ((select id_clothes from clothes where name like 'Костюм Маргариты'),
            (select id_role from role where name like 'Маргарита'));


