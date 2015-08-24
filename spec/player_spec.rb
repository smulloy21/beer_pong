require('spec_helper')

describe(Player) do
  describe('#team') do
    it('returns the team of a player') do
      test_team = Team.new({:name => 'Oregon Ducks', :wins => 13})
      test_team.save()
      test_player = Player.new({:name => 'Steve', :team_id => test_team.id()})
      test_player.save()
      expect(test_player.team()).to(eq(test_team))
    end
  end
end
