import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { HomepageComponent} from './homepage/homepage.component';
import { VehiclesListComponent} from './vehicles/vehicles-list.component';
import { RegistrationComponent} from './registration/registration.component';

const routes: Routes = [
	{ path: '', redirectTo: './home', pathMatch: 'full' },
	{ path: 'home', component: HomepageComponent },
	{ path: 'vehicles', component: VehiclesListComponent },
	{ path: 'registration', component: RegistrationComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
