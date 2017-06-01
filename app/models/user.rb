class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :orders
  has_many :liked_products, through: :likes, source: :product
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    is_admin
  end
end
