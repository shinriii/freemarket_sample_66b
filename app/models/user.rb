class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
   devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_KATAKANA_REGEX = /\A[\p{katakana}\p{blank}ー－]+\z/
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d!@#\$%\^\&*\)\(+=._-]{7,128}\z/i

  validates :nickname, :birthday, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX, message: 'のフォーマットが不適切です'}
  validates :lastname, presence: true, length: { maximum: 35 }
  validates :firstname, presence: true, length: { maximum: 35 }
  validates :password, presence: true, length: { in: 7..128 }, format: { with: VALID_PASSWORD_REGEX, message: 'は英字と数字両方を含むパスワードを設定してください'}
  validates :kana_firstname, presence: true, length: { maximum: 35 }, format: { with: VALID_KATAKANA_REGEX, message: 'はカタカナで入力して下さい'}
  validates :kana_lastname, presence: true, length: { maximum: 35 }, format: { with: VALID_KATAKANA_REGEX, message: 'はカタカナで入力して下さい'}

  has_one :address
  has_many :sns_credentials
  has_many :items
  has_many :cards

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    # sns認証したことがあればアソシエーションで取得
    # 無ければemailでユーザー検索して取得orビルド(保存はしない)
    user = sns.user || User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )
    # userが登録済みの場合はそのままログインの処理へ行くので、ここでsnsのuser_idを更新しておく
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end
end
