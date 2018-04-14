# iOS Modular Architecture

This is just me practicing a modular architecture :)

**Object Oriented Design Patterns**
We have used several design patterns in the projects, main ones:

- Factory Pattern.
- MVP (we have added a router layer on top of MVP).
- Delegate Pattern
- etc...


**Modules**
Each functionality offered by the application has been decoupled in its own module. The project
has 3 types of module
- ApiModule: This module implements all functionality required to perform
request/response and connect to node server
- UIModule: is a ui component module that has reusable UI.
- FeatureModule: We have three of them Login, Payment and Place modules.
Each module has an entry point, which you choose to either use the default implementation or
override it. This is available through passing a factory upon module initialisation that allows you
to control the creation of instances and adjust the implementation.
Modules allows for modular application, where feature/modules can be extracted and used for
any other projects.



**Feature Module**
The feature module is a module and includes the implementation of screen flows which offers
certain functionality. In the feature module you will find the MVP along with the factory pattern.
On top of MVP we have added a router layer and dropped the usage of storyboard segues.
Here is a diagram that illustrate the architecture:
Router lifecycle within a feature module is determined by the View lifeCycle, unless you want to
explicitly retain the router. The reason we did it this way was based on the rule that if no view for
this feature exists no routing should take place.
To provide high decoupling and abstraction, feature modules can communicate with each other
through delegates declared at the router level. Check LoginRouter for a sample.

![Feature Module](/Docs/image1.png)

**Api Module**
The api Module, implements all functionality required to perform request/response and connect
to node server.
Here is a diagram that illustrated the design:

![Api Module](/Docs/image3.png)

**Application Design**
Now putting all the above together this how it looks:


![Application Design](/Docs/image2.png)