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

In order to prevent the Massive View Controller, pouring pieces of code into the Controller, such as the one related to accessing the network for consumption of WebAPI and data formatting, this implementation was done seeking the best possible separation of concerns, making the task of refactoring for MVVM and adding unit Testing becomes much simpler.
<br>
### Some Screens:
#### 1 - Fetched the list of Products and showed the first 3 in a larger size Custom cell and the remainder in a smaller size<b>
  
![video1](gifs/video1.gif "video1")<br>

#### 2 - Using a searchBar, filter the elements in real time by their name:<b>
  
![video2](gifs/video2.gif "video2")<br>

#### 3 - The state of the button (heart filled or only outline) depends, at the beginning, on the info from data fetched (favourites default).  To chenge the state, it's only to click on the button<b>
  
![video3](gifs/video3.gif "video3")<br>

#### 4 - When click on the filter button, only the elements favourite active(heart filled) are shown:<b>
  
![video4](gifs/video4.gif "video4")<br>

#### 5 - When the tableview are pulled down, the data will be refreshed, by fetching new one from the webAPI:<b>
  
![video5](gifs/video5.gif "video5")<br>

