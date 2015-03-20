class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.column :title, :string
      t.column :body, :string
      t.column :date, :datetime

      t.timestamps
    end
  end
end
