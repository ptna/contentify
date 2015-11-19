class CreateContentifySchemas < ActiveRecord::Migration
  def change
    create_table :contentify_categories do |t|
      t.integer :parent_id,          null: false
      t.integer :priority,           null: false
      t.integer :public_status_id,   null: false, default: 2
      t.string  :name_jp,            null: false
      t.string  :name_en,            null: false
      t.string  :direct_url,         null: true
      t.boolean :visible,            null: false, default: true

      t.timestamps null: false
    end

    add_index :contentify_categories, parent_id

    create_table :contentify_contents do |t|
      t.integer  :category_id,           null: false
      t.integer  :public_status_id,      null: false, default: 2
      t.integer  :priority,              null: true
      t.string   :title,                 null: false, limit: 255
      t.string   :summary,               null: true,  limit: 500
      t.string   :summary_image,         null: true,  limit: 500
      t.string   :summary_image_caption, null: true,  limit: 100
      t.datetime :released_at,           null: false
      t.datetime :closed_at,             null: false, default: '9999-12-31 23:59:59'

      t.timestamps null: false
    end


  end
end
