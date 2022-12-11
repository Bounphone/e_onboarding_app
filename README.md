<h1 align="center">Hi 👋, ladies and gentlemen We're developer team of e-onboarding application</h1>
<h3 align="center">"Employee Onboarding" refers to the processes in which new hires are integrated into the organization. It includes activities that allow new employees to complete an initial new-hire orientation process, as well as learn about the organization and its structure, culture, vision, mission and values. For some organizations, the onboarding process consists of one or two days of activities; for other organizations, this process may involve a series of activities spanning one or many months.</h3>

## How to Use

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/Bounphone/e_onboarding_app.git
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies:

```
flutter pub get 
```

**Step 3:**

Connect emulator and type `flutter run` to run this project

```
flutter run
```

## Project Structure

Our project base on MVVM pattern (Model View ViewModel) like this:

```
lib/
|- config
|- features
    |- auth
        |- model
        |- screen (view)
        |- view model (view_model)
|- utils
|- widgets
|- main.dart
```

Now, lets dive into the lib folder which has the main code for the application.

```
1 - Config -  All the application level constants are defined in this directory with-in their respective files. This directory contains the constants.
2 - features - Contains each features and There are MVVM (Model, Screen (View), ViewModel)
3 - widgets - Contains the common widgets for your applications. For example, Button, TextField etc.
4 - util - Contains the utilities/common functions of your application.
5 - main.dart - This is the starting point of the application. All the application level configurations are defined in this file
```

<h3 align="left">Languages and Tools:</h3>
<p align="left"> <a href="https://dart.dev" target="_blank" rel="noreferrer"> <img src="https://www.vectorlogo.zone/logos/dartlang/dartlang-icon.svg" alt="dart" width="40" height="40"/> </a> <a href="https://www.figma.com/" target="_blank" rel="noreferrer"> <img src="https://www.vectorlogo.zone/logos/figma/figma-icon.svg" alt="figma" width="40" height="40"/> </a> <a href="https://firebase.google.com/" target="_blank" rel="noreferrer"> <img src="https://www.vectorlogo.zone/logos/firebase/firebase-icon.svg" alt="firebase" width="40" height="40"/> </a> <a href="https://flutter.dev" target="_blank" rel="noreferrer"> <img src="https://www.vectorlogo.zone/logos/flutterio/flutterio-icon.svg" alt="flutter" width="40" height="40"/> </a> </p>