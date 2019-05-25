import { NgModule } from "@angular/core";
import { Routes, RouterModule } from "@angular/router";

import { MainLayoutComponent } from "./shared/layout/app-layouts/main-layout.component";
import { CalcComponent } from "./calc/calc.component";
import { LoginComponent } from './login/login.component';
import { HomeComponent } from './home/home.component';
import { AuthGuard } from './_guards';
import { ForgotComponent } from "./forgot/forgot.component";

const routes: Routes = [
  {
    path: "",
    component: MainLayoutComponent,
    children: [
      {
        path: '',
        component: HomeComponent,
        canActivate: [AuthGuard]
      },
      {
        path: "calc",
        component: CalcComponent
      },
      {
        path: "forgot-password",
        component: ForgotComponent
      }
    ]
  },
  {
    path: 'login',
    component: LoginComponent
  },
  // otherwise redirect to home
  { path: '**', redirectTo: '' }
];
export const routing = RouterModule.forRoot(routes);