class FavLegislators < ActiveRecord::Migration
  def up
    create_table :favlegislators do |t|
      t.firstname
      t.lastname
      t.party
      t.phone
      t.state
      t.twitter_id
      t.in_office
      t.votesmart_id
      t.timestamp
    end
  end

  def down
    drop_table :favlegislators
  end
end
