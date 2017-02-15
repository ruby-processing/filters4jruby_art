filters4jruby_art
==================
A port of [Filters4Processing][] to JRubyArt
A growing collection of pixel shaders ported to Processing to be used with the `filter()` function. Most of these shaders come from the excellent [Shadertoy](https://www.shadertoy.com) by Iñigo Quilez.

### To run / watch shader sketches
NB: glsl files are also _watched_, so you can edit the shader of the sketch running in
watch mode, and it will automatically reload when you save your changes...
```bash
# autorun all sketches
cd filters4jruby_art
rake # assume rake and processing and jruby_art installed
```
Run / Watch individual sketches as follows
```bash
k9 -r sketch.rb 
# or k9 -w sketch.rb
```

## Filters

### Barrel Blur Chroma
![screenshot](https://github.com/SableRaf/Filters4Processing/blob/master/screenshots/BarrelBlurChroma.jpg)

### Barrel & Pincushion
![screenshot](https://github.com/SableRaf/Filters4Processing/blob/master/screenshots/BarrelPincushion.png)

### Bicubic Filter
![screenshot](https://github.com/SableRaf/Filters4Processing/blob/master/screenshots/Bicubic.jpg)

### Bilateral Filter (denoise)
![screenshot](https://github.com/SableRaf/Filters4Processing/blob/master/screenshots/Bilateral.jpg)

### Contrast, Saturation, Brightness
![screenshot](https://github.com/SableRaf/Filters4Processing/blob/master/screenshots/ConSatBri.jpg)

### Dithering
![screenshot](https://github.com/SableRaf/Filters4Processing/blob/master/screenshots/Dithering.jpg)

### Edge filter
![screenshot](https://github.com/SableRaf/Filters4Processing/blob/master/screenshots/Edge.jpg)

## Usage

This is a minimal example showing how to import shader file in JRubyArt and use it as a filter.

*Note: Some shaders require additional uniforms. For details, refer to the example sketches included.*

```ruby
attr_reader :my_filter, :my_image

def settings
  size(512, 512, P2D)
end

def setup
  sketch_title 'My Sketch'
  # import an image object
  @my_image  = load_image(data_path('texture.jpg'))
  # load a shader object
  @my_filter = load_shader(data_path('shader.glsl'))
  # pass the window size to the shader
  my_filter.set('sketchSize', width.to_f, height.to_f)
end

def draw
  background(0)
  # Draw the image on the scene
  image(my_image, 0, 0)
  # Applies the shader to everything that has already been drawn
  return if mouse_pressed?
  filter(my_filter)
end
```

## Notes about porting filters from Shadertoy

Shadertoy and Processing both have their own quirks when it comes to shader programming. We need to make some changes in order to make Shadertoy code work with Processing/JRubyArt. See [wiki](https://github.com/jruby_art/filters4jruby_art/wiki/Translating-shaders-for-processing) which you are welcome to edit if you know better

Now go dig for some [shaders](https://www.shadertoy.com/results?query=filter) and help us extend the library of filters available for Processing/jruby_art!

*Note: It is possible to port other types of shaders, but this repository focuses on filters.*

## Acknowledgments
Port to processing by Raphaël de Courville.
Thanks to all the Shadertoy contributors for their hard work. This collection wouldn't exist without them. Thanks to Andr&eacute;s Colubri for his work on the Processing Shader API.

## License
All shaders from Shadertoy belong to there respective authors. Unless otherwise specified in the shader file, they are licensed under Creative Commons ([CC BY-NC-SA 3.0](http://creativecommons.org/licenses/by-nc-sa/3.0/deed.en_US))

## Tools
[Syntax highlighting for glsl in vim](https://github.com/beyondmarc/glsl.vim)

[Filters4Processing]:https://github.com/SableRaf/Filters4Processing
