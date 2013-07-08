class Politicians < ActiveRecord::Migration
  def up
    create_table :politicians do | table |
      table.string :firstname
      table.string :lastname
      table.string :party
      table.string :phone
      table.string :state
      table.string :twitter_id
      table.boolean :in_office, default: true
      table.string :votesmart_id
    end
  end

  def down
    drop_table :politicians
  end
end
