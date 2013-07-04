class CreateFavoriteLegislators < ActiveRecord::Migration
  def up
    create_table :favorite_legislators do |t|
      t.string :firstname
      t.string :lastname
      t.string :party
      t.string :phone
      t.string :state
      t.string :twitter_id
      t.boolean :in_office
      t.integer :votesmart_id
      t.timestamps
    end
  end

  def down
    drop_table :favorite_legislators
  end
end





