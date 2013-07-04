class Congresspeople < ActiveRecord::Migration
  def up
    create_table :congresspeople do |t|
      t.string :firstname
      t.string :lastname
      t.string :party
      t.string :phone
      t.string :state
      t.string :twitter_id
      t.boolean :in_office, default = true
      t.integer :votesmart_id
    end
  end

  def down
    drop_table :congresspeople
  end
end
