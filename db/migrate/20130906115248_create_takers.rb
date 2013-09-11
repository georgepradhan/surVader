class CreateTakers < ActiveRecord::Migration
  def change
    create_table :takers do |t|	# consider renaming this, since :takers sounds like this is a person/user model-- :user_surveys would be better, as that makes it clear this table is a join between a user and a survey
      t.belongs_to :user
      t.belongs_to :survey
      t.timestamps
    end
  end
end
