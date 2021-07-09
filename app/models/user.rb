class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :lists

         VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
         hira_kana_kanzi = /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/
         kana = /\A[ァ-ヶー－]+\z/

         validates :password,format: { with: VALID_PASSWORD_REGEX}
         
       with_options presence: true do

         validates :nickname
         validates :last_name, format: { with: hira_kana_kanzi}
         validates :first_name, format: { with: hira_kana_kanzi}
         validates :last_name_katakana, format: { with: kana}
         validates :first_name_katakana, format: { with: kana}
         validates :birthday

      end
  end