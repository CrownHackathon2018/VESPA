class CreateVikEnvs < ActiveRecord::Migration[5.1]
  def change
    create_table :vik_envs do |t|
      t.string :environment
      t.string :description

      t.timestamps
    end
  end
end
