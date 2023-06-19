class CreateFollows < ActiveRecord::Migration[6.0]
  def change
    create_table :follows do |t|
      t.references :following, null: false
      t.references :follower, null: false
      t.timestamps
    end
  end
end
