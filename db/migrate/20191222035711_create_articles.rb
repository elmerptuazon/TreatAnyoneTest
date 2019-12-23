class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :text

      t.timestamps

      remove_reference :articles, :summary, index: true, foreign_key: true
    end
  end
end
