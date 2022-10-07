class AddDescriptionToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles_tables, :description, :text
  end
end
