import { Component } from '@angular/core';
import { Vehicle } from './vehicle';

@Component({
	selector: 'vehicles',
	templateUrl: 'vehicles.component.html'
})
export class VehiclesComponent {
	vehicles: Vehicle[] = [
		{
			vehicle_type: 'Car',
			brand: 'BMW',
			year: 1981,
			body: 'sedan',
			doors: 5,
			seats: 5,
			passengers: 4,
			length: 3,
			width: 2,
			description: 'Nothing special',
			image_url: 'url/path/to/image.jpg'
		}, {
			vehicle_type: 'Car',
			brand: 'Opel',
			year: 1998,
			body: 'coupe',
			doors: 3,
			seats: 4,
			passengers: 3,
			length: 2.5,
			width: 1.8,
			description: 'Nothing special',
			image_url: 'url/path/to/coupe.jpg'
		}
	]
}