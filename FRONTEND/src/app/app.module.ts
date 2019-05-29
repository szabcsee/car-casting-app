import { BrowserModule } from '@angular/platform-browser';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { NgModule } from '@angular/core';
import { environment} from "@env/environment";
import { AppComponent } from './app.component';
import { routing } from './app-routing.module';
import { CoreModule } from './core/core.module';
import { SharedModule } from './shared/shared.module';
import { CalcModule } from './calc/calc.module';
import { HomeComponent } from './home/';
import { LoginComponent } from './login/';
import { ForgotComponent } from './forgot/forgot.component';
import {AngularTokenModule, AngularTokenService} from "angular-token";
import {RegistrationComponent} from './registration/';


@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    LoginComponent,
    ForgotComponent,
    RegistrationComponent
  ],
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    routing,
    BrowserModule,
    FormsModule,
    ReactiveFormsModule,
    HttpClientModule,
    SharedModule,
    CoreModule,
    CalcModule,
    AngularTokenModule.forRoot({
          apiBase: environment.token_auth_config.apiBase,
          userTypes: [
                { name: 'ADMIN', path: 'admin' },
                { name: 'USER', path: 'user' }],
          signInRedirect: '/login',
          signOutPath: '/auth/sign_out'
    })
  ],
  providers: [
    AngularTokenModule,
    AngularTokenService
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
