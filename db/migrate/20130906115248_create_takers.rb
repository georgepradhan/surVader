class CreateTakers < ActiveRecord::Migration
  def change
    create_table :takers do |t|
      t.belongs_to :user
      t.belongs_to :survey
      t.timestamps
    end
  end
end
