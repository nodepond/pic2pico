# pic2pico. converts pico-8 palette ready .png images to native p8-format
# (not sprites), that you can load images with code.
# 2016, m.wisniowski, nodepond.com

#!/usr/bin/env ruby
filename='pic2pico-test.png'
ARGV.each do |a|
  filename=a
end

require 'chunky_png'
abort=''

$plz_convert_me = ChunkyPNG::Image.from_file(filename)
$the_converted_me = []

if $plz_convert_me.width != 128 || $plz_convert_me.height != 128
  abort = 'Sorry, currently only support for 128x128 pixel images.'
  puts abort
end


pico8_loader = 'local img="%STRING-SEQUENCE%"

function draw_img(data)
  for i=0,#data+1 do
    local chr=sub(data,i+1,i+1)
    pset(i%128,
    	flr(i/128),
	   	convert_hex2num(chr))
  end
end

local str2hex_table={}
str2hex_table["0"]=0
str2hex_table["1"]=1
str2hex_table["2"]=2
str2hex_table["3"]=3
str2hex_table["4"]=4
str2hex_table["5"]=5
str2hex_table["6"]=6
str2hex_table["7"]=7
str2hex_table["8"]=8
str2hex_table["9"]=9
str2hex_table["a"]=10
str2hex_table["b"]=11
str2hex_table["c"]=12
str2hex_table["d"]=13
str2hex_table["e"]=14
str2hex_table["f"]=15

function	convert_hex2num(value)
	return str2hex_table[value]
end

draw_img(img)'

def is_color_near?(sr, sg, sb, tr, tg, tb, tolerance)
  isNear = false
  if sr.between?(tr-tolerance/2, tr+tolerance/2) && 
    sg.between?(tg-tolerance/2, tg+tolerance/2) &&
    sb.between?(tb-tolerance/2, tb+tolerance/2) then
    isNear = true
  end
  return isNear
end

def convert()
  for i in 0..(128*128)-1
    x = i%128
    y = (i/128).floor()

    colorTolerance = 15

    val = $plz_convert_me[x,y]
    if is_color_near?(ChunkyPNG::Color.r(val), ChunkyPNG::Color.g(val), ChunkyPNG::Color.b(val), 0, 0, 0, colorTolerance)
      # index 0 - Black
      $the_converted_me << "0"
    elsif is_color_near?(ChunkyPNG::Color.r(val), ChunkyPNG::Color.g(val), ChunkyPNG::Color.b(val), 29, 43, 83, colorTolerance)
      # index 1 - Dark-blue
      $the_converted_me << "1"
    elsif is_color_near?(ChunkyPNG::Color.r(val), ChunkyPNG::Color.g(val), ChunkyPNG::Color.b(val), 126, 37, 83, colorTolerance)
      # index 2 - Dark-purple
      $the_converted_me << "2"
    elsif is_color_near?(ChunkyPNG::Color.r(val), ChunkyPNG::Color.g(val), ChunkyPNG::Color.b(val), 0, 136, 81, colorTolerance)
      # index 3 - Dark-green
      $the_converted_me << "3"
    elsif is_color_near?(ChunkyPNG::Color.r(val), ChunkyPNG::Color.g(val), ChunkyPNG::Color.b(val), 171, 82, 54, colorTolerance)
      # index 4 - Brown
      $the_converted_me << "4"
    elsif is_color_near?(ChunkyPNG::Color.r(val), ChunkyPNG::Color.g(val), ChunkyPNG::Color.b(val), 95, 87, 79, colorTolerance)
      # index 5 - Dark-gray
      $the_converted_me << "5"
    elsif is_color_near?(ChunkyPNG::Color.r(val), ChunkyPNG::Color.g(val), ChunkyPNG::Color.b(val), 194, 195, 199, colorTolerance)
      # index 6 - Light-gray
      $the_converted_me << "6"
    elsif is_color_near?(ChunkyPNG::Color.r(val), ChunkyPNG::Color.g(val), ChunkyPNG::Color.b(val), 255, 241, 232, colorTolerance)
      # index 7 - White
      $the_converted_me << "7"
    elsif is_color_near?(ChunkyPNG::Color.r(val), ChunkyPNG::Color.g(val), ChunkyPNG::Color.b(val), 255, 0, 77, colorTolerance)
      # index 8 - Red
      $the_converted_me << "8"
    elsif is_color_near?(ChunkyPNG::Color.r(val), ChunkyPNG::Color.g(val), ChunkyPNG::Color.b(val), 255, 163, 0, colorTolerance)
      # index 9 - Orange
      $the_converted_me << "9"
    elsif is_color_near?(ChunkyPNG::Color.r(val), ChunkyPNG::Color.g(val), ChunkyPNG::Color.b(val), 255, 236, 39, colorTolerance)
      # index 10 - Yellow
      $the_converted_me << "a"
    elsif is_color_near?(ChunkyPNG::Color.r(val), ChunkyPNG::Color.g(val), ChunkyPNG::Color.b(val), 0, 228, 54, colorTolerance)
      # index 11 - Green
      $the_converted_me << "b"
    elsif is_color_near?(ChunkyPNG::Color.r(val), ChunkyPNG::Color.g(val), ChunkyPNG::Color.b(val), 41, 173, 255, colorTolerance)
      # index 12 - Blue
      $the_converted_me << "c"
    elsif is_color_near?(ChunkyPNG::Color.r(val), ChunkyPNG::Color.g(val), ChunkyPNG::Color.b(val), 131, 118, 156, colorTolerance)
      # index 13 - Indigo
      $the_converted_me << "d"
    elsif is_color_near?(ChunkyPNG::Color.r(val), ChunkyPNG::Color.g(val), ChunkyPNG::Color.b(val), 255, 119, 168, colorTolerance)
      # index 14 - Pink
      $the_converted_me << "e"
    elsif is_color_near?(ChunkyPNG::Color.r(val), ChunkyPNG::Color.g(val), ChunkyPNG::Color.b(val), 255, 204, 170, colorTolerance)
      # index 15 - Peach
      $the_converted_me << "f"
    else
      # not found? pure black...
      $the_converted_me << "0"
    end
  end
end

# the "main"
if abort.length > 0
  puts 'we abort!'
else
  convert()
  img_data = ''
  for val in $the_converted_me
   img_data += String(val)+''
  end
  # puts img_data
end

puts '-- copy and paste this into pico8'
puts pico8_loader.sub!('%STRING-SEQUENCE%', img_data)
