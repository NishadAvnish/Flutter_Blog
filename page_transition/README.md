# page_transition

A new Flutter project.


You all know that routing in flutter is easy, we just need to push to pop in order to route from one page to another.
Push:
Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const SecondRoute()),
  );
// or
Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => const SecondRoute()),
  );
Pop: 
Navigator.pop(context);
//or
Navigator.of(context).pop();
but you know what, we can add animation to the above routing. Yes, It's possible and we will use PageRouteBuilder to do so.


https://user-images.githubusercontent.com/42611371/184593411-20f59bc9-c639-4a60-83f1-973edf6d410f.mp4

