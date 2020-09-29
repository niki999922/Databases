insert into Groups
    (group_id, group_name) values
    (1, 'M3335'),
    (2, 'M3336'),
    (3, 'M3437'),
    (4, 'M3439');

insert into Students
    (student_id, student_name, group_id) values
    (1, 'Spartak', 1),
    (2, 'Nikita', 2),
    (3, 'Metrofan', 2),
    (4, 'Luffi', 4);

insert into Courses
    (course_id, course_name) values
    (1, 'Machine Learning'),
    (2, 'Software testing');

insert into Lecturers
    (lecturer_id, lecturer_name) values
    (1, 'Andrey Filchenkov'),
    (2, 'Konstantin Krohman');

insert into CourseGroups
    (group_id, course_id, lecturer_id) values
    (2, 2, 1),
    (1, 2, 2),
    (3, 2, 1);

insert into Marks
    (student_id, course_id, mark_name) values
    (1, 1, 'A'),
    (2, 1, 'B'),
    (3, 1, 'C'),
    (4, 2, 'A');