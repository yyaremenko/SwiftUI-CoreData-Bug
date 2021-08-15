Looks like SwiftUI + CoreData (+ FetchRequest) have a bug:
if I pass NSManagedObjectContext into a child view
and create a new CoreData object in such child view,
with the context injected via constructor,
I get an endless recursive rebuild of views.

Run the build as usual and see the debug area.
If you comment out the ForEach() in the ContentView,
the recursion will disappear.

XCode version 12.5.1 (12E507)
MacOS BigSur 11.4
MacBook Air m1, 2020
