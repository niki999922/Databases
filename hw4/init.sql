create table Groups (
    group_id int primary key,
    group_name char(5) unique not null
);

create table Students (
    student_id int primary key,
    student_name varchar(50) not null,
    group_id int not null references Groups (group_id)
);
    
create table Courses (
    course_id int primary key,
    course_name varchar(100) not null
);

create table Lecturers (
    lecturer_id int primary key,
    lecturer_name varchar(50) not null
);

create table CourseGroups (
    group_id int references Groups (group_id),
    course_id int references Courses (course_id),
    lecturer_id int not null,
    primary key (group_id, course_id)
);

create table Marks (
    student_id int references Students (student_id),
    course_id int references Courses (course_id),
    mark_name char not null,
    primary key (student_id, course_id)
);