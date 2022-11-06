
**About the app:**

This is a demo that hits the NY Times most popular articles API and show a list of articles, that shows details when items on the list are tapped using VIPER Architecture.

<br/>

**App Build/Run Details** 

-----------------------------------------

App developed using Xcode 14.0, minimum iOS Version: 13.0

<br/>

**Demo App Viper Components**

-----------------------------------------
Each VIPER module consists of the following parts: <br/><br/>

View (View, ViewController, Cells) <br/>
Interactor (Business Logic, Use Cases) <br/>
Presenter (Prepare Business logic for presentation in the View) <br/>
Entity (Model) <br/>
Router (Take control of Routing) <br/>

**Main VIPER architecture components and interactions**

![image](https://user-images.githubusercontent.com/8080426/200169881-21840360-53f2-462d-8294-03dd08cf66f7.png)


**additional modules added to the app:** <br/>
1. Repository (Api/DB Calls) <br/>
2. Module Factory (Assemble the VIPER module) <br/>

<br/><br/>

**Unit Testing**

-----------------------------------------

One of the advantages of the separation VIPER endorses is in testability. You can test the interactor so that it can read and manipulate the data model. And you can do all that while independently testing the presenter to change the view and respond to user actions.

<br/>

**Run Unit Test**

-----------------------------------------

1. open terminal <br/>
2. cd to app main folder <br/>
3. execute this command "./RunTestCases.sh"


**Note:** make sure you have unit test destination as mentioned in **RunTestCases.sh** file 'platform=iOS Simulator,name=iPhone 14,OS=16.0' otherwise please update it before you run the test 

<br/>


**App ScreenShots**

-----------------------------------------

**1. Master Screen**
![image](https://user-images.githubusercontent.com/8080426/200169271-02345b2d-a71e-4c3c-8019-0294029634ce.png)

**2. Details Screen**
![image](https://user-images.githubusercontent.com/8080426/200169295-8f015206-b213-4c0d-9ae4-330dad8e7ccf.png)
