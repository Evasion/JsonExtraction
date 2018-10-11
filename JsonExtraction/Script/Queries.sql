 --Return a list of employees' names, and their manager's names (except the highest level employee who will have no manager - his or her manager should show "NULL" or empty).
  
  --Robin Hood is the highest ranking employee
  
   Select T1.Name as EmployeeName, T3.Name as ManagerName  from Employee T1 
   Left join Employee_Manager T2 on T1.EmployeeID =T2.EmployeeID
   Left Join Manager T5 on T5.ManagerID = T2.ManagerID
   Left join Employee T3 on T3.EmployeeID = T5.EmployeeID


   --Return a list of projects, and how many people are assigned to them
   
   Select T1.Name as ProjectName, Count(EmployeeID) as EmployeeCount from project T1
   join Employee_Project T2 on T1.ProjectID = T2.ProjectID
   group by T1.Name

   --Return the most senior person on the org chart assigned to a given project
  --an employee who does not have a manager is considered the most senior person.
  
   Select T1.*, T2.EmployeeID from Employee T1
   Left join Employee_Manager T2 on T1.EmployeeID = T2.EmployeeID
   join Employee_Project T3 on T1.EmployeeID= T3.EmployeeID
   where T2.EmployeeID is null
