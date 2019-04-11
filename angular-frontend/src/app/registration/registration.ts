export class Registration {

	constructor(
		public type: string,
		public make: string,
		public model: string,
		public body: string,
		public status: string,
		public doors: number,
		public fuel: string,
		public seats: number,
		public roof: string,
		public colour: string,
		public comment: string,
		public image_url: string,
		public year: number,
		public user_id: number
	) {}
}