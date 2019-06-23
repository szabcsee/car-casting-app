import {Routes, RouterModule} from "@angular/router";
import {CalcComponent} from "./calc/calc.component";
import {LoginComponent} from './login/login.component';
import {HomeComponent} from './home/home.component';
import {ForgotComponent} from "./forgot/forgot.component";
import {AngularTokenService} from "angular-token";
import {RegistrationComponent} from "@app/registration";

const routes: Routes = [
    {
        path: '',
        component: HomeComponent,
        canActivate: [AngularTokenService],
        pathMatch: 'full',
        children: [{
            path: "calc",
            component: CalcComponent,
            canActivate: [AngularTokenService]
        }]
    }, {
        path: "forgot-password",
        component: ForgotComponent
    }, {
        path: 'login',
        component: LoginComponent
    }, {
        path: 'registration',
        component: RegistrationComponent
    },
    // otherwise redirect to home
    {path: '**', redirectTo: ''}
];
export const routing = RouterModule.forRoot(routes);