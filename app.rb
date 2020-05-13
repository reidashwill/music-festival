require('sinatra')
require('sinatra/reloader')
require('./lib/festival')
require('./lib/artist')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @stages = Stage.all
  erb(:festival)
end

get('/festival') do
  @stages = Stage.all
  erb(:festival)
end

get('/stage/new') do
  erb(:new_stage)
end

get('/stages/:id') do
  @stage = Stage.find(params[:id].to_i())
  erb(:stage)
end

post('/stages') do
  name = params[:stage_name]
  stage = Stage.new(name, nil)
  stage.save()
  @stages = Stage.all()
  erb(:festival)
end

get('/stages/:id/edit') do
  @stage = Stage.find(params[:id].to_i())
  erb(:edit_stage)
end

patch('/stages/:id') do
  @stage = Stage.find(params[:id].to_i())
  @stage.update(params[:name])
  @stages = Stage.all
  erb(:festival)
end

delete('/stages/:id') do
  @stage = Stage.find(params[:id].to_i())
  @stage.delete()
  @stages = Stage.all()
  erb(:festival)
end

# ---------------------------------------------

get('/stages/:id/artists/:artist_id') do
  @artist = Artist.find(params[:artist_id].to_i())
  erb(:artist)
end

post('/stages/:id/artists') do
  @stage = Stage.find(params[:id].to_i())
  artist = Artist.new(params[:artist_name], @stage.id, nil)
  artist.save()
  erb(:stage)
end

patch('/stages/:id/artists/:artist_id') do
  @stage = Stage.find(params[:id].to_i())
  artist = Artist.find(params[:artist_id].to_i())
  artist.update(params[:name], @stage.id)
  erb(:stage)
end

delete('/stages/:id/artists/:artist_id') do 
  artist = Artist.find(params[:artist_id].to_i())
  artist.delete()
  @stage = Stage.find(params[:id].to_i())
  erb(:stage)
end  