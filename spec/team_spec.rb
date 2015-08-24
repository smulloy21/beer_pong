require('spec_helper')

describe(Team) do
  describe('#name') do
    it('returns the name of a team') do
      test = Team.new({:name => 'Oregon Ducks', :wins => 13})
      expect(test.name()).to(eq('Oregon Ducks'))
    end
  end
end
