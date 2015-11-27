class CreateContentifySchemas < ActiveRecord::Migration
  def change
    create_table :contentify_categories do |t|
      t.integer :parent_id,          null: true
      t.string  :priority,           null: false, default: '1'
      t.integer :public_status_id,   null: false, default: 2
      t.string  :name,               null: false, limit: 50
      t.string  :slug,               null: false, limit: 50
      t.string  :direct_url,         null: true,  limit: 500
      t.string  :image,              null: true,  limit: 500
      t.boolean :is_visible,         null: false, default: true

      t.timestamps null: false
    end

    add_index :contentify_categories, :parent_id

    create_table :contentify_contents do |t|
      t.integer  :public_status_id,      null: false, default: 2
      t.integer  :priority,              null: true
      t.string   :title,                 null: false, limit: 255
      t.string   :summary,               null: true,  limit: 500
      t.string   :summary_image,         null: true,  limit: 500
      t.string   :summary_image_caption, null: true,  limit: 100
      t.string   :author_name,           null: true,  limit: 50
      t.text     :body,                  null: false
      t.boolean  :is_display_author,     null: false, default: false
      t.datetime :released_at,           null: false
      t.datetime :closed_at,             null: false, default: '9999-12-31 23:59:59'

      t.timestamps null: false
    end

    add_index :contentify_contents, :title


    create_table :contentify_categories_contents do |t|
      t.integer  :category_id, null: false
      t.integer  :content_id,  null: false
    end

    add_foreign_key :contentify_categories_contents, :contentify_categories, column: :category_id
    add_foreign_key :contentify_categories_contents, :contentify_contents,   column: :content_id


    create_table :contentify_users do |t|
      t.string  :name,            null: true,  limit: 60
      t.string  :email,           null: false
      t.boolean :is_admin,        null: false, default: false
      t.string  :crypted_password
      t.string  :salt

      t.timestamps null: false
    end


    create_table :contentify_materials do |t|
      t.string  :title,           null: false,  limit: 100
      t.string  :source,          null: false,  limit: 255

      t.timestamps null: false
    end

    add_index :contentify_materials, :title
    add_index :contentify_materials, :source


    create_table :contentify_category_hierarchies, id: false do |t|
      t.integer :ancestor_id,   null: false
      t.integer :descendant_id, null: false
      t.integer :generations,   null: false
    end

    add_index :contentify_category_hierarchies,
              [:ancestor_id, :descendant_id, :generations],
              unique: true,
              name: "contentify_category_anc_desc_idx"

    add_index :contentify_category_hierarchies,
              [:descendant_id],
              name: "contentify_category_desc_idx"
  end
end
