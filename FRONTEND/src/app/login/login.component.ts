import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import {AngularTokenService} from "angular-token";

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html'
})
export class LoginComponent implements OnInit {
  loginForm: FormGroup;
  loading = false;
  submitted = false;
  returnUrl: string;
  error = '';

  constructor(
    private formBuilder: FormBuilder,
    private route: ActivatedRoute,
    private router: Router,
    private tokenService: AngularTokenService
  ) { }

  ngOnInit() {
    this.loginForm = this.formBuilder.group({
      username: ['', Validators.required],
      password: ['', Validators.required]
    });
    // reset login status


    // get return url from route parameters or default to '/'
    this.returnUrl = this.route.snapshot.queryParams['returnUrl'] || '/';
  }
  
  // convenience getter for easy access to form fields
  get f() { return this.loginForm.controls; }

  onSubmit() {
    let me = this;
    me.submitted = true;

    // stop here if form is invalid
    if (me.loginForm.invalid) {
        return;
    }

    me.loading = true;
    me.tokenService.signIn({login: this.f.username.value, password: this.f.password.value})
        .subscribe(
        res => {
          debugger;
          localStorage.setItem('currentUserData', JSON.stringify(me.tokenService.currentUserData));
          me.router.navigateByUrl(this.returnUrl);
        },
        error =>    {
          me.error = error;
          me.loginForm.reset();
        }
    );
  }
}
