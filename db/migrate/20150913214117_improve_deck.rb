class ImproveDeck < ActiveRecord::Migration
  def change
    change_table :decks do |t|
      t.integer :high_score
    end
  end
end
