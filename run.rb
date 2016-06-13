require 'chunky_png'

abort=""

plz_convert_me = ChunkyPNG::Image.from_file('pic2pico-test.png')

if plz_convert_me.width != 128 || plz_convert_me.height != 128
  abort = 'Sorry, currently only support for 128x128 pixel images.'
  puts abort
end

def convert()
  for i in 0..128*128-1
    puts i
  end
end

# the "main"
if abort.length > 0
  puts 'we abort!'
else
  puts 'continue'
  convert()
end
