Select * from department;
Select * from course;

DESCRIBE studentCourse;

Select d.name , count(d.id) AS NumberofCourses 
from department d left join course c 
on d.id = c.deptId 
group by d.id order by NumberofCourses , d.name ;


Select c.name AS COURSE_NAME, count(c.id) AS NumberOfStudent 
from course c left JOIN studentCourse sc 
on c.id = sc.courseId
GROUP BY c.id ORDER BY NumberOfStudent desc, COURSE_NAME;


Select c.name
from course AS c left JOIN facultyCourse as fc
on c.id = fc.courseId
GROUP BY c.id having count(fc.facultyId) = 0
ORDER BY c.name;

Select c.name,count(sc.studentId) AS numOFStudent 
from course AS c left join facultyCourse AS fc 
on c.id = fc.courseId
join studentCourse sc on c.id = sc.courseId 
GROUP BY c.id having count(fc.facultyId) = 0
ORDER BY numOFStudent desc,c.name;



Select count(distinct studentId) as Students, year(startDate) as Year 
from studentCourse 
group by Year 
order by Year,Students desc;

Select startDate,count(distinct studentId) as Students
from studentCourse 
group by startDate having month(startDate)= 8
order by startDate,Students ;

Select firstname,lastname,count(courseId) AS numCourses
from student left join studentCourse
on student.id = studentCourse.studentId
join course on courseId = course.id where course.deptId = majorId
Group By student.id 
Order By numCourses desc,firstname,lastname;

Select firstname,lastname,Round(avg(progress),1) AS avgProgress
from student join studentCourse 
on student.id = studentCourse.studentId
group by student.id having avgProgress < 50
Order By avgProgress desc,firstname,lastname;

Select course.name,Round(avg(progress),1) AS avgProgress
from course join studentCourse
on course.id = studentCourse.courseId 
group by studentCourse.courseId 
Order By avgProgress desc ,course.name LIMIT 1;


Select f.firstname,f.lastname,Round(avg(progress),1) AS avgProgress
from faculty f join facultyCourse fc
on f.id = fc.facultyId
join studentcourse sc on 
fc.courseId = sc.courseId
group by f.id 
Order By avgProgress desc ,firstname,lastname;


Select firstname,lastname,
CASE 
WHEN min(progress)< 40 THEN 'F'
WHEN min(progress)< 50 THEN 'D'
WHEN min(progress)< 60 THEN 'C'
WHEN min(progress)< 70 THEN 'B'
ELSE 'A'
END AS MINPROGRESS,

CASE 
WHEN Max(progress)<40 THEN 'F'
WHEN Max(progress)<50 THEN 'D'
WHEN Max(progress)<60 THEN 'C'
WHEN Max(progress)<70 THEN 'B'
ELSE 'A'
END AS MAXPROGRESS

FROM student s JOIN studentCourse sc
on s.id = sc.studentId
group by s.id
ORDER BY MINPROGRESS desc,MAXPROGRESS desc ,firstname,lastname;



