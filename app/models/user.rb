class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  validates :user_name, presence: true, length: { minimum: 4, maximum: 12 }
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
end
