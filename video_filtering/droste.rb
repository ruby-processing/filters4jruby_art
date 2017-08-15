# Original shader by SCORPION
# https://www.shadertoy.com/view/4tlGRn
# Ported to JRubyArt by Martin Prout
# Hold mouse click to show unfiltered image
# Because this sketch uses a glsl shader it needs to run using
# jruby-complete (typically rp5 --nojruby sketch.rb)
# hold down mouse to see unfiltered output
load_libraries :video, :video_event
include_package 'processing.video'
attr_reader :cam, :my_filter, :origin

def settings
  # size(640, 480, P2D) # safe? setting
  size(1280, 960, P2D)
end

def setup
  sketch_title 'Droste'
  @origin = Time.now
  @my_filter = load_shader(data_path('droste.glsl'))
  my_filter.set('sketchSize', width.to_f, height.to_f)
  start_capture(width, height)
end

def time
  (Time.now - origin) * 0.5
end

def draw
  # Draw the image on the scene
  image(cam, 0, 0)

  my_filter.set('globalTime', time)
  # Applies the shader to everything that has already been drawn
  return if mouse_pressed?
  filter(my_filter)
end

def start_capture(w, h)
  @cam = Capture.new(self, w, h)
  cam.start
end

# using snake case to match java reflect method
def captureEvent(c)
  c.read
end
