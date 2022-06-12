class CreateVideoCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :video_categories do |t|
      t.references :video, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
