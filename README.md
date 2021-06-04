waro_flutter
=========

a Flutter submission for War-O as a code exercise

* work-in-progress
* next
    - unit test for MyMQ
* TODO
    - the app bar is probably not idiomatic
    - visible for testing - https://stackoverflow.com/questions/21657315
    - consider const constructors
    - fold vs reduce
    - about page with build info 
    - current styling is utilitarian and hideous
    - figure out centering and relative sizing
        - use Card with nice shadow
    - review encapsulation/Demeter
    - bug: config only works the first time?
        - on Chrome ... Android ok
    - code layout in folders
        - consider `services` for dealer and auditor?
    - status bar should be a SnackBar
        - not sure how to fire programmatically
    - REST API strategy
    - config 
        - X - sort-order preference
        - read from JSON file 
        - ThemeData
    - full unit tests
    - styling
        - remove hardcode font size
    - state management
    - clean up widgets
    - make idiomatic for Flutter, Dart 
    - use a grid for cards when # of cards > N
        - use scrollable ListView ?
        - or GridView! 

To Build:
---------

* TBD

To Run:
---------

* `./run.sh` for device emulator
* `./run.web.sh` for Chrome
* `./test.sh` for unit tests
* `./format.sh` for code formatting

Rules:
---------

Rules are [here](Rules.md).
