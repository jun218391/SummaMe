class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.integer :customer_id, null: false
      t.string :title, null: false, default: ""
      t.text :content, null: false
      t.string :todo, null: false, default: ""
      t.boolean :is_published_flag, null: false, default: "false"
      t.timestamps
    end
  end
end
