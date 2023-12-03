class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :password, presence: true, length{ minimum: 6 } 
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: "は、全角ひらがな、全角カタカナ、漢字で入力して下さい" }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "は、全角ひらがな、全角カタカナ、漢字で入力して下さい" }
  validates :last_name_kana, presence: true,   format: { with: /\A[\p{katakana}ー－&&[^ -~｡-ﾟ]]+\z/, message: "は、全角カタカナで入力して下さい" }
  validates :first_name_kana, presence: true,   format: { with: /\A[\p{katakana}ー－&&[^ -~｡-ﾟ]]+\z/, message: "は、全角カタカナで入力して下さい" }
  validates :birthday, presence: true
end
