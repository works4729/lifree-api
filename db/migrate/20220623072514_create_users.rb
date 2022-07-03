class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :phone_number, null: false, unique: true
      t.string :last_name
      t.string :first_name
      t.string :last_name_kana
      t.string :first_name_kana
      t.datetime :birthday
      t.string :postcode
      t.string :country
      t.string :prefecture
      t.string :city
      t.string :block
      t.string :building
      t.string :identification
      t.text :profile
      t.boolean :is_phone_number_authenticated, null: false, default: false
      t.boolean :is_identification_authenticated, null: false, default: false
      t.boolean :is_all_present, null: false, default: false
      t.boolean :admin, null: false, default: false

      t.timestamps
    end
  end
end
