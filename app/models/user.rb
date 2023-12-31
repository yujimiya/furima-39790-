class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :purchases
  has_many :items
  
  validates :nickname, presence: true
  validates :password, format: { with: /\A(?=.*[a-z])(?=.*\d)[a-z\d]+\z/i, message: 'は、英数字混合である実用があります' }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は、全角ひらがな、全角カタカナ、漢字で入力して下さい' }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: 'は、全角ひらがな、全角カタカナ、漢字で入力して下さい' }
  validates :last_name_kana, presence: true, format: { with: /\A[\p{katakana}ー－&&[^ -~｡-ﾟ]]+\z/, message: 'は、全角カタカナで入力して下さい' }
  validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}ー－&&[^ -~｡-ﾟ]]+\z/, message: 'は、全角カタカナで入力して下さい' }
  validates :birthday, presence: true
end
