# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rails db:seed command (or created
# alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create(
#     [{ name: 'Star Wars' }, { name: 'Lord of the Rings' }]
#   )
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
    first_name: 'John',
    last_name: 'Doe',
    email: 'smartadmin@example.org',
    password: 'smartadmin',
    admin: true
)
User.create(
        first_name: 'Average',
        last_name: 'User',
        email: 'smartuser@example.org',
        password: 'smartuser',
        admin: false
)
Setting.create(
    theme: 'smart-style-1',
    new_user_registration: true
)