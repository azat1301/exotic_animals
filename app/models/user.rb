class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings
  has_many :animals
  has_many :reviews, dependent: :destroy
  has_many :bookings_as_owner, through: :animals, source: :bookings
  has_one_attached :photo
end
