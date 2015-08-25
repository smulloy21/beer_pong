require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
also_reload('./lib/**/*.rb')
require('./lib/team')
require('./lib/player')
require('pg')

get("/") do
  @teams = Team.all()
  erb(:index)
end

post('/teams/new') do
  name = params.fetch('name')
  team = Team.new({:name => name})
  team.save()
  player1 = params.fetch('player1')
  player2 = params.fetch('player2')
  team.players.new({:name => player1})
  team.players.new({:name => player2})
  team.save()
  redirect('/')
end

get("/teams/:id") do
  @team = Team.find(params.fetch('id').to_i())
  @players = @team.players()
  erb(:team)
end

patch('/teams/:id/edit') do
  @team = Team.find(params.fetch('id').to_i())
  name = params.fetch('name')
  @team.update({:name => name})
  redirect('/teams/' + @team.id.to_s())
end

delete('/teams/:id/delete') do
  @team = Team.find(params.fetch('id').to_i())
  @team.destroy()
  redirect('/')
end

get("/players/:id") do
  @player = Player.find(params.fetch('id').to_i)
  @team = @player.team()
  erb(:player)
end

patch('/players/:id/edit') do
  @player = Player.find(params.fetch('id').to_i())
  name = params.fetch('name')
  @player.update({:name => name})
  redirect('/players/' + @player.id.to_s())
end

delete('/players/:id/delete') do
  @player = Player.find(params.fetch('id').to_i())
  @team = @player.team()
  @team.destroy()
  redirect('/')
end
