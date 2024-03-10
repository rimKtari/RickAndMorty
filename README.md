# RickAndMorty Overview

To enhance user engagement and streamline the organization of character information, our Characters List app employs advanced algorithms to analyze and categorize character data effectively. 
# Github Repository
1. Please find here the Git Repository :
https://github.com/rimKtari/RickAndMorty.git

# Presentation

Our Application is build using SwiftUI. We MVVM-Coordinator Architecture to design the app. 
The App Contains the following Screens:

**List of all characters** - based on the provided set of characters, compute all the existing characters and display them as a list, also this list contains a button that allow user to go to the favorites list screen



**Character Details** - this screen allows user to see the details of the selected character. He can also favorite / unfavorite it 

**List of all favorite characters** - based on the provided set of favorite characters which are saved locally using UserDefaults (we can change it later to CoreData)

# Domain
 It contains Entities(Business Models), Use Cases, and Repository Interfaces
# Data
It contains the Repository Implementations and Data Sources.

# Missing Tasks

In this project we missed that the data should be saved locally when no internet is there and should be displayed. For lack of time, I missed this part. I saved only the favorites list in a UserDefaults.
To do this part we can use CoreData or SwiftData
