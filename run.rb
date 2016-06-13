require 'chunky_png'

plz_convert_me = ChunkyPNG::Image.from_file('pic2pico-test.png')

if plz_convert_me.width != 128 || plz_convert_me.height != 128
  puts 'Sorry, currently only support for 128x128 pixel images.'
end
