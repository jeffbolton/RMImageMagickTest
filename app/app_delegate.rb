class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    rootViewController = UIViewController.alloc.init
    rootViewController.title = 'ImageMagickTestApp'
    rootViewController.view.backgroundColor = UIColor.whiteColor

    navigationController = UINavigationController.alloc.initWithRootViewController(rootViewController)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = navigationController
    @window.makeKeyAndVisible

    ## Tests
    mw = NewMagickWand() # Will work with Pod, not with vendoring
    p "mw is a #{mw.class}"
    MagickSetImageFormat(mw, "gif") #

    true
  end
end
