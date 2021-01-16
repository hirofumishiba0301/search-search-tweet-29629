class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.text :name ,null: false
      t.references :user ,foreign_key: true
      t.text :text ,null: false
      t.integer :favorite_counts
      t.integer :goodjobs_counts
      t.integer :progress , default: 0
      t.timestamps
    end
  end
end
