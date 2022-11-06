
**About the app:**

This is a demo that hits the NY Times most popular articles API and show a list of articles, that shows details when items on the list are tapped using VIPER Architecture.

**App Build/Run Details** 

-----------------------------------------

App developed using Xcode 14.0, minimum iOS Version: 13.0


**VIPER** stands for:
V -> View
I -> Interactor
P -> Presenter
E -> Entity
R -> Router


**Demo App Viper Components**

-----------------------------------------
Each VIPER module consists of the following parts:

View (View, ViewController, Cells)
Interactor (Business Logic, Use Cases)
Presenter (Prepare Business logic for presentation in the View)
Entity (Model)
Router (Take control of Routing)

**additional modules added to the app:**
Repository (Api/DB Calls)
Module Factory (Assemble the VIPER module)

**Main VIPER architecture compoment and interactions**

![image](https://user-images.githubusercontent.com/8080426/200169881-21840360-53f2-462d-8294-03dd08cf66f7.png)

**Unit Testing**

-----------------------------------------

One of the advantages of the separation VIPER endorses is in testability. You can test the interactor so that it can read and manipulate the data model. And you can do all that while independently testing the presenter to change the view and respond to user actions.


**Run Unit Test**

-----------------------------------------

1. open terminal 
2. cd to app main folder
3. execute this command "./RunTestCases.sh"

**App ScreenShots**

-----------------------------------------

**1. Master Screen**
![image](https://user-images.githubusercontent.com/8080426/200169271-02345b2d-a71e-4c3c-8019-0294029634ce.png)

**2. Details Screen**
![image](https://user-images.githubusercontent.com/8080426/200169295-8f015206-b213-4c0d-9ae4-330dad8e7ccf.png)
