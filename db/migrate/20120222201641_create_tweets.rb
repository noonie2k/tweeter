class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.integer :author_id
      t.string :body

      t.timestamps
    end
  end
end
