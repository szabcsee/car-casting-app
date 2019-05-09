import { Component } from '@angular/core';
import { Vehicle } from './vehicle';

@Component({
	selector: 'vehicles',
	templateUrl: 'vehicles-list.component.html'
})
export class VehiclesListComponent {
	vehicles: Vehicle[] = [
		{
			type: 'Car',
			status: 'new',
			make: 'BMW',
			model: '5',
			roof: 'metal',
			colour: 'yellow',
			fuel: 'diesel',
			year: 1981,
			body: 'sedan',
			doors: 5,
			seats: 5,
			comment: 'Nothing special',
			image_url: 'url/path/to/image.jpg'
		}, {
			type: 'Car',
			status: 'new',
			make: 'Opel',
			model: 'Corsa',
			roof: 'metal',
			colour: 'yellow',
			fuel: 'diesel',
			year: 1998,
			body: 'coupe',
			doors: 3,
			seats: 4,
			comment: 'Nothing special',
			image_url: 'url/path/to/coupe.jpg'
		}
	]
}