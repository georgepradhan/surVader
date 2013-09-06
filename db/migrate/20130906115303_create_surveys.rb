class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.belongs_to :user
      t.string :label
      t.text :description
      t.timestamps
    end
  end
end
