# Write your code here!
require "pry"
def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        player(%w[Alan\ Anderson 0 16 22 12 12 3 1 1]),
        player(%w[Reggie\ Evans 30 14 12 12 12 12 12 7]),
        player(%w[Brook\ Lopez 11 17 17 19 10 3 1 15]),
        player(%w[Mason\ Plumlee 1 19 26 11 6 3 8 5]),
        player(%w[Jason\ Terry 31 15 19 2 2 4 11 1])
      ]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
        player(%w[Jeff\ Adrien 4 18 10 1 1 2 7 2]),
        player(%w[Bismack\ Biyombo 0 16 12 4 7 22 15 10]),
        player(%w[DeSagna\ Diop 2 14 24 12 12 4 5 5]),
        player(%w[Ben\ Gordon 8 15 33 3 2 1 1 0]),
        player(%w[Kemba\ Walker 33 15 6 12 12 7 5 12])
      ]
    }
  }
end



def player(stats)
  {
    :player_name => stats[0],
    :number => stats[1].to_i,
    :shoe => stats[2].to_i,
    :points => stats[3].to_i,
    :rebounds => stats[4].to_i,
    :assists => stats[5].to_i,
    :steals => stats[6].to_i,
    :blocks => stats[7].to_i,
    :slam_dunks => stats[8].to_i
  }
end


def num_points_scored(player_name)
  get_player_stat(player_name, :points) || "Player not found"
end

def shoe_size(player_name)
 get_player_stat(player_name, :shoe) || "Player not found"
end

def team_colors(team_name)
  get_team_stats(team_name, :colors) || "Team not found"
end

def team_names
  [
    game_hash[:home][:team_name],
    game_hash[:away][:team_name]
  ]
end

def player_numbers(team_name)
  numbers = []
  game_hash.each do |key, team_value|
    if team_value[:team_name] == team_name
      team_value[:players].each do |player|
        numbers << player[:number]
      end
    end
  end
  numbers
end

def get_team_stats(team_name, stat)
  game = game_hash
   if game[:home][:team_name] == team_name
    return game[:home][stat]
  elsif game[:away][:team_name] == team_name
    return game[:away][stat]
  end
end

def get_player_stat(player_name, stat)
  stats = game_hash
  stats[:home][:players].each do |player|
    if player[:player_name] == player_name
      return player[stat]
    end
  end
  stats[:away][:players].each do |player|
    if player[:player_name] == player_name
      return player[stat]
    end
  end
end








