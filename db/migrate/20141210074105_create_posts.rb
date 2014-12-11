class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      #by default it already has id
      #t.data_type :column_name
      #string is just text
      
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
