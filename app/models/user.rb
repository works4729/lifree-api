# require "validator/email_validator"
# require "validator/phone_number_validator"

class User < ApplicationRecord
    
  #################################################################################################
  # アソシエーション
  #################################################################################################
  
  #################################################################################################
  # バリデーション
  #################################################################################################
  before_save { self.email = email.downcase }
  has_secure_password
  
  VALID_PHONE_NUMBER_REGEX = /\A0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1})[-)]?\d{4}\z|\A0[5789]0[-]?\d{4}[-]?\d{4}\z/
  VALID_EMAIL_REGEX = /\A\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*\z/
  VALID_PASSWORD_REGEX = /\A[\w\-]+\z/
  VALID_KANA_REGEX = /\A[\p{katakana}\p{blank}ー－]+\z/
  VALID_POSTCODE_REGEX = /\A[0-9]{3}-[0-9]{4}\z/
  
  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
  validates :phone_number, presence: true, length: { in: 10..11 }, 
                          format: { with: VALID_PHONE_NUMBER_REGEX }, uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }, 
                      format: { with: VALID_PASSWORD_REGEX }, allow_nil: true
  validates :last_name_kana, format: { with: VALID_KANA_REGEX }
  validates :first_name_kana, format: { with: VALID_KANA_REGEX }
  validates :postcode, format: {with: VALID_POSTCODE_REGEX}
  validates :profile, length: { maximum: 255 }
  # validates :identification
#   byebug
  #################################################################################################
  # アソシエーション
  #################################################################################################
  #################################################################################################
  # アソシエーション
  #################################################################################################
    # before_validation :downcase_email
    
    # has_secure_password
    
    # validates :name, presence: true,
    #                  length: {
    #                      maximum: 30,
    #                      allow_blank: true
    #                  }
                     
    # max = 255
    # VALID_EMAIL_REGEX = /\A\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*\z/
    # validates :email, presence: true,
    #                   length: { 
    #                         maximum: 255,
    #                         message: :too_long,
    #                         count: max,
    #                         allow_blank: true
    #                   },
    #                   format: {
    #                       with: VALID_EMAIL_REGEX,
    #                       message: :invalid,
    #                       allow_blank: true
    #                   }
                      
    # validates :phone_number, presence: true,
    #                   phone_number: {allow_blank: true}
                     
    # VALID_PASSWORD_REGEX = /\A[\w\-]+\z/
    # validates :password, presence: true,
    
    #                     length: { 
    #                         minimum: 8,
    #                         allow_blank: true
    #                     },
    #                     format: {
    #                         with: VALID_PASSWORD_REGEX,
    #                         message: :invalid_password,
    #                         allow_blank: true
    #                     },
    #                     allow_nil: true
                        
    # validates :is_all_present, is_all_present: {allow_blank: true}
                         
    # class << self
    #     def find_by_activated(phone_number)
    #         find_by(phone_number: phone_number, is_phone_number_authenticated: true)
    #     end
    # end
    
    # def phone_number_activated?
    #     users = User.where.not(id: id)
    #     users.find_by_activated(phone_number).present?
    # end    
    
    # private
    # def downcase_email
    #     self.email.downcase! if email
    # end
end
# nameは入力必須だが３０文字以内で空白またはnilを許容するが１文字以上は必須という意味になる
# has_secure_passwordの機能の一つ
# ・新規登録時は、nilは許されない
# つまり、allow_nil: trueにした場合でも、updateではわざわざパスワードを入力しなくても
# 名前等の変更が出来るということ。

# \A[]  => 先頭に[●●]がマッチしているか
# \w  => a-zA-Z0-9_
# \-  => -
# +  => 一文字以上繰り返す
# \z  =>  末尾に[●●]がマッチしているか

# 結論：先頭  ～   末尾  に  a-zA-Z0-9_  と  -   がマッチする必要がある
#       (\A)  (+)  (\z)         (\w)        (\-)
