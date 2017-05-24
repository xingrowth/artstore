# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u = User.new
u.email = "example@gmail.com"
u.password = "123456"
u.password_confirmation = "123456"
u.is_admin = true
u.save

# Initialize Product

Product.create!(title: "Aeron",
  description: "座椅",
  price: 9000,
  quantity: 5,
  image: open("https://images-cn.ssl-images-amazon.com/images/I/71UMci7bysL._SL1384_.jpg")
  )

Product.create!(title: "Iphone7",
  description: "手机",
  price: 5000,
  quantity: 5,
  image: open("https://images-cn.ssl-images-amazon.com/images/I/51q3gdJGenL._SL800_.jpg")
  )

Product.create!(title: "Cherry Keyboard",
  description: "G80-3000键盘",
  price: 2800,
  quantity: 5,
  image: open("https://images-cn.ssl-images-amazon.com/images/I/41LN-bXtA7L._AC_UL320_SR320,320_.jpg")
  )
