import { Component, OnInit } from '@angular/core';
import { UserService } from '@app/_services';
import {AngularTokenService} from "angular-token";
import {Router} from "@angular/router";

@Component({
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {
    currentUser: any;

    constructor(
        private userService: UserService,
        private tokenService: AngularTokenService,
        private router: Router
    ) { }

    ngOnInit() {
        this.currentUser = this.tokenService.currentUserData ? this.tokenService.currentUserData : JSON.parse(localStorage.getItem('currentUserData'));
        if (!this.currentUser) {
            this.router.navigateByUrl('/login');
        }
    }
}
