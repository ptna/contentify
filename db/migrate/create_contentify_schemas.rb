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
  end
end
