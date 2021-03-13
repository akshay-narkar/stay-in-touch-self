class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :friendships, -> { where('status = ?', true) }, dependent: :destroy
  has_many :requests_sent, -> { where('status = ?', false) }, foreign_key: :user_id, class_name: :Friendship
  has_many :requests_received, -> { where('status = ?', false) }, foreign_key: :friend_id, class_name: :Friendship
end
