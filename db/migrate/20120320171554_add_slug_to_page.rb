class AddSlugToPage < ActiveRecord::Migration
  def change
    add_column :active_cms_pages, :slug, :string, :unique => true
  end
end
