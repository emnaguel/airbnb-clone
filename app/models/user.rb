class User < ApplicationRecord
has_many :boats
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


validates :email, format: { with: /\A.*@.*\.com\z/ }
validates :encrypted_password, presence: :true

end
