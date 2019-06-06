# Every.Do-it-Again
Learning Outcomes
can use core data to persist data to the every do assignment
can create NSManagedObjects for every model that needs to be persisted
can use the NSFetchedResultsController to help display data in a table view
Goal
We are going to be re creating the every do assignment for earlier in the course, but this time we'll be adding core data to persist the user's data. The user will now be able to exit the app and come back without losing all their data. By the end of this assingment, you will have a fully functional todo list app.

Exercise
Todo List
The instructions for this exercise use the Master-Detail template which includes a class called the NSFetchedResultsController that helps manage sections and rows for you (among other things). Please use the code examples from today's lecture as a guide. You may also check the Apple documentation for NSFetchedResultsController.

Setup
Create a new Master-Detail Xcode Project and make sure you have the Use Core Data option selected.

Look at AppDelegate.swift and familiarise yourself with the added Core Data helper property and method added to the bottom (persistentContainer and saveContext()).

Look at MasterViewController.swift and notice that there is a computed property called fetchedResultsController.

Look at MasterViewController.swift datasource methods such as tableView(UITableView, cellForRowAt: IndexPath) that now support Core Data.

You'll notice that we're passing a type of Event to the NSFetchedResultsController. Event is just an NSManagedObject created by this Master-Detail template. If you open the xcdatamodeld file, you can see that xcode has created an Event entity with a single timestamp attribute. This Event entity is also used in a number of other places in the generated template code.

Create a Core Data model for the todo items
Add a new entity into your data model file (.xcdatamodeld) and name it ToDo for your Todo item class. (You may go ahead and delete the Event entity as you won't be using it.)

Add attributes to the entity to replicate the properties of the Todo Object: - title - todoDescription (note: a property cannot be named description, as that's already in use and is therefore reserved) - priorityNumber

Create a subclass of NSManagedObject for the Todo Core Data entity
Although we can create a subclass of NSManagedObject manually, Xcode will do this for us automatically, so we can immediately start using your new Todo entity in your Swift code.

With the ToDo entity selected, show the File Inspector to the right and confirm that the "Code Generation Language" selected is "Swift".

Show the Data Model Inspector to the right and confirm that the "Codegen" setting is set to "Class Definition".

If you see the following warning: Undefined symbols for architecture go to Product -> Clean and Product -> Clean Build Folder and try running the app again.

Replace Event with Todo
Modify the MasterViewController.swift and DetailViewController.swift files so that it refers to the Todo Core Data entity. Ensure to replace all places where the Event entity is used.

You may need to rename variables or function parameter names to match.

If you see any lines that refer to the timestamp property of the Event entity, Xcode might give an error. You may ignore or comment out these lines for now. We will be replacing these with the Todo properties later on.

Display ToDo in MasterViewController
Modify tableView(UITableView, cellForRowAt: IndexPath) so that it displays the title, todoDescription and priorityNumber properties from the Todo Core Data entity in the cell's textLabel and detailedTextLabel fields respectively.

Note: tableView(UITableView, cellForRowAt: IndexPath) uses a helper method `configureCell(, withTodo)` to achieve this._

Caution: Ensure that you properly unwrap optionals!

Add Ability to Create New Todo Tasks
Determine where in the generated template code the user is able to create new objects.

Hint: find where the generated code created new Event objects.

If you haven't done so already, replace these new Event objects with new Todo objects.

When creating new Todo objects, its properties (title and todoDescription) need to be populated. You may use UIAlertController to prompt the user for these values.

Retrieve and Display Todo Tasks
Locate in the code where the tasks are retrieved from CoreData.

Hint: This is where NSFetchResultsController is used.

Update the sort descriptor to sort all the Todo items by title.

Test and ensure that both the title and todoDescription properties are displayed correctly.

Update DetailViewController
Update the DetailViewController.swift file so that the Todo object is properly displayed.

Ensure that all three properties are displayed correctly.

Defaults for each field
Create a 'default todo task' by storing values in NSUserDefaults for each property of a Todo task.

Use the defaults to pre populate the values in the UIAlertController when the user is creating a new task.

