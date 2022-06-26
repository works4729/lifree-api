class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :phone_number, null: false
      t.boolean :is_phone_number_authenticated, null: false, default: false
      t.boolean :admin, null: false, default: false

      t.timestamps
    end
  end
end
