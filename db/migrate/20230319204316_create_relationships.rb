class CreateRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :relationships do |t|
      t.integer :follower_id #フォローするユーザーのID
      t.integer :followed_id #フォローされたユーザーのID

      t.timestamps
    end
  end
end
