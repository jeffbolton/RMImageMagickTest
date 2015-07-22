
Trying to use ImageMagick to use the gif encoding.   The first to lines are:

    mw = NewMagickWand()
    MagickSetImageFormat(mw, "gif")

`NewMagickWand()` works. `MagickSetImageFormat` is always not found.  I added them in `app_delegate.rb` in `viewDidLoad` for testing.

 First I tried the pod:

    rake clean
    rake pod:install
    rake

Compiles fine, then on run it can't find some of the functions I am looking for.
Run into this:

    app_delegate.rb:16:in application:didFinishLaunchingWithOptions:': undefined method MagickSetImageFormat' for #<AppDelegate:0x10ae46a00 ...> (NoMethodError)

After poking around in the generated bridge support, I felt like stuff was missing.  So I decided to try and vendor for more control.

So I `rake clean` and removed the pod from the Rakefile

----------


The Documentation is confusing but I found that the pod is based on this: http://www.imagemagick.org/download/iOS/,  so I tried the pre-compiled binaries.
Pre-compiled is in `vendor/iOSMagick`

this was added to the Rakefile

    app.vendor_project('vendor/iOSMagick', :static, :cflags => '-lMagickCore -lMagickWand -ljpeg -lpng -lbz2 -lz -Dmacintosh=1')

Similar issues.

Then I compiled my own stuff from https://github.com/marforic/imagemagick_lib_iphone
Compiled by me is in `vendor/ImageMagick`

then similarly added:

    app.vendor_project('vendor/ImageMagick', :static, :cflags => '-lMagickCore -lMagickWand -ljpeg -lpng -lbz2 -lz -Dmacintosh=1')

Similar problem

----------


Looking throught the bridgesupport I noticed most of the stuff that was missing was from the `include/wand` section of the headers.  I played around with generating the bridgesupport myself and found that I was getting and error around this code in `include/wand/MagickWand.h`

```
#if !defined(_MAGICKCORE_CONFIG_H)
# define _MAGICKCORE_CONFIG_H
# if !defined(vms) && !defined(macintosh)
#  include "magick/magick-config.h"
# else
#  include "magick-config.h"
# endif

```

It was saying *'magick-config.h not found'*

Then I remembered the docs state:

> After including everything into XCode please also make sure to have
> these settings (Build tab of the project information): Other Linker
> Flags: -lMagickCore -lMagickWand -ljpeg -lpng -lbz2 -lz Header Search
> Paths: (SRCROOT) - make it Recursive Library Search Paths: $(SRCROOT)
> - make it Recursive On the lower left click on the small-wheel and select: Add User-Defined Setting Key: OTHER_CFLAGS Value:
> -Dmacintosh=1

I believe the -Dmacintosh=1 might be messing up the paths.  I am not super familiar with it but after some research I think -D defines something like and env variable that is passed to the compiler.  Is there a property to pass this through bridge support generation?
