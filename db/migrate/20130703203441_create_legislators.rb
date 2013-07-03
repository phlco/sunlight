class CreateLegislators < ActiveRecord::Migration
  def up
    create_table :legislators do |t|
      t.string :first_name
      t.string :last_name
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
  end
end
