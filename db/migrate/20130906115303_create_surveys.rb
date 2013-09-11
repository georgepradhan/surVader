class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.belongs_to :user	#alias to :creator
      t.string :label
      t.text :description
      t.timestamps
    end
  end
end
