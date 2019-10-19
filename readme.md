# About

pic2pico. A simple tool that converts pico-8 palette ready .png images to native p8-format
(not sprites), that you can load images as code into pico-8. Made by http://www.nodepond.com

# Install

This is a script written in Ruby. It requires the 'chunky_png'-gem (http://chunkypng.com). To install this gem, it should be enough to just install by typing the following command into the terminal:

  ```
  [sudo] gem install chunky_png
  ```

# How to run

Run the example and spill the pico-8 lua-code into the terminal. Copy and paste this code into pico-8 an enjoy watching the picture.

  ```
  ruby pic2pico.rb
  ```

...same with loading a custom image

  ```
  ruby pic2pico.rb "$PATH_TO/my_img.png"
  ```

Append the generated code automatically to an existing.p8 file:

  ```
  ruby pic2pico.rb "$PATH_TO/my_img.png" >> program.p8
  ```
  
# Like it?

Here are some other people who like it and used in their Pico-8 productions. Read the [awesome-list.md](https://github.com/nodepond/pic2pico/blob/master/awesome-list.md)
  
# Licence

MIT License

Copyright (c) 2016 Martin Wisniowski

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
