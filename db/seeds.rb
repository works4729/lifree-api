# # 読み込みたいファイル名
# table_names = %w(
#   users
# )
# # Rails.root = app 
# # Rails.env = 開発環境
# table_names.each do |table_name|
#   path = Rails.root.join("db/seeds/#{Rails.env}/#{table_name}.rb")
# 　# ファイルが存在しない場合
#   path = path.sub(Rails.env, "development") unless File.exist?(path)

#   puts "#{table_name}..."
# #  ファイル名をrequireに渡してファイルを読み込む
#   require path
# end


table_names = %w(
  users
)

table_names.each do |table_name|
  path = Rails.root.join("db/seeds/#{Rails.env}/#{table_name}.rb")

  # ファイルが存在しない場合はdevelopmentディレクトリを読み込む
  path = path.sub(Rails.env, "development") unless File.exist?(path)

  puts "#{table_name}..."
  require path
end