Create Database Tekskillup
Use Tekskillup


--Checking to ensure all table are imported
select * from sys.tables


--Dropping all unwanted columns 
Alter table StudentVle_Processed
Drop Column Column1 

Alter table Vle
Drop Column week_from, week_to

Alter table StudentAssessment
Drop Column Date_Submitted



--Checking and updating for imd_band fields without '%' 
Select * From StudentInfo
Where Imd_band Not Like '%[%]%'

Update StudentInfo
set imd_band =  Replace (imd_band, '10-20', '10-20%') 
From StudentInfo



--Filling and updating of missing values
Update StudentInfo
Set imd_band =
isnull(imd_band, '0%')  From StudentInfo



--Adding and updating a column to studentassessment 
Alter Table Studentassessment
Add score_grade Char

Update StudentAssessment
Set score_grade = 
Case
When score Between 70 And 100 Then 'A'
when score Between 60 And 69 Then 'B'
When score Between 50 And 59 Then 'C'
when score Between 45 And 49 Then 'D'
Else 'F'
End 
From studentassessment



--Updating and replacing Gender Acronym in StudentInfo
Update StudentInfo
Set Gender =  
Case
When Gender = 'M' Then 'Male'
When Gender = 'F' Then 'Female'
Else ''
End
From StudentInfo



--Total Number of Student
Select Count(Distinct id_student) As total_student from StudentInfo

--Total Number of Region
Select Count (distinct region) As total_region from StudentInfo

--Total Number of ID-Site
Select count(Distinct id_site) As total_site from vle

--Total Number of Sum-Click
Select Count (sum_click) As total_clicks From StudentVle_Processed



--Categorizing results based on Gender
Select Gender, final_result, count(*) As result_by_count from StudentInfo
Where code_module = 'AAA'
Group by Gender, final_result



--Categorizing the top 3 results by education
Select top(3) highest_education, final_result, count(*) As result_by_education from StudentInfo
where final_result = 'Distinction' And code_module = 'AAA'
Group by highest_education, final_result
Order by result_by_education desc



--Categorizing the worst 3 results by education
Select top(3) highest_education, final_result, count(*) As result_by_education from StudentInfo
where final_result = 'fail' And code_module = 'AAA'
Group by highest_education, final_result
Order by result_by_education Desc



--Categorizing the worst 3 results by region
Select top(3) region, final_result, count(*) As result_by_region from StudentInfo
where final_result = 'fail' And code_module = 'AAA'
Group by region, final_result
Order by result_by_region desc



--Categorizing the best 3 results by region
Select top(3) region, final_result, count(*) As result_by_region from StudentInfo
where final_result = 'distinction' And code_module = 'AAA'
Group by region, final_result
Order by result_by_region Desc



----Activity_type by Score_grade
Select id_site, sum_click, activity_type, score_grade
from
(Select svp.id_site, svp.sum_click, v.activity_type, sa.score_grade
From Vle As v Left Join Courses As c
on v.code_presentation = c.code_presentation
Right Join StudentVle_processed As svp
on svp.id_site = v.id_site
Left Join StudentInfo As si
on si.id_student = svp.id_student
Right Join StudentAssessment As sa
on sa.id_student = si.id_student
Where c.code_module = 'AAA'
Order by score_grade Desc
offset 0 rows fetch next 10 rows only
) as Student_results



--Using CTE to know the number of student that unregistered and those still registered
With StudentReg
As
(Select code_module, date_unregistration from StudentRegistration)
Select * into #Temp_student From StudentReg
Select date_unregistration, COUNT(*) As Student_Available From #Temp_student
Where date_unregistration is Null And code_module = 'AAA'
Group by date_unregistration;
Select count(date_unregistration) As Student_Gone from #Temp_student
where date_unregistration is not Null And code_module = 'AAA'



--Using Derived Table to know how age_band affects result
Select age_band, score_grade, count(*) As result_count from
(
select Si.code_module, Si.age_band, Sa.score_grade  
from studentinfo As si Join StudentAssessment As sa
on si.id_student = sa.id_student
)
As Age_Category
Where code_module = 'AAA'
Group by age_band, score_grade


