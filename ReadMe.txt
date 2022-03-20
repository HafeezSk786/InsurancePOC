This project has 3 parts:
1) script.sql file which has all the script to create database and tables with data.
2) Backend Folder: This folder contains the Web API developed in .net core which has a controller to calculate the premium
and add an employee to db.
3) FrontEnd Folder: This folder contains the Angular 13 project which contains the  front end logic to display the data 
from web api.

I am not checking in the "node_modules" folder. So I would request the team to do the following:

a) Go to the copied angular directory.
b) run "npm install" to get all the node_modules
c) run ng build/ng serve to run the application.

Please note the following:

Web api would run on "https://localhost:5001" in your local machine.

Complete url with the controller is "https://localhost:5001/api/insurance/Calculate"

Angular application url: "http://localhost:4200"


Please feel free to reach to me for any further information.

Thanks
Hafeez Shaik