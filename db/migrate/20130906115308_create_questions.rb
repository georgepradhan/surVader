class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.belongs_to :survey
      t.string :label
      t.timestamps
    end
  end
end
