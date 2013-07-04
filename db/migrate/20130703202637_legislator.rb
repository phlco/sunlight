class Legislator < ActiveRecord::Migration
  def up
    create_table :politician do |t|
      t.string :firstname
      t.string :lastname
      t.string :party
      t.string :phone
      t.string :state
      t.string :twitter_id
      t.string :in_office
      t.string :votesmart_id

      t.timestamps
    end
  end

  def down
    drop_table :politician
  end
end
