class CreateTeams < ActiveRecord::Migration
  def change
    create_table(:teams) do |t| #it does the id automatically
      t.column(:name, :string)
      t.column(:wins, :integer)
    end
  end
end
