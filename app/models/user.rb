class User < ApplicationRecord
    has_secure_password
    
    validates :name, presence: true,
                     length: {
                         maximum: 30,
                         allow_blank: true
                     }
                     
    VALID_PASSWORD_REGEX = /\A[\w\-]+\z/
    validates :password, presence: true,
                         length: { 
                            minimum: 8,
                            allow_blank: true
                         },
                         format: {
                             with: VALID_PASSWORD_REGEX,
                             message: :invalid_password,
                             allow_blank: true
                         },
                         allow_nil: true
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