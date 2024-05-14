class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :description
      t.string :author
      t.integer :page_count
      t.date :published_at

      t.timestamps
    end
  end
end
