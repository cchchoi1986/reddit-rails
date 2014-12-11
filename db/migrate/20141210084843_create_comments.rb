class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :from
      t.string :title
      t.string :comment
      t.timestamps
    end
  end
end
