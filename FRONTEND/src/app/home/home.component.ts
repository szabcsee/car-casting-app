import { Component, OnInit } from '@angular/core';
import { UserService } from '@app/_services';
import {AngularTokenService} from "angular-token";

@Component({
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {
    currentUser: any;

    constructor(
        private userService: UserService,
        private tokenService: AngularTokenService
    ) { }

    ngOnInit() {
        this.currentUser = JSON.parse(localStorage.getItem('currentUser'));
    }
}
