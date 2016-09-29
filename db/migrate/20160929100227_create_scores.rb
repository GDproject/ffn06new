class CreateScores < ActiveRecord::Migration[5.0]
  def change
    create_table :scores do |t|
      t.integer :score_home
      t.integer :score_away

      t.timestamps
    end
  end
end
