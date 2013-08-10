ELParallaxScrollview
====================
This project was created as an easy way to introduce parallax scrolling into iOS. It is a single class which inherits from a UIView and contains a regular UIScrollView.

<iframe width="420" height="315" src="//www.youtube.com/embed/oxJqNcEaJaA" frameborder="0" allowfullscreen></iframe>

Features
====================
Because it is just a UIView, it is extremely portable. This class is supported by all devices and orientations. However, there currently is no multi-axis support. This means that a scrollview whose contentview is larger than the screen for both the width and height will have to choose a single axis to track when animating the frames of individual views.

Install
====================
Simply download the two files

- ELParallaxScrollview.h
- ELParallaxScrollview.m

and add them to your project.

Usage
====================
In the view controller that you wish to use this class in:

```
#import "ELParallaxScrollview.h"
```

and then just like any other class that inherits from a UIView:

```
ELParallaxScrollview * pSV = [[ELParallaxScrollview alloc] initWithFrame:CGRectOffset([[UIScreen mainScreen] applicationFrame], 0, -20) andIsVertical:YES];
[pSV setContentSize:CGSizeMake([[UIScreen mainScreen] applicationFrame].size.width, 1600)];
[self.view addSubview:pSV];
```

The above code initiliazes, sets the frame, and states the direction the parallax animation tracks. Also, just like a UIScrollview, we set the contentsize appropriately or else no scrolling will occur. Finally, adding it as a subview.

From here it is as easy as adding subviews to a UIView. A little math and preplanning will be involved to get your desired outcome, but it should be fairly straight forward. *Note*: The order you add the subviews matters. It is like layering a pizza.

```
-(void)addSubview:(UIView *)view;

-(void)addSubview:(UIView *)view withEndPoint:(CGPoint)endPoint;

-(void)addSubview:(UIView *)view withEndPoint:(CGPoint)endPoint
                        andAnimationStart:(CGFloat)animationStartPoint
                          andAnimationEnd:(CGFloat)animationEndPoint;
```

The above are your three choices for adding the subviews. In the order they appear, this is what each one does/assumes:

1. Simply adds the subview to the scrollview. No animation will be applied and the view will stay still. However, if you have views parallaxing around it, it may give the illusion that it is parallaxing as well.
2. Begins animating when the scrollview offset is greater than the view's original frame location and less than the endPoint parameter. EndPoint is where the frame will end up. Both the x and y will be translated, so think carefully about what values you put.
3. This method is just like the 2 except you can manually dictate at what point the animation should start and stop while scrolling.

Coming Soon
=====================
The following list will soon be implemented:

- ParallaxScrollingDelegate to allow further customization of behaviour as you scroll. This will allow you to go crazy and do anything from swapping images to resizing etc.
- Native opacity with parallax scrolling. Will allow for fading in and out of elements, which can be very useful.
- Multi-axis support, so that a large 'canvas' can properly view multiple parallaxing layers

Contact & Questions
=====================
If you have any questions or concerns contact me at

- ealui@uwaterloo.ca
- http://ealui.com/index.php/contact