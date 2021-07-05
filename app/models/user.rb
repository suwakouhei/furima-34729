class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
         hira_kana_kanzi = /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/
         kana = /\A[ァ-ヶー－]+\z/

         validates :nickname, presence: true
         validates :password,format: { with: VALID_PASSWORD_REGEX}
         validates :last_name, presence: true, format: { with: hira_kana_kanzi}
         validates :first_name, presence: true, format: { with: hira_kana_kanzi}
         validates :last_name_katakana, presence: true, format: { with: kana}
         validates :first_name_katakana, presence: true, format: { with: kana}
         validates :birthday, presence: true
end
