# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([{ id: '1',     name: 'Szabolcs Bokonyi', email: "szabcsee@gmail.com", phone: "555-111-1111", address: 'Huszár utca', center: 'Budapest', buzzer: 'true', status: 'supporter', lock: false},
                { id: '2',     name: 'Jean Luc', email: "jeanluc.picard@enterprise.com", phone: "555-111-1111", address: 'Huszár utca', center: 'Budapest', buzzer: 'true', status: 'inactive', lock: false},
    { id: '3', name: 'Worf', email: "worf.moghsson@enterprise.com", phone: "555-222-2222", address: 'Munkás utca', center: 'Budapest', buzzer: 'true', status: 'member', lock: false},
    { id: '4', name: 'Deanna', email: "deanna.troi@enterprise.com", phone: "555-333-3333", address: 'Fürj utca', center: 'Debrecen', buzzer: 'true', status: 'member', lock: false},
    { id: '5', name: 'Data',   email: "mr.data@enterprise.com", phone: "555-444-4444", address: 'Teréz körút', center: 'Budapest', buzzer: 'true', status: 'supporter', lock: false}])

Payment.create([{ amount: '10', payment_date: '2016-12-05', currency: 'EUR', payment_type: 'member', payment_method: 'cash', comment: 'Blablabla', user_id: 1 },
                { amount: '1000', payment_date: '2016-12-01', currency: 'HUF', payment_type: 'supporter', payment_method: 'cash', comment: 'Október', user_id: 2 },
                { amount: '5000', payment_date: '2016-12-02', currency: 'HUF', payment_type: 'project', payment_method: 'bank', comment: 'Sharminub', user_id: 3 }])