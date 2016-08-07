# Project_3_Pets
project 3 for GA


Introduction:
-------------

WuvR is an app by Marque Reavley and Marie-Claire Balabanian. It is currently still under construction. the mission of WuvR is to connect prospective animal adopters with their future animal babies. 


Technologies Used:
------------------
WuvR uses HTML, CSS, LESS, JavaScript, JQuery, Ruby, Sinatra, Active Record and SQLite. It uses the Petfinder.com API to provide users with listings of adoptable animals and the Google Maps API to restrict the Petfinder.com results to a designated search area.


Wireframe & User Stories:
-------------------------
hand-drawn wireframe can be found at: http://imgur.com/a/3GQVl

Users can sign up, log in and log out. Once a user session has begun by signing up or logging in, the user is directed to a Profile page. The profile page allows a user to perform a search for adoptable animals based on type of animal, breed and the user's zip code. Currently, the search radius is 50 miles. The Profile page also contains a section which stores a user's favorite animals which it can save via the search results page. Once the search button is pressed, the user is redirected to the search results page which provides a listing of available animals, each displayed as a little pet card which contains a thumbnail image and very basic information. A google map is displayed, with markers that mark the location of each animal. There is also a save button on each card. Once pressed, the pet is stored in the database and will, from then on, be displayed on the user's Profile page.


Problems:
---------
We encountered quite a few problems which were related primarily to approach. We started out with a lot of JavaScript and JQuery/Ajax. We eventually realized we needed to perform more functions on the back end in Ruby so that we could actually store data to our database. We also struggled with passing data from the controllers to the views and vice versa. All of the geocoding and map api functions should eventually be moved to the controller.


Things to add:
--------------
What we wanted to do was have the pet cards on the search results page link to a pet profile page that displays a thorough profile of the selected animal. From there the user would be able to save the animal listing to the user profile page.

