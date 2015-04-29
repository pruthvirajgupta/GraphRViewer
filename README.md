# GraphRViewer

-This project will create a GUI using racket/gui to take user input to graph and equation using the plot library

#Authors

Jonathan Wydola  Pruthviraj Gupta Pabba

#Overview

GraphRViewer was designed to make graphing functions for the user easily and accurately.
To ensure this, we have designed a GUI interface that allows a user to enter their function requirements.
We have also added features that allow the user to change the style of their graph.

#Screenshot

![screenshot showing env diagram](Screenshot1_ntxtf.png)

#Concepts Demonstrated

* **Data Abstraction** between the GUI and the process of graphing equations
* The method used to store information resembles a **recursive data stucture**


#External Technology and Libraries

* Rackets gui library
* Plot library

#Favorit Lines of Code
####Jonathan

```scheme
(define/public (update-choices choicelst)
           (map (lambda (old)
                  (send old delete))
                (send (get-menu) get-items))
           (map (lambda (choice)
                  (append choice))
                choice))
```
This is my favorite procedure throughout the entire project. It essentially updates the choices of a combo-box
or any menu derived choices. This allows me to dynamically change choices to prevent to many boxes.

#How to Download and Run

* Head over to my latest release to get all of the code.
