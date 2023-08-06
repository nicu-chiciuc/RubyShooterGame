require 'ruby2d'
require_relative 'custom_figure'

set background: Image.new('map.png')
set title: 'Shot me'
set width: 960
set height: 640

message = Text.new('Click to begin', x: 400, y: 270, size: 28, style: 'bold', color: 'black')
shoot = Sound.new('sniper.mp3')
game_started = false
figure_group = nil
start_time = nil
duration = nil

scope = Image.new('scope.png', x: 50, y: 50, width: 100, height: 100)
  
on :mouse_move do |event|
  scope.x = event.x-50
  scope.y = event.y-50
end

on :mouse_down do |event|
  # x and y coordinates of the mouse button event
  puts event.x, event.y
  if game_started
    shoot.play
    figure_group.each do |figure_part|
      if figure_part.contains?(event.x, event.y)
        duration = ((Time.now - start_time) * 1000).round
        message = Text.new("We'll done, You took: #{duration} milliseconds. Click to begin", x: 120, y: 270, size: 28, style: 'bold', color: 'black')
        figure_group.each(&:remove)
        game_started = false
      end
    end
  else
    message.remove

    figure_group = create_figure
    figure_group.each(&:add)

    start_time = Time.now
    game_started = true
  end
end

show
