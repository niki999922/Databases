insert into StudyGroups 
    (studyGroupId, studyGroupName) values 
    (1, 'M3435'),
    (2, 'M3436'),
    (3, 'M3437'),
    (4, 'M3438'),
    (5, 'M3439');

insert into Students 
    (studentId, studentName, email, studyGroupId) values 
    (1, 'Kochetkov Nikita', 'niki999922@yandex.ru', 4),
    (2, 'Baykalov Vladimir', 'best-mail@yandex.ru', 4),
    (3, 'Selezneva Ulia', null, 5),
    (4, 'Burtseva Polina', 'Tv1nG-72rus@bk.com', 1),
    (5, 'Ignatieva Daria', null, 2);

insert into Subjects
    (subjectId, subjectName) values 
    (1, 'Math'),
    (2, 'Algo'),
    (3, 'MPP'),
    (4, 'ML');

insert into Teachers 
    (teacherId, teacherName) values 
    (1, 'Baranov Oleg'),
    (2, 'Speliy Timur'),
    (3, 'Tropic Artemiy');

insert into TeacherSubject 
    (teacherId, subjectId) values 
    (1, 1),
    (2, 2),
    (2, 3),
    (3, 4);

insert into Marks 
    (mark, date, subjectId, studentId) values
    (5, '2020-05-23', 1, 1),
    (5, '2020-05-23', 4, 1),
    (5, '2020-05-23', 2, 2),
    (3, '2020-05-25', 3, 3),
    (2, '2020-06-23', 2, 3),
    (4, '2020-08-12', 2, 4),
    (5, '2020-08-12', 1, 5);
    