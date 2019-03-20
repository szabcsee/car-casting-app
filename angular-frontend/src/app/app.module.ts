import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HomepageComponent } from './homepage/homepage.component';
import { VehiclesComponent } from './vehicles/vehicles.component';

@NgModule({
  declarations: [
    AppComponent,
    HomepageComponent,
    VehiclesComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule
  ],
  providers: [],
  bootstrap: [
  	AppComponent,
  	HomepageComponent
  ]
})
export class AppModule { }
