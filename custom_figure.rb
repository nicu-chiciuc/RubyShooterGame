# custom_figure.rb

def random_position
    [rand(get(:width) - 60) + 30, rand(get(:height) - 400) + 200]
  end
  
  def create_figure
    # Draw the head (circle)
    head = Circle.new(
      x: random_position[0],
      y: random_position[1],
      radius: 30,
      color: 'black'
    )
  
    # Draw the body (line)
    body = Line.new(
      x1: head.x,
      y1: head.y + 30,
      x2: head.x,
      y2: head.y + 150,
      width: 5,
      color: 'black'
    )
  
    # Draw the arms (lines)
    left_arm = Line.new(
      x1: head.x,
      y1: head.y + 60,
      x2: head.x - 50,
      y2: head.y + 100,
      width: 3,
      color: 'black'
    )
  
    right_arm = Line.new(
      x1: head.x,
      y1: head.y + 60,
      x2: head.x + 50,
      y2: head.y + 100,
      width: 3,
      color: 'black'
    )
  
    # Draw the legs (lines)
    left_leg = Line.new(
      x1: head.x,
      y1: head.y + 150,
      x2: head.x - 50,
      y2: head.y + 200,
      width: 3,
      color: 'black'
    )
  
    right_leg = Line.new(
      x1: head.x,
      y1: head.y + 150,
      x2: head.x + 50,
      y2: head.y + 200,
      width: 3,
      color: 'black'
    )
  
    # Add all the figure parts to the group
    [head, body, left_arm, right_arm, left_leg, right_leg]
  end
  