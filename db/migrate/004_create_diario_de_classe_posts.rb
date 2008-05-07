class CreateDiarioDeClassePosts < ActiveRecord::Migration
  def self.up
    create_table :diario_de_classe_posts, :force => true do |t|
      t.string :title
      t.text :body
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :diario_de_classe_posts
  end
end
