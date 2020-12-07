class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,        presence: true
  validates :password,        presence: true,format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  validates :last_name,       presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :first_name,      presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :last_name_kana,  presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :birth_date,      presence: true
end
