class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
   devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
 
   validates :nickname, :firstname, :lastname, :birthday, presence: true
   validates :password, presence: true, length: { minimum: 7 }, 
             # 英数字のみ可
             format: { with: /\A[a-z0-9]+\z/i, message: "is must NOT contain any other characters than alphanumerics." }
   validates :email, presence: true,uniqueness: true
   validates :kana_firstname, :kana_lastname, presence: true
  has_one :address
end
