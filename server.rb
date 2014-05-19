require 'sinatra'

get '/' do
  @results = [
  {
    home_team: "Patriots",
    away_team: "Broncos",
    home_score: 7,
    away_score: 3
  },
  {
    home_team: "Broncos",
    away_team: "Colts",
    home_score: 3,
    away_score: 0
  },
  {
    home_team: "Patriots",
    away_team: "Colts",
    home_score: 11,
    away_score: 7
  },
  {
    home_team: "Steelers",
    away_team: "Patriots",
    home_score: 7,
    away_score: 21
  }
]

  @leaderboard = @results
  erb :index
end

get '/results/:team_name' do
  @team = params[:team_name]
  erb :team_template
end

get '/leaderboard/' do
  erb :leaderboard
end
