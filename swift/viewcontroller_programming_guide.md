# Adding a Child View Controller to Your Content
To incorporate a child view controller into your content programmatically, create a parent-child relationship between the relevant view controllers by doing the following:

- Call the addChildViewController: method of your container view controller.
  - This method tells UIKit that your container view controller is now managing the view of the child view controller.

- Add the child’s root view to your container’s view hierarchy.
  - Always remember to set the size and position of the child’s frame as part of this process.

- Add any constraints for managing the size and position of the child’s root view.

- Call the didMoveToParentViewController: method of the child view controller.
