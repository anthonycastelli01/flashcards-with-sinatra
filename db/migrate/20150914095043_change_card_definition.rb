class ChangeCardDefinition < ActiveRecord::Migration
  def change
    change_table :cards do |t|
      t.rename :value, :definition
    end
  end
end
