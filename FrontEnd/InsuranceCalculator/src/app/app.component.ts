import { Component, OnInit} from '@angular/core';
import { FormGroup, FormBuilder, Validators, FormControl} from '@angular/forms';
import { HttpClient } from '@angular/common/http';
import { RestApiService } from './shared/rest-api.service';
import { Employee } from './shared/employee'; 

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {
  title = 'Insurance Premium Calculator';
  selectedDay: string = '';
  employee: any = {};
  // form: FormGroup;
  occupationList = ['Author', 'Cleaner', 'Doctor', 'Farmer', 'Florist', 'Mechanic']
  form = new FormGroup({
    Occupation: new FormControl('', Validators.required)
  });

  constructor(public fb: FormBuilder, private http: HttpClient,private employeeserv : RestApiService) {
    this.form = this.fb.group({
      name: ['', Validators.required],
      age: ['', Validators.required],
      dob: ['', Validators.required],
      occupation: ['', Validators.required],
      suminsured: ['', Validators.required],
    });
  }

  ngOnInit() {
    
  }

  //event handler for the select element's change event
  selectChangeHandler (event: any) {
    //update the ui
    this.selectedDay = event.target.value;
  }

  onSubmit() {
    var formData: any = new FormData();
    formData.append('name', this.form.get('name')?.value);
    formData.append('age', this.form.get('age')?.value);
    formData.append('dob', this.form.get('dob')?.value);
    formData.append('occupation', this.selectedDay);
    formData.append('suminsured', this.form.get('suminsured')?.value);
    console.log('Valid?', this.form.valid); // true or false
    console.log('Name', this.form.value.name);
    console.log('age', this.form.value.age);
    console.log('dob', this.form.value.dob);
    console.log('occupation', this.form.value.occupation);
    console.log('suminsured', this.form.value.suminsured);
    
    // this.http
    //   .post('https://localhost:5001/api/insurance/Calculate', formData)
    //   .subscribe({
    //     next: (response) => console.log(response),
    //     error: (error) => console.log(error),
    //   });

      this.employeeserv.createEmployee(formData).subscribe((res)=>{
        this.employee = res;
      });
  }
}
