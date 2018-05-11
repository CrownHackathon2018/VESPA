class CreateMasters < ActiveRecord::Migration[5.1]
  def change
    create_table :masters do |t|
      t.string :viknum
      t.string :vikEnvironment
      t.string :promEnvironment
      t.string :userID
      t.text :comment
      t.date :reqdt

      t.timestamps
    end
  end
end
