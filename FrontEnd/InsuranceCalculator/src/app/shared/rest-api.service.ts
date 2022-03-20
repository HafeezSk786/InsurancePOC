import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Employee } from '../shared/employee';
import { Observable, throwError } from 'rxjs';
import { retry, map, catchError } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class RestApiService {
  apiURL = 'https://localhost:5001/api/insurance/Calculate';
  constructor(private http: HttpClient) {}

  createEmployee(employee: Employee[]) {
    return this.http.post(this.apiURL,employee).
        pipe(
           map((data: any) => {
             return data;
           }), catchError( error => {
             return throwError( 'Something went wrong!' );
           })
        )
    }
  
}
