class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 
       
  
  validates :email, presence: true, uniqueness: true, length: { maximum: 255 }


  # has_one :cart

  before_save { self.email = email.downcase }

  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

end