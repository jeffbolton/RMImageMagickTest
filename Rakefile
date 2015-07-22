# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'ImageMagickTestApp'
  app.deployment_target = '8.0'
  app.sdk_version = '8.4'

  app.pods do
    pod 'ImageMagick'
  end

  app.libs << '/usr/lib/libxml2.dylib'

  #pre-compiled from http://www.imagemagick.org/download/iOS/
  # app.vendor_project('vendor/iOSMagick', :static, :cflags => '-lMagickCore -lMagickWand -ljpeg -lpng -lbz2 -lz -Dmacintosh=1')

  #I compiled from https://github.com/marforic/imagemagick_lib_iphone
  # app.vendor_project('vendor/ImageMagick', :static, :cflags => '-lMagickCore -lMagickWand -ljpeg -lpng -lbz2 -lz -Dmacintosh=1')
end
