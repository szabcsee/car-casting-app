import {Component} from '@angular/core';
import {AngularTokenService} from "angular-token";
import {NavbarComponent} from "@app/navbar/navbar.component";

@Component({
    selector: 'app-root',
    templateUrl: './app.component.html',
})
export class AppComponent {
    title = 'sa';
    public tokenService: AngularTokenService;

    constructor(tokenService: AngularTokenService) {
        this.tokenService = tokenService;
    }
}
