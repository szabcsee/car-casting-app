import {Component} from '@angular/core';
import {Router} from '@angular/router';
import {User} from './_models';
import {AngularTokenService} from "angular-token";


@Component({
    selector: 'app-root',
    template: '<router-outlet></router-outlet>',
})
export class AppComponent {
    title = 'sa';

    constructor(
        private router: Router,
        private tokenService: AngularTokenService
    ) {

    }

    logout() {
        this.tokenService.signOut().subscribe(
            res => console.log(res),
            error => console.log(error)
        );
        this.router.navigate(['/login']);
    }
}
