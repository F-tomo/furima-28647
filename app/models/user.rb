class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,        presence: true
  validates :password,        presence: true,format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  with_options presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ } do
    validates :last_name
    validates :first_name
    validates :last_name_kana
    validates :first_name_kana
  end
  validates :birth_date,      presence: true
end
