class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      
      t.integer :customer_id, null: false, default: ""
      t.string :title, null: false, default: ""
      t.text :content, null: false, default: ""
      t.string :todo, null: false, default: ""

      t.timestamps
    end
  end
end
