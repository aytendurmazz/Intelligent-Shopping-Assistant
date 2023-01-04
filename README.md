
# Intelligent Shopping Assistant

"Intelligent Shopping Assistant" is an application that helps people, much like an assistant, with problems that arise while shopping in the market. It combines these technologies with a personalized recommendation system to increase the quality of the shopping experience by using an artificial intelligence and computer vision-supported program to provide the user with an educated guess about the quality of the product, and to prevent products from being forgotten during the shopping process.

## Methods and Technologies

Flutter architecture is used on the front side of the application and the most suitable model for this is MVC architecture. Other services that the application will use are Firebase Database and TFLite. Tensorflow Lite API can be integrated and used in Flutter as a module.

**TensorFlow-Lite (TFLite) :** 

TensorFlow-Lite, a deep learning model for mobile devices, has been developed to make the TensorFlow library, used in machine learning and deep learning techniques, more efficient on small devices such as mobile devices, embedded systems, and IoT devices.

**MobileNet-SSD:** 

While developing a deep learning model, appropriate input must be given to the model for model success, and an appropriate method must be used to analyze and evaluate these inputs.
MobileNet-SSD is an object recognition model developed to calculate the boundaries and category of an object from an input image. This SSD object recognition model uses MobileNet as the main building block and provides fast and effective object recognition optimized for mobile devices. For this reason, it is one of the popular models used.

**Flutter :**

Flutter is an open-source application development SDK developed by Google, which can be considered as a recent technology and entered our lives in 2016. The reason why this technology is preferred is that it is easy to learn and can be performed quickly with hot-reload operations. In addition, it is easy to develop original projects with the design planning available in its own libraries.

**Firebase :**

Firebase Realtime Database allows changes to be updated simultaneously in the database. Changes made in the application take place simultaneously in the database. Android Studio was preferred because it can easily serve platforms such as Flutter and is free.
## Packages

The application consists of 6 packages: Components, Controller, Model, Helper, UIprinciple, and View.

- Components: This is the package where common UI widgets used in the View classes in UI coding are kept.
- Controller: Controllers act as a layer between the Model and View components to process incoming requests, manipulate data using the Model component, and interact with Views to generate the final output.
    The application basically contains five controller classes: Auth Controller, Cart Controller, Product Controller, Stand Controller and User Controller.
    
- Model: This is the package where objects are created and data structures are stored.
    The data model of the application is created in the form of classes under the Model package. Object-oriented programming is preferred, and an object is defined in each class. These objects are stored this way in the frontend and API, but are stored in the Firebase database in the back-end. There are 6 types of object classes in the application, these are Cart, Order, Market, Product, Stand and User.
    
- Helper: This is the package that contains auxiliary services.
- UIPrinciple: This is a package where certain standards are determined and components such as theme, color palette, and fonts are coded in order to make the coding in accordance with UI standards.
- View: This is the part that is presented to the user by displaying the requests coming to the Controller structure from the users after the communication between the Controller and Model. It consists of interface pages.
    The home page of the application is coded in the "home" package. Similarly, the user can view their profile thanks to the "profile" package. A separate package was used for each page, thus ensuring clean coding and a clear class structure.
