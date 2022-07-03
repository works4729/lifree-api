# 10.times do |n|
#   name = "user#{n}"
#   email = "#{name}@example.com"
#   phone_number = "0801234567#{n}"
# #   下記の内容で検索
# # オブジェクトが存在する => 取得
#   user = User.find_or_initialize_by(email: email, phone_number: phone_number, is_phone_number_authenticated: true)

# # オブジェクトが存在しない => 新たに生成
#   if user.new_record?
#     user.name = name
#     user.password = "password"
#     user.save!
#   end
# end

# puts "users = #{User.count}"


10.times do |n|
  name = "user#{n}"
  email = "#{name}@example.com"
  phone_number = "0801234567#{n}"
  user = User.find_or_initialize_by(email: email, phone_number: phone_number, is_phone_number_authenticated: true)

  if user.new_record?
    user.name = name
    user.password = "password"
    user.save!
  end
end

puts "users = #{User.count}"