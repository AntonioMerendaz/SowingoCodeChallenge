# SowingoCodeChallenge:

We've got two mocked up REST endpoints, one for a list of products and one for altering
products' favorite status.

<b>Your challenge</b> is to build one screen with the following using Swift:<br>
- display all listed products with fetch from products endpoint<br>
&nbsp;&nbsp;&nbsp;&nbsp;o first 3 products represent the large size<br>
&nbsp;&nbsp;&nbsp;&nbsp;o remainder use the smaller size<br>
- search bar: filter list in real time through the search input on top with the name<br>
- make changes to favorite status with a call to the favourites endpoint, but keep<br>
state changes in memory (favourite default vs favourite active)<br>
- filter button: will filter for products which are marked favorites (filter default vs filter
active)<br>
- implement standard pull-to-refresh to reset the filter state (all products set as
favourite default)

## About the implementation:
### Architecture:
#### Model-View-Controller (MVC)
Despite its obvious disadvantages, in relation to other architectures, such as MVVM, MVP, etc., I chose to use it as a matter of time limit to solve the problem presented. If there is time, I will refactor the code for use with MVVM.

To prevent the Massive View Controller, dumping code like that related to accessing the network for consumption of WebAPI and formatting data in the Controller, this was done seeking the best possible separation of concerns, doing the task of refactoring to MVVM and adding Unit The tests become much simpler.
