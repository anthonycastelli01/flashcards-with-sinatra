class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.belongs_to :deck
      t.string :term
      t.string :value

      t.timestamps
    end
  end
end
