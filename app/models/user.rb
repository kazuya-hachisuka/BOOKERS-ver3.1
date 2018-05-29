class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   has_many :books
   attachment :image
   validates :name, presence: true
   validates :name, length: { in: 2..20 }
   validates :introduction, length: { maximum:50 }
   has_many :favorites, dependent: :destroy
end
