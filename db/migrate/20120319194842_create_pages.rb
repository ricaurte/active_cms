class CreatePages < ActiveRecord::Migration
  def change
    create_table :active_cms_pages do |t|
      t.string :title
      t.text :body
      t.boolean :skip
      t.string :redirect
      t.boolean :menu
      t.string :meta_title
      t.string :meta_keywords
      t.text :meta_description

      t.timestamps
    end
  end
end
