import { Component, OnInit, TemplateRef } from '@angular/core';
import {ActivatedRoute, Router} from "@angular/router";
import { BsModalService } from 'ngx-bootstrap/modal';
import { BsModalRef } from 'ngx-bootstrap/modal/bs-modal-ref.service';
import {FormBuilder, FormGroup, Validators} from "@angular/forms";
import {AngularTokenService} from "angular-token";

@Component({
  selector: 'app-register',
  templateUrl: './registration.component.html',
  styles: []
})
export class RegistrationComponent implements OnInit {
  registrationForm: FormGroup;
  submitted = false;
  bsModalRef: BsModalRef;

  constructor(
      private formBuilder: FormBuilder,
      private route: ActivatedRoute,
      private router: Router,
      private tokenService: AngularTokenService,
      private modalService: BsModalService
  ) {}
 
   ngOnInit() {
     this.registrationForm = this.formBuilder.group({
       firstname: ['', Validators.required],
       lastname: ['', Validators.required],
       email: ['', Validators.email],
       password: ['', Validators.required, Validators.minLength(6)],
       passwordConfirmation: ['', Validators.required, Validators.minLength(6)]
     });
   }
  // convenience getter for easy access to form fields
  get f() { return this.registrationForm.controls; }

  onSignUpSubmit(){
    let me = this;
    me.submitted = true;

    event.preventDefault();
    this.tokenService.registerAccount(
        {
          firstname: this.f.firstname.value,
          lastname: this.f.lastname.value,
          password: this.f.password.value,
          passwordConfirmation: this.f.passwordConfirmation.value,
          login: this.f.email.value
        }).subscribe(
        res =>      console.log(res),
        error =>    console.log(error)
    );
    //this.router.navigate(['/dashboard'])
  }

  openModal(event, template: TemplateRef<any>) {
    event.preventDefault();
    this.bsModalRef = this.modalService.show(template);
  }

  onTermsAgree(){
    this.bsModalRef.hide()
  }

  onTermsClose(){
    this.bsModalRef.hide()
  }
}
