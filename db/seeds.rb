# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
u = User.new
u.email = "c2h20406@gmail.com"           # 可以改成自己的 email

u.password = "90280406rp129"                # 最少要六码

u.password_confirmation = "90280406rp129"   # 最少要六码

u.is_admin = true
u.save