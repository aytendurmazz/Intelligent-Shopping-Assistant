
# Intelligent Shopping Assistant

Intelligent Shopping Assistant is a mobile application that functions as a virtual shopping assistant, helping users with various challenges encountered during their shopping experiences. This application utilizes artificial intelligence and computer vision technologies, along with a personalized recommendation system, to enhance the overall quality of the shopping process. It offers features such as product quality assessment and prevention of forgotten items through intelligent suggestions.

## Methods and Technologies

Flutter architecture is used on the front side of the application and the most suitable model for this is MVC architecture. Other services that the application will use are Firebase Database and TFLite. TensorFlow Lite API can be integrated and used in Flutter as a module.

**TensorFlow-Lite (TFLite):** 

TensorFlow Lite is a deep learning framework specifically designed for mobile devices, embedded systems, and IoT devices. It optimizes the TensorFlow library, widely used for machine learning and deep learning techniques, to run efficiently on resource-constrained platforms. In this project, TFLite is integrated into the Flutter application as a module, enabling the use of deep learning models for various tasks.

**MobileNet-SSD:** 

MobileNet-SSD is a popular object recognition model developed for efficiently calculating object boundaries and categories from input images. It is based on the MobileNet architecture, which serves as the main building block. MobileNet-SSD provides fast and effective object recognition specifically optimized for mobile devices. This model will be employed for object recognition tasks within the Intelligent Shopping Assistant application.

**Flutter:**

The front end of the application is built using the Flutter framework. The most suitable architecture for this project is the Model-View-Controller (MVC) pattern. Flutter's flexibility and hot-reload capability make it an excellent choice for rapid application development. The MVC architecture ensures a clear separation of concerns and enables efficient management of the application's components.

**Firebase:**

Firebase Realtime Database is used as a back-end service for the application. It offers real-time data synchronization, ensuring that changes made within the application are instantly updated in the database. Firebase provides easy integration with Flutter and offers multi-platform support, making it an ideal choice for this project. Additionally, Firebase is freely available, further enhancing its suitability.

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

## Getting Started
To run the Intelligent Shopping Assistant application locally, follow these steps:

- Clone the repository to your local machine.
- Set up the necessary dependencies and ensure you have Flutter and Firebase installed.
- Configure the Firebase Realtime Database by creating a new project and obtaining the required API keys.
- Update the Firebase configuration within the application to establish a connection with your Firebase project.
- Build and run the application on your preferred mobile device or emulator.
- For more detailed instructions on how to set up and run the application, refer to the project documentation available within the repository.
