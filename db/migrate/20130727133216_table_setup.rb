class TableSetup < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer     :category_id
      t.string      :text
      t.string      :email
      t.string      :price
      t.string      :location
      t.string      :encrypted_url
      t.timestamps  
    end

    create_table :categories do |t|
      t.string :title
      t.string :creator_email
      t.timestamps
    end
  end
end
