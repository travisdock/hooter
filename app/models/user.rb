class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :hoots
  has_many :likes
  has_many :liked_hoots, through: :likes, source: :hoot
  has_many :followers, class_name: "Follower", foreign_key: "followed_id"
  has_many :follower_users, through: :followers, source: :follower
  has_many :follows, class_name: "Follower", foreign_key: "follower_id"
  has_many :following_users, through: :follows, source: :followed

  has_one_attached :avatar
end
