# pic2pico. converts pico-8 palette ready .png images to native p8-format
# (not sprites), that you can load images with code.
# 2016, m.wisniowski, nodepond.com

require 'chunky_png'

abort=''

pico8_loader = 'local img="%STRING-SEQUENCE%"

function draw_img(data)
rectfill(0, 0, 1, 128, 7)
  for i=0,#data do
    local chr=sub(data,i,i)
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

draw_img(img)
'

$plz_convert_me = ChunkyPNG::Image.from_file('pic2pico-test.png')
$the_converted_me = []

if $plz_convert_me.width != 128 || $plz_convert_me.height != 128
  abort = 'Sorry, currently only support for 128x128 pixel images.'
  puts abort
end

def convert()
  for i in 0..128*128-1
    x = i%128
    y = (i/128).floor()
    val = $plz_convert_me[x,y]
    if ChunkyPNG::Color.r(val) == 0 && ChunkyPNG::Color.g(val) == 0 && ChunkyPNG::Color.b(val) == 0
      # index 0 - Black
      $the_converted_me << "0"
    elsif ChunkyPNG::Color.r(val) == 29 && ChunkyPNG::Color.g(val) == 43 && ChunkyPNG::Color.b(val) == 83
      # index 1 - Dark-blue
      $the_converted_me << "1"
    elsif ChunkyPNG::Color.r(val) == 126 && ChunkyPNG::Color.g(val) == 37 && ChunkyPNG::Color.b(val) == 83
      # index 2 - Dark-purple
      $the_converted_me << "2"
    elsif ChunkyPNG::Color.r(val) == 0 && ChunkyPNG::Color.g(val) == 136 && ChunkyPNG::Color.b(val) == 81
      # index 3 - Dark-green
      $the_converted_me << "3"
    elsif ChunkyPNG::Color.r(val) == 171 && ChunkyPNG::Color.g(val) == 82 && ChunkyPNG::Color.b(val) == 54
      # index 4 - Brown
      $the_converted_me << "4"
    elsif ChunkyPNG::Color.r(val) == 95 && ChunkyPNG::Color.g(val) == 87 && ChunkyPNG::Color.b(val) == 79
      # index 5 - Dark-gray
      $the_converted_me << "5"
    elsif ChunkyPNG::Color.r(val) == 194 && ChunkyPNG::Color.g(val) == 195 && ChunkyPNG::Color.b(val) == 199
      # index 6 - Light-gray
      $the_converted_me << "6"
    elsif ChunkyPNG::Color.r(val) == 255 && ChunkyPNG::Color.g(val) == 241 && ChunkyPNG::Color.b(val) == 232
      # index 7 - White
      $the_converted_me << "7"
    elsif ChunkyPNG::Color.r(val) == 255 && ChunkyPNG::Color.g(val) == 0 && ChunkyPNG::Color.b(val) == 77
      # index 8 - Red
      $the_converted_me << "8"
    elsif ChunkyPNG::Color.r(val) == 255 && ChunkyPNG::Color.g(val) == 163 && ChunkyPNG::Color.b(val) == 0
      # index 9 - Orange
      $the_converted_me << "9"
    elsif ChunkyPNG::Color.r(val) == 255 && ChunkyPNG::Color.g(val) == 236 && ChunkyPNG::Color.b(val) == 39
      # index 10 - Yellow
      $the_converted_me << "a"
    elsif ChunkyPNG::Color.r(val) == 0 && ChunkyPNG::Color.g(val) == 228 && ChunkyPNG::Color.b(val) == 54
      # index 11 - Green
      $the_converted_me << "b"
    elsif ChunkyPNG::Color.r(val) == 41 && ChunkyPNG::Color.g(val) == 173 && ChunkyPNG::Color.b(val) == 255
      # index 12 - Blue
      $the_converted_me << "c"
    elsif ChunkyPNG::Color.r(val) == 131 && ChunkyPNG::Color.g(val) == 118 && ChunkyPNG::Color.b(val) == 156
      # index 13 - Indigo
      $the_converted_me << "d"
    elsif ChunkyPNG::Color.r(val) == 255 && ChunkyPNG::Color.g(val) == 119 && ChunkyPNG::Color.b(val) == 168
      # index 14 - Pink
      $the_converted_me << "e"
    elsif ChunkyPNG::Color.r(val) == 255 && ChunkyPNG::Color.g(val) == 204 && ChunkyPNG::Color.b(val) == 170
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
  img_data = img_data.chop
  puts img_data
end

puts '--copy and paste this into pico8'
puts pico8_loader.sub!('%STRING-SEQUENCE%', img_data)
