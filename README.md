# Brastlewark

a simple list of inhabitants of Brastlewark obtained from a public json list: https://raw.githubusercontent.com/rrafols/mobile_test/master/data.json


# Instructions

- From your computer in a terminal run `git clone https://github.com/DroidFxGit/Brastlewark.git` and wait until repository is downloaded.

- Please verify if you have right version of  `Cocoapods` for this project pods are installed under `1.9.0 version`
    - In case you haven't installed Cocoapods in your Mac, you can follow the instructions of the link: https://cocoapods.org/ 

- Go to the main path of the project and run `pod install`and wait until pods are installed under the project.

- Once pods are installed please open file `Brastlewark.xcworkspace`, for this project please check you have installed Xcode `Version 11.3.1 (11C504)` or later.


# Main Modules

- Home screen: Basically shows all results from json list. every component shows and image, name and age of every Gnome, also you can filter information writing a name of a random Gnome in the search bar and that way you can filter similar names from the list.

- Detail Screen: Shows all the details for a selected Gnome in particular.


# Arquitecture

- For this exercise in particular I followed MVVM-C arquitecture. Which is basically Model, View, ViewModel and coordinators.
 
 The model: represents the actual data and/or information we are dealing with.
 
 The view: is what most of us are familiar with and the only thing the end user really interacts with. It is the presentation of the data.
 
 The viewmodel: Exposes methods, commands, and other points that help maintain the state of the view, manipulate the model as the result of actions on the view, and trigger events in the view itself.

Coordinator: Basically handles the flow for present the views into the application, and also takes care about build entire flows and have te ability to mainipulate them easily in case a flow is presented in different ways into the app.

# Third party Libraries used in this project

- PINRemoteImage: is an image downloading, processing and caching manager. It uses the concept of download and processing tasks to ensure that even if multiple calls to download or process an image are made, it only occurs one time (unless an item is no longer in the cache).

Mainly reason I used this third party library is because is from a confident resource and implemented by `Pinterest`, one of the best mobile apps for image sourcing, and of course to save some time. While developing this I tried to use my own library but it had some limitations, after use this library I noticed image downloading was faster than before. To see more details about this library you can check their repository: https://github.com/pinterest/PINRemoteImage
