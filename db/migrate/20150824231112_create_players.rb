class CreatePlayers < ActiveRecord::Migration
  def change
    create_table(:players) do |t| #it does the id automatically
      t.column(:name, :string)
      t.column(:team_id, :integer)
    end
  end
end
