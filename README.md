# treebnb

[treebnb](www.treebnb.me) is an [airbnb](www.airbnb.com) clone that exclusively features tree houses. It was built by [Jorge Rodriguez](www.jorgerafaelrodriguez.com) using Ruby on Rails along with Backbone.js and other jQuery and Javascript features. All pages were hand-styled.

## Features

treebnb features the core functionality of airbnb. Users can:

* Create and manage a profile page
* Search for treehouses by location and dates
* View availability for all listed treehouses
* List their own treehouses for other users to request a stay
* Write reviews of users(hosts) and treehouses
* Send and receive messages
* Receive notifications
* Approve or deny requests to their listings
* Use the Dashboard feature to manage their concerns

## Technologies Used

Various technologies were utilized to make treebnb work. 

* Uses of custom SQL queries to validate room requests against room availability supplied by the room owner and previously approved room requests
* Allows uploading of pictures using Paperclip and ImageMagick
* Customized interactive map using Mapbox's Javascript API
* Dynamic jQuery UI Datepicker calendar that responds to room availability changes in the database
* Dashboard feature uses Backbone.js put all the user's main concerns on one page 
  * Overwrites parse method in Backbone message model
  * Builds custom JSON using Jbuilder
* Polymorphic Notification model that creates notifications for new reviews, messages, and changes in the status of pending requests
* Pagination using Kaminari
* Designed to work with or without JavaScript enabled

## Still To Do

* Set up a mailer to confirm email addresses
* Use OmniAuth to allow signup via a third party application
* Further integrate Datepicker to allow for date selection
* Use jQuery UJS to decrease number of page loads
* Use Pusher to update message view in real time
* Add the ability for users to reset passwords