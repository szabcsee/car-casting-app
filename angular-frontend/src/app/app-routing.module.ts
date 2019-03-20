import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { HomepageComponent} from './homepage/homepage.component';
import { VehiclesComponent} from './vehicles/vehicles.component';

const routes: Routes = [
	{ path: '', redirectTo: './home', pathMatch: 'full' },
	{ path: 'home', component: HomepageComponent },
	{ path: 'vehicles', component: VehiclesComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
