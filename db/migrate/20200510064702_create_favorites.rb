class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.references :user, foreign_key: true
      t.references :micropost, foreign_key: true

      t.timestamps
      
      # ユーザが同じマイクロポストに複数回いいねすることを防ぐ
      # t.index [:user_id, :micropost_id], unique: true
      t.index :user_id
      t.index :micropost_id
      t.index :created_at
    end
  end
end
