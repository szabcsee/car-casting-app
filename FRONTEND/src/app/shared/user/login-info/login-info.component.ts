import {Component, OnInit} from '@angular/core';
import { LayoutService } from '@app/core/services/layout.service';
import {AngularTokenService} from "angular-token";

@Component({

  selector: 'sa-login-info',
  templateUrl: './login-info.component.html',
})
export class LoginInfoComponent implements OnInit {
  private currentUser;

  constructor(
      private layoutService: LayoutService,
      private tokenService: AngularTokenService) {
  }

  ngOnInit() {
    this.currentUser = this.tokenService.currentUserData ? this.tokenService.currentUserData : JSON.parse(localStorage.getItem('currentUserData'));
  }

  toggleShortcut() {
    this.layoutService.onShortcutToggle()
  }

}
