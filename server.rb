require 'sinatra'

RESULTS = [
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

get '/' do
  @teams = []
  RESULTS.each do |hash|
    if !@teams.include?(hash[:home_team])
      @teams << hash[:home_team]
    end
    if !@teams.include?(hash[:away_team])
      @teams << hash[:away_team]
    end
  end

  erb :index
end

get '/teams/:team_name' do
  @team = params[:team_name]
  @wins = 0
  @losses = 0
  RESULTS.each do |bracket|
    if bracket[:home_team] == @team
      if bracket[:home_score] > bracket[:away_score]
        @wins += 1
      else
        @losses += 1
      end
    end
    if bracket[:away_team] == @team
      if bracket[:away_score] > bracket[:home_score]
        @wins += 1
      else
        @losses += 1
      end
    end
  end

  @scoreline = []
  RESULTS.each do |bracket|
    if bracket[:home_team] == @team || bracket[:away_team] == @team
      @scoreline << "#{bracket[:home_team]} #{bracket[:home_score]} #{bracket[:away_team]} #{bracket[:away_score]}"
    end
  end

  erb :team_template
end

get '/leaderboard/' do
  erb :leaderboard
end
