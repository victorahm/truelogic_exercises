# frozen_s tring_literal: true

file = File.open('soccer_1_.dat', 'r')

begin
  line = file.readline
end until line.match?(/^\s*Team/)

teams = []
while (line = file.gets)
  if line.match?(/^\s*\d+\./)
    teams << line.split.map(&:strip)
  end
end
file.close

min_team = nil
min = Float::INFINITY

teams.each do |line|
  if (line[6].to_i - line[8].to_i).abs < min
    min = (line[6].to_i - line[8].to_i).abs
    min_team = line[1]
  end
end

puts min_team
