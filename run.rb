# pic2pico. converts pico-8 palette ready .png images to native p8-format
# (not sprites), that you can load images with code.
# 2016, m.wisniowski, nodepond.com

require 'chunky_png'

abort=""

$plz_convert_me = ChunkyPNG::Image.from_file('pic2pico-test.png')

if $plz_convert_me.width != 128 || $plz_convert_me.height != 128
  abort = 'Sorry, currently only support for 128x128 pixel images.'
  puts abort
end

def convert()
  for i in 0..128*128-1
    x = i%128
    y = (i/128).floor()
    val = $plz_convert_me[x,y]
    puts ChunkyPNG::Color.r(val)
  end
end

# the "main"
if abort.length > 0
  puts 'we abort!'
else
  convert()
  puts $plz_convert_me[1,1]
end
