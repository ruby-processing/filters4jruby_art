# Pixelate effect
# Original shader by SCORPION
# https://www.shadertoy.com/view/4tlGRn
# Ported to JRubyArt by Martin Prout
# Hold mouse click to show unfiltered image

attr_reader :my_filter, :my_image, :origin

def settings
  size(512, 512, P2D)
end

def setup
  sketch_title 'Droste'
  @origin = Time.now
  @my_image  = load_image(data_path('texture.jpg'))
  @my_filter = load_shader(data_path('droste.glsl'))
  my_filter.set('sketchSize', width.to_f, height.to_f)
end

def time
  Time.now - origin
end

def draw
  background(0)
  # Draw the image on the scene
  image(my_image, 0, 0)
  my_filter.set('globalTime', time)
  # Applies the shader to everything that has already been drawn
  return if mouse_pressed?
  filter(my_filter)
end
