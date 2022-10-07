class CreateArticlesTable < ActiveRecord::Migration[7.0]
  def change
    create_table :articles_tables do |t|
      t.string :title
      t.timestamps
    end
  end
end
