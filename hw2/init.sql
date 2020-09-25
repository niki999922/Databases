drop table if exists StudyGroups;
drop table if exists Students;
drop table if exists Subjects;
drop table if exists Teachers;
drop table if exists Marks;
drop table if exists TeacherSubject;

create table StudyGroups
(
    studyGroupId int primary key,
    studyGroupName char(5) not null,
    unique (studyGroupName)
);

create table Students
(
    studentId int primary key,
    studentName varchar(50) not null,
    email varchar(60),
    studyGroupId int not null references StudyGroups (studyGroupId)
);

create table Subjects
(
    subjectId int primary key,
    subjectName varchar(40) not null
);

create table Teachers
(
    teacherId int primary key,
    teacherName varchar(50) not null
);

create table Marks
(
    mark int not null,
    date date not null,
    subjectId int references Subjects (subjectId),
    studentId int references Students (studentId),
    primary key (subjectId, studentId)
);

create table TeacherSubject
(
    teacherId int references Teachers (teacherId),
    subjectId int references Subjects (subjectId),
    primary key (teacherId, subjectId)
);