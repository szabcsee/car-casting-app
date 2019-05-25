import { Component, OnInit } from '@angular/core';
import { first } from 'rxjs/operators';

import { User } from '@app/_models';
import { UserService } from '@app/_services';
import {AngularTokenService} from "angular-token";

@Component({
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {
    users: User[] = [];

    constructor(
        private userService: UserService,
        private tokenService: AngularTokenService
    ) { }

    ngOnInit() {
        //this.userService.getAll().pipe(first()).subscribe(users => {
        //    this.users = users;
        //});
    }
}
