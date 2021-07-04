class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i

         validates :nickname, presence: true
         validates :password,format: { with: VALID_PASSWORD_REGEX}
         validates :last_name, presence: true
         validates :first_name, presence: true
         validates :last_name_katakana, presence: true
         validates :first_name_katakana, presence: true
         validates :birthday, presence: true
end
