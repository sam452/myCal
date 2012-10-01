My Calendar project
===============

Goal
---------------------
myCal is a Ruby implementation of the UNIX cal command. Ultimately it will handle up to a year
but it presently only handles a month.

Features
---------------------
From a month and year given to it as parameters, it returns to the STDOUT a pretty output of that month in a calendar format.
The code has been tested with unit tests.

###Limitations
---------------------
myCal is able to handle months from 1800 to the year 3000. 

###How to use it
Clone the code to your computer and using the Terminal application navigate to the directory you saved it and type:
> cal.rb 02 2002

###Dependencies
myCal was tested against Ruby 1.9.3 and uses the standard libraries.

##Resources
This is dependent on an implementation of Zeller's Congruence to determine what day of the week 
a month starts on. My source was [Wikipedia](http://en.wikipedia.org/wiki/Zeller%27s_Congruence).
The project started as a clone of Cal, which accepts a string for a month. Looking at the instructions,
it says we should use the numeric representation of a month. So it gets a little hacky in swinging it
to using the number. The other thing about Zeller's equation is that the months are ordered differently
to account for February having a year-dependent number of days. The year starts in March and if the instance
sent to it is before March, the year is subtracted to account for it.

##Bugs/ToDo
Must work on having the option to pass in a year and get the entire 12 months to appear in format.
There must be exception handling to deal with the string of the month being passed to it.

##Author info & Attribution
I am Sam W and I had key help in writing this project and making it work.