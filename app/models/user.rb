class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  has_many :books, dependent: :destroy
  validates :name, presence: true, length: { in: 2..20, minimum: 2 }, uniqueness: true
  
  validates :introduction, presence: false, length: { maximum: 50 } 
end
