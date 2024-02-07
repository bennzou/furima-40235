class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
   devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   
   has_many :items       

   with_options presence: true do

   validates :nickname, uniqueness: true, length: { maximum: 6 }

   with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
   validates :last_name
   validates :first_name
   end
   with_options format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カナを使用してください' } do
   validates :last_name_kana
   validates :first_name_kana
   end
   validates :birth_date

   end
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers' 


end