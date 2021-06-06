waro_flutter
=========

A Flutter submission for War-O as a code exercise. [Rules here](Rules.md) and collection of examples [here](https://github.com/peidevs/Resources/blob/master/Examples.md).

A work-in-progress: may not be 100% idiomatic (yet) in Flutter, or Dart.


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

TODO:
---------

* next
* brain-dump:
    - French / i18n
    - the app bar is probably not idiomatic
    - visible for testing - https://stackoverflow.com/questions/21657315
    - consider const constructors
    - fold vs reduce
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
        - read from JSON file 
        - ThemeData
    - full unit tests
    - state management
    - clean up widgets
    - make idiomatic for Flutter, Dart 
        - Cupertino
    - use a grid for cards when # of cards > N
        - use scrollable ListView ?
        - or GridView! 
