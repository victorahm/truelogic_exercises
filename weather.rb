# frozen_string_literal: true

file = File.open('w_data_1_.dat', 'r')

begin
  line = file.readline
end until line.match?(/^\s*Dy/)

days = []
while (line = file.gets)
  if line.match?(/^\s*\d+/)

    days << line.split[0..2].map(&:strip)
  end
end
file.close

min_day = nil
min = Float::INFINITY

days.each do |line|
  if line[1].to_i - line[2].to_i < min
    min = line[1].to_i - line[2].to_i
    min_day = line[0]
  end
end

puts min_day
