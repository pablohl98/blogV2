class Addnullfalse < ActiveRecord::Migration[7.0]
  def change
    change_column_null :articles, :title, false
    change_column_null :articles, :content, false
    change_column_null :articles, :author, false
    change_column_null :articles, :category, false
  end
end
