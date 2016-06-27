# About

pic2pico. A simple tool, converts pico-8 palette ready .png images to native p8-format
(not sprites), that you can load images with code.
2016, m.wisniowski, http://www.nodepond.com

# Install

This is a script, written in Ruby. It requires the 'chunky_png'-gem (http://chunkypng.com). To install this gen, it should be enought, to just install by typing the following into the terminal:

  [sudo] gem install chunky_png

# How to run

Run the example and spill the pico-8 lua-code into the terminal. Copy and paste this code into pico-8 an enjoy watching the picture.

  ruby pic2pico.rb

...same with loading a custom image

  ruby pic2pico.rb "$PATH_TO/my_img.png"

Append the generated code automatically to an existing.p8 file:

ruby pic2pico.rb "$PATH_TO/my_img.png" >> program.p8
