Select AVG(grade) as average_grade From Grades;

Select AVG(grade) as student_1_average_grade from Grades
where student_id = 1;

Select AVG(grade) as Bel_average_grade From Grades
Where grade_name = 'Bel';

Select AVG(grade) as Math_average_grade From Grades
Where grade_name = 'Math';

Select AVG(grade) as Subd_average_grade From Grades
Where grade_name = 'Subd';

Select Student.name, Grades.grade_name, Grades.grade from Student
left join Grades on Student.id = Grades.student_id;



