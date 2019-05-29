import {Component} from '@angular/core';
import {AngularTokenService} from "angular-token";


@Component({
    selector: 'app-root',
    template: '<router-outlet></router-outlet>',
})
export class AppComponent {
    title = 'sa';
    public tokenService: AngularTokenService;

    constructor(tokenService: AngularTokenService) {
        this.tokenService = tokenService;
    }
}
