class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :display_name
      t.string :handle
      t.string :password_digest

      t.timestamps
    end
  end
end
