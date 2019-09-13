# APP_NAME

This repo will help us store code for the APP_NAME project. Team members: A, B, C, D.

APP_NAME is a navigation app with safety in mind: we combine navigation and location data with fast updates on crime and danger reports, allowing users to understand quantitatively the tradeoffs and risks associated with travelling and safety. If you're in a an area you're unfamiliar with or need to know how to get home without any danger, APP_NAME is the perfect app for you!

## Front-End App

The front-end app is implemented as a iOS project written in Swift. The app can only be built using Xcode on MacOS.

First, open `front-end/APP_NAME/APP_NAME.xcworkspace` using Xcode. Press the "Build" button in the top-left corner of the screen to build and run the app.

## REST API server

*API HEALTH CAN BE MONITORED [HERE](https://cloudy-eclipse-4450.postman.co/monitors/1e8d7f08-4065-4310-b948-9b67771b5b42?job=1e8d7f08-50d6-42d0-96d2-17525b524308&workspace=29b2a85c-0fcc-4da2-8a31-6b0a8775afa0).*

### Install YAPF formatter

In order to ensure consistent formatting, we'll be using [yapf](https://github.com/google/yapf) for linting Python code. First, install yapf globally:

```
$ pip install yapf
```

Then, run the git pre-commit install hook:

```
$ ./install_git_hooks.sh
```

### Setting up vagrant development environment

To ensure consistent development environment between team members, we're using [Vagrant](https://www.vagrantup.com/). Please install VirtualBox and Vagrant on your development machine. To instantiate the latest synced development environment, please run (in the cloned folder)

```bash
# In host session
$ git pull
$ vagrant up
$ vagrant ssh

# In SSH session
# activate virtualenv
$ source ~/venv/bin/activate
# start development server
$ cd /vagrant/[APP NAME]-django/APP NAME
$ python manage.py runserver 0.0.0.0:8000
```

The `vagrant up` command will do the following in order:

1. Initialize a Ubuntu virtual machine, set up port-forwarding
2. Install system dependencies, Python 3 and Postgres
3. Set up a PostgreSQL database in the machine
4. Set up a python virtual environment at `$HOME/venv/bin/activate`

### Running tests

```bash
# In SSH session
# activate virtualenv
$ source ~/venv/bin/activate
# start development server
$ cd /vagrant/APP NAME-django/APP NAME
$ python manage.py test
```


## Starter app

### Running the development backend

*Back-End Developers: Nori, Jae, Daniel, Harry, Tejas*

We are using Django web server for our API development. In order to run the development environment, please set up a local instance of Postgres, virtualenv and run

```
cd starter-app/back-end
python manage.py runserver
```

This will run the server.


### Front-End Development

*Front-End Developers: Sesh, Vicky, Daniel*

##### Starter App
We are using XCode/Swift to create the Chatter starter app's front-end design. Simply open the Xcode project `/starter-app/front-end/Chatter.xcodeproj` with Xcode and click the "Build and Run" button. The core components of the app are in the following files:

- `Main.storyboard`: Contains the visual interface of the app
- `ViewController.swift`: Contains the core logic of the app, navigation control, and data retrieval and display

### Other Components
#### Datasets
The datasets we are using:
Crimes in Chicago: An extensive dataset of crimes in Chicago (2001-2017), by City of Chicago  
We extract crime details such as date, time, and location to populate our map.  
https://www.kaggle.com/currie32/crimes-in-chicago

BPD Part 1 Victim Based Crime Data  
We extract crime details such as date, time, and location to populate our map.  
https://data.baltimorecity.gov/Public-Safety/BPD-Part-1-Victim-Based-Crime-Data/wsfq-mvij

Baltimore 911 Calls: Records of 2.8 million calls from 2015 onwards  
We process frequency and priority of 911 calls at the given incident location to influence safety scores.  
https://www.kaggle.com/sohier/baltimore-911-calls/data

#### Machine Learning
Any machine learning tools we create for APP_NAME will be stored in another repository. Under construction ...

## Directory structure

```
.
├── APP_NAME-django
│   └── placeholder.txt
├── README.md
├── data
│   ├── BPD_Part_1_Victim_Based_Crime_Data.pk
│   ├── Raw_Data
│   │   ├── Baltimore
│   │   │   └── desktop.ini
│   │   ├── Chicago
│   │   │   └── desktop.ini
│   │   ├── Samples
│   │   │   └── samples.png
│   │   └── desktop.ini
│   └── scripts
│       └── process_911.py
├── data-tools
│   ├── nearest_safe_locations.ipynb
│   ├── news_crawled_baltimore
│   │   └── 3500_3600.pkl
│   ├── plots_baltimore
│   │   └── N_1P_50K_6048.png
│   └── plots_chicago
│       └── N_1P_50K_6048.png
├── front-end
│   ├── APP_NAME
│   │   ├── APP_NAME
│   │   │   ├── API
│   │   │   │   └── ApiHelpers.swift
│   │   │   ├── Assets.xcassets
│   │   │   │   ├── AppIcon.appiconset
│   │   │   │   │   └── SG60.png
│   │   │   │   ├── Circle.imageset
│   │   │   │   │   └── Circle@2x.png
│   │   │   │   ├── Contents.json
│   │   │   │   ├── Green.imageset
│   │   │   │   │   └── Green@1x.png
│   │   │   │   ├── GreenBW.imageset
│   │   │   │   │   └── GreenBW@1x.png
│   │   │   │   ├── GreenT.imageset
│   │   │   │   │   └── GreenT@1x.png
│   │   │   │   ├── LaunchImage.launchimage
│   │   │   │   │   └── Contents.json
│   │   │   │   ├── Red.imageset
│   │   │   │   │   └── Red@3x.png
│   │   │   │   ├── RedBW.imageset
│   │   │   │   │   └── RedBW@1x.png
│   │   │   │   ├── RedT.imageset
│   │   │   │   │   └── RedT@3x.png
│   │   │   │   ├── TabIconHome.imageset
│   │   │   │   │   └── Home@2x.png
│   │   │   │   ├── TabIconMap.imageset
│   │   │   │   │   └── Map@1x.png
│   │   │   │   ├── TabIconSettings.imageset
│   │   │   │   │   └── Settings@1x.png
│   │   │   │   ├── Yellow.imageset
│   │   │   │   │   └── Yellow@3x.png
│   │   │   │   ├── YellowBW.imageset
│   │   │   │   │   └── YellowBW@3x.png
│   │   │   │   └── YellowT.imageset
│   │   │   │       └── YellowT@1x.png
│   │   │   ├── Base.lproj
│   │   │   │   └── LaunchScreen.storyboard
│   │   │   ├── Controllers
│   │   │   │   ├── AmaticSC-Regular.ttf
│   │   │   │   └── Graphics
│   │   │   │       └── Home@2x.png
│   │   │   ├── Images.xcassets
│   │   │   │   ├── Contents.json
│   │   │   │   ├── bakery.imageset
│   │   │   │   │   └── Contents.json
│   │   │   │   ├── bakery_pin.imageset
│   │   │   │   │   └── bakery_pin@2x.png
│   │   │   │   ├── bar.imageset
│   │   │   │   │   └── bar@2x.png
│   │   │   │   ├── bar_pin.imageset
│   │   │   │   │   └── bar_pin@2x.png
│   │   │   │   ├── cafe.imageset
│   │   │   │   │   └── cafe@2x.png
│   │   │   │   ├── cafe_pin.imageset
│   │   │   │   │   └── cafe_pin@2x.png
│   │   │   │   ├── coffee.imageset
│   │   │   │   │   └── coffee@2x.png
│   │   │   │   ├── driving.imageset
│   │   │   │   │   └── driving@2x.png
│   │   │   │   ├── driving_pin.imageset
│   │   │   │   │   └── driving@2x.png
│   │   │   │   ├── filter.imageset
│   │   │   │   │   └── filter@2x.png
│   │   │   │   ├── generic.imageset
│   │   │   │   │   └── generic@2x.png
│   │   │   │   ├── grocery_or_supermarket.imageset
│   │   │   │   │   └── grocery_or_supermarket@2x.png
│   │   │   │   ├── grocery_or_supermarket_pin.imageset
│   │   │   │   │   └── grocery_or_supermarket_pin@2x.png
│   │   │   │   ├── icon_me.imageset
│   │   │   │   │   └── Contents.json
│   │   │   │   ├── restaurant.imageset
│   │   │   │   │   └── restaurant@2x.png
│   │   │   │   ├── restaurant_pin.imageset
│   │   │   │   │   └── Contents.json
│   │   │   │   ├── rw-logo.imageset
│   │   │   │   │   └── Razewarelogo_1024.png
│   │   │   │   ├── rwdevcon-bg.imageset
│   │   │   │   │   └── Contents.json
│   │   │   │   └── walking.imageset
│   │   │   │       └── Contents.json
│   │   │   ├── SharedNotificationManager.swift
│   │   │   └── Views
│   │   │       └── MarkerInfoView.swift
│   │   ├── Podfile
│   │   └── Pods
│   │       ├── GoogleMaps
│   │       │   ├── Base
│   │       │   │   └── Frameworks
│   │       │   │       └── GoogleMapsBase.framework
│   │       │   │           ├── GoogleMapsBase
│   │       │   │           ├── Headers
│   │       │   │           │   └── GMSDeprecationMacros.h
│   │       │   │           └── Modules
│   │       │   │               └── module.modulemap
│   │       │   ├── CHANGELOG
│   │       │   ├── Example
│   │       │   │   ├── GoogleMapsDemos
│   │       │   │   │   ├── DemoAppDelegate.h
│   │       │   │   │   ├── MapsDemoAssets.xcassets
│   │       │   │   │   │   ├── AppIcon.appiconset
│   │       │   │   │   │   │   └── Maps-SDK-Demo-App_180.png
│   │       │   │   │   │   └── Contents.json
│   │       │   │   │   ├── Resources
│   │       │   │   │   │   ├── Museum-Icons
│   │       │   │   │   │   │   └── x29@2x.png
│   │       │   │   │   │   ├── ar.lproj
│   │       │   │   │   │   │   └── InfoPlist.strings
│   │       │   │   │   │   ├── ca.lproj
│   │       │   │   │   │   │   └── InfoPlist.strings
│   │       │   │   │   │   ├── cs.lproj
│   │       │   │   │   │   │   └── InfoPlist.strings
│   │       │   │   │   │   ├── da.lproj
│   │       │   │   │   │   │   └── InfoPlist.strings
│   │       │   │   │   │   ├── de.lproj
│   │       │   │   │   │   │   └── InfoPlist.strings
│   │       │   │   │   │   ├── el.lproj
│   │       │   │   │   │   │   └── InfoPlist.strings
│   │       │   │   │   │   ├── en.lproj
│   │       │   │   │   │   │   └── InfoPlist.strings
│   │       │   │   │   │   ├── en_GB.lproj
│   │       │   │   │   │   │   └── InfoPlist.strings
│   │       │   │   │   │   ├── es.lproj
│   │       │   │   │   │   │   └── InfoPlist.strings
│   │       │   │   │   │   ├── fi.lproj
│   │       │   │   │   │   │   └── InfoPlist.strings
│   │       │   │   │   │   ├── fr.lproj
│   │       │   │   │   │   │   └── InfoPlist.strings
│   │       │   │   │   │   ├── he.lproj
│   │       │   │   │   │   │   └── InfoPlist.strings
│   │       │   │   │   │   ├── hr.lproj
│   │       │   │   │   │   │   └── InfoPlist.strings
│   │       │   │   │   │   ├── hu.lproj
│   │       │   │   │   │   │   └── InfoPlist.strings
│   │       │   │   │   │   ├── id.lproj
│   │       │   │   │   │   │   └── InfoPlist.strings
│   │       │   │   │   │   ├── it.lproj
│   │       │   │   │   │   │   └── InfoPlist.strings
│   │       │   │   │   │   ├── ja.lproj
│   │       │   │   │   │   │   └── InfoPlist.strings
│   │       │   │   │   │   ├── ko.lproj
│   │       │   │   │   │   │   └── InfoPlist.strings
│   │       │   │   │   │   ├── ms.lproj
│   │       │   │   │   │   │   └── InfoPlist.strings
│   │       │   │   │   │   ├── nb.lproj
│   │       │   │   │   │   │   └── InfoPlist.strings
│   │       │   │   │   │   ├── nl.lproj
│   │       │   │   │   │   │   └── InfoPlist.strings
│   │       │   │   │   │   ├── pl.lproj
│   │       │   │   │   │   │   └── InfoPlist.strings
│   │       │   │   │   │   ├── pt.lproj
│   │       │   │   │   │   │   └── InfoPlist.strings
│   │       │   │   │   │   ├── pt_PT.lproj
│   │       │   │   │   │   │   └── InfoPlist.strings
│   │       │   │   │   │   ├── ro.lproj
│   │       │   │   │   │   │   └── InfoPlist.strings
│   │       │   │   │   │   ├── ru.lproj
│   │       │   │   │   │   │   └── InfoPlist.strings
│   │       │   │   │   │   ├── sk.lproj
│   │       │   │   │   │   │   └── InfoPlist.strings
│   │       │   │   │   │   ├── step5.png
│   │       │   │   │   │   ├── sv.lproj
│   │       │   │   │   │   │   └── InfoPlist.strings
│   │       │   │   │   │   ├── th.lproj
│   │       │   │   │   │   │   └── InfoPlist.strings
│   │       │   │   │   │   ├── tr.lproj
│   │       │   │   │   │   │   └── InfoPlist.strings
│   │       │   │   │   │   ├── uk.lproj
│   │       │   │   │   │   │   └── InfoPlist.strings
│   │       │   │   │   │   ├── vi.lproj
│   │       │   │   │   │   │   └── InfoPlist.strings
│   │       │   │   │   │   ├── zh_CN.lproj
│   │       │   │   │   │   │   └── InfoPlist.strings
│   │       │   │   │   │   └── zh_TW.lproj
│   │       │   │   │   │       └── InfoPlist.strings
│   │       │   │   │   └── Samples
│   │       │   │   │       └── MapTypesViewController.h
│   │       │   │   ├── GoogleMapsDemos.xcodeproj
│   │       │   │   │   └── project.pbxproj
│   │       │   │   └── README.GoogleMapsDemos
│   │       │   └── Maps
│   │       │       └── Frameworks
│   │       │           ├── GoogleMaps.framework
│   │       │           │   ├── GoogleMaps
│   │       │           │   ├── Headers
│   │       │           │   │   └── GMSPanoramaView.h
│   │       │           │   ├── Modules
│   │       │           │   │   └── module.modulemap
│   │       │           │   └── Resources
│   │       │           │       └── GoogleMaps.bundle
│   │       │           │           ├── GMSCacheStorage.momd
│   │       │           │           │   └── Storage.mom
│   │       │           │           ├── GMSCoreResources.bundle
│   │       │           │           │   ├── ar.lproj
│   │       │           │           │   │   └── GMSCore.strings
│   │       │           │           │   ├── ca.lproj
│   │       │           │           │   │   └── GMSCore.strings
│   │       │           │           │   ├── cs.lproj
│   │       │           │           │   │   └── GMSCore.strings
│   │       │           │           │   ├── da.lproj
│   │       │           │           │   │   └── GMSCore.strings
│   │       │           │           │   ├── de.lproj
│   │       │           │           │   │   └── GMSCore.strings
│   │       │           │           │   ├── el.lproj
│   │       │           │           │   │   └── GMSCore.strings
│   │       │           │           │   ├── en.lproj
│   │       │           │           │   │   └── GMSCore.strings
│   │       │           │           │   ├── en_AU.lproj
│   │       │           │           │   │   └── GMSCore.strings
│   │       │           │           │   ├── en_GB.lproj
│   │       │           │           │   │   └── GMSCore.strings
│   │       │           │           │   ├── en_IN.lproj
│   │       │           │           │   │   └── GMSCore.strings
│   │       │           │           │   ├── es.lproj
│   │       │           │           │   │   └── GMSCore.strings
│   │       │           │           │   ├── es_419.lproj
│   │       │           │           │   │   └── GMSCore.strings
│   │       │           │           │   ├── es_MX.lproj
│   │       │           │           │   │   └── GMSCore.strings
│   │       │           │           │   ├── fi.lproj
│   │       │           │           │   │   └── GMSCore.strings
│   │       │           │           │   ├── fr.lproj
│   │       │           │           │   │   └── GMSCore.strings
│   │       │           │           │   ├── fr_CA.lproj
│   │       │           │           │   │   └── GMSCore.strings
│   │       │           │           │   ├── he.lproj
│   │       │           │           │   │   └── GMSCore.strings
│   │       │           │           │   ├── hi.lproj
│   │       │           │           │   │   └── GMSCore.strings
│   │       │           │           │   ├── hr.lproj
│   │       │           │           │   │   └── GMSCore.strings
│   │       │           │           │   ├── hu.lproj
│   │       │           │           │   │   └── GMSCore.strings
│   │       │           │           │   ├── ic_qu_direction_mylocation@2x.png
│   │       │           │           │   ├── id.lproj
│   │       │           │           │   │   └── GMSCore.strings
│   │       │           │           │   ├── it.lproj
│   │       │           │           │   │   └── GMSCore.strings
│   │       │           │           │   ├── iw.lproj
│   │       │           │           │   │   └── GMSCore.strings
│   │       │           │           │   ├── ja.lproj
│   │       │           │           │   │   └── GMSCore.strings
│   │       │           │           │   ├── ko.lproj
│   │       │           │           │   │   └── GMSCore.strings
│   │       │           │           │   ├── lt.lproj
│   │       │           │           │   │   └── GMSCore.strings
│   │       │           │           │   ├── lv.lproj
│   │       │           │           │   │   └── GMSCore.strings
│   │       │           │           │   ├── ms.lproj
│   │       │           │           │   │   └── GMSCore.strings
│   │       │           │           │   ├── nb.lproj
│   │       │           │           │   │   └── GMSCore.strings
│   │       │           │           │   ├── nl.lproj
│   │       │           │           │   │   └── GMSCore.strings
│   │       │           │           │   ├── no.lproj
│   │       │           │           │   │   └── GMSCore.strings
│   │       │           │           │   ├── pl.lproj
│   │       │           │           │   │   └── GMSCore.strings
│   │       │           │           │   ├── pt.lproj
│   │       │           │           │   │   └── GMSCore.strings
│   │       │           │           │   ├── pt_BR.lproj
│   │       │           │           │   │   └── GMSCore.strings
│   │       │           │           │   ├── pt_PT.lproj
│   │       │           │           │   │   └── GMSCore.strings
│   │       │           │           │   ├── ro.lproj
│   │       │           │           │   │   └── GMSCore.strings
│   │       │           │           │   ├── ru.lproj
│   │       │           │           │   │   └── GMSCore.strings
│   │       │           │           │   ├── sk.lproj
│   │       │           │           │   │   └── GMSCore.strings
│   │       │           │           │   ├── sv.lproj
│   │       │           │           │   │   └── GMSCore.strings
│   │       │           │           │   ├── th.lproj
│   │       │           │           │   │   └── GMSCore.strings
│   │       │           │           │   ├── tr.lproj
│   │       │           │           │   │   └── GMSCore.strings
│   │       │           │           │   ├── uk.lproj
│   │       │           │           │   │   └── GMSCore.strings
│   │       │           │           │   ├── vi.lproj
│   │       │           │           │   │   └── GMSCore.strings
│   │       │           │           │   ├── zh_CN.lproj
│   │       │           │           │   │   └── GMSCore.strings
│   │       │           │           │   ├── zh_HK.lproj
│   │       │           │           │   │   └── GMSCore.strings
│   │       │           │           │   └── zh_TW.lproj
│   │       │           │           │       └── GMSCore.strings
│   │       │           │           └── bubble_left@3x.png
│   │       │           └── GoogleMapsCore.framework
│   │       │               ├── GoogleMapsCore
│   │       │               └── Modules
│   │       │                   └── module.modulemap
│   │       ├── GooglePlaces
│   │       │   ├── CHANGELOG
│   │       │   ├── Example
│   │       │   │   ├── GooglePlacesDemos
│   │       │   │   │   ├── DemoData.m
│   │       │   │   │   ├── Resources
│   │       │   │   │   │   ├── Base.lproj
│   │       │   │   │   │   │   └── LaunchScreen.storyboard
│   │       │   │   │   │   ├── PlacesDemoAssets.xcassets
│   │       │   │   │   │   │   ├── AppIcon.appiconset
│   │       │   │   │   │   │   │   └── Places-API-Demo-App_76.png
│   │       │   │   │   │   │   └── Contents.json
│   │       │   │   │   │   ├── ar.lproj
│   │       │   │   │   │   │   └── Localizable.strings
│   │       │   │   │   │   ├── ca.lproj
│   │       │   │   │   │   │   └── Localizable.strings
│   │       │   │   │   │   ├── cs.lproj
│   │       │   │   │   │   │   └── Localizable.strings
│   │       │   │   │   │   ├── da.lproj
│   │       │   │   │   │   │   └── Localizable.strings
│   │       │   │   │   │   ├── de.lproj
│   │       │   │   │   │   │   └── Localizable.strings
│   │       │   │   │   │   ├── el.lproj
│   │       │   │   │   │   │   └── Localizable.strings
│   │       │   │   │   │   ├── en.lproj
│   │       │   │   │   │   │   └── Localizable.strings
│   │       │   │   │   │   ├── en_AU.lproj
│   │       │   │   │   │   │   └── Localizable.strings
│   │       │   │   │   │   ├── en_GB.lproj
│   │       │   │   │   │   │   └── Localizable.strings
│   │       │   │   │   │   ├── en_IN.lproj
│   │       │   │   │   │   │   └── Localizable.strings
│   │       │   │   │   │   ├── es.lproj
│   │       │   │   │   │   │   └── Localizable.strings
│   │       │   │   │   │   ├── es_419.lproj
│   │       │   │   │   │   │   └── Localizable.strings
│   │       │   │   │   │   ├── es_MX.lproj
│   │       │   │   │   │   │   └── Localizable.strings
│   │       │   │   │   │   ├── fi.lproj
│   │       │   │   │   │   │   └── Localizable.strings
│   │       │   │   │   │   ├── fr.lproj
│   │       │   │   │   │   │   └── Localizable.strings
│   │       │   │   │   │   ├── fr_CA.lproj
│   │       │   │   │   │   │   └── Localizable.strings
│   │       │   │   │   │   ├── he.lproj
│   │       │   │   │   │   │   └── Localizable.strings
│   │       │   │   │   │   ├── hi.lproj
│   │       │   │   │   │   │   └── Localizable.strings
│   │       │   │   │   │   ├── hr.lproj
│   │       │   │   │   │   │   └── Localizable.strings
│   │       │   │   │   │   ├── hu.lproj
│   │       │   │   │   │   │   └── Localizable.strings
│   │       │   │   │   │   ├── id.lproj
│   │       │   │   │   │   │   └── Localizable.strings
│   │       │   │   │   │   ├── it.lproj
│   │       │   │   │   │   │   └── Localizable.strings
│   │       │   │   │   │   ├── ja.lproj
│   │       │   │   │   │   │   └── Localizable.strings
│   │       │   │   │   │   ├── ko.lproj
│   │       │   │   │   │   │   └── Localizable.strings
│   │       │   │   │   │   ├── ms.lproj
│   │       │   │   │   │   │   └── Localizable.strings
│   │       │   │   │   │   ├── nb.lproj
│   │       │   │   │   │   │   └── Localizable.strings
│   │       │   │   │   │   ├── nl.lproj
│   │       │   │   │   │   │   └── Localizable.strings
│   │       │   │   │   │   ├── pl.lproj
│   │       │   │   │   │   │   └── Localizable.strings
│   │       │   │   │   │   ├── pt.lproj
│   │       │   │   │   │   │   └── Localizable.strings
│   │       │   │   │   │   ├── pt_BR.lproj
│   │       │   │   │   │   │   └── Localizable.strings
│   │       │   │   │   │   ├── pt_PT.lproj
│   │       │   │   │   │   │   └── Localizable.strings
│   │       │   │   │   │   ├── ro.lproj
│   │       │   │   │   │   │   └── Localizable.strings
│   │       │   │   │   │   ├── ru.lproj
│   │       │   │   │   │   │   └── Localizable.strings
│   │       │   │   │   │   ├── sk.lproj
│   │       │   │   │   │   │   └── Localizable.strings
│   │       │   │   │   │   ├── sv.lproj
│   │       │   │   │   │   │   └── Localizable.strings
│   │       │   │   │   │   ├── th.lproj
│   │       │   │   │   │   │   └── Localizable.strings
│   │       │   │   │   │   ├── tr.lproj
│   │       │   │   │   │   │   └── Localizable.strings
│   │       │   │   │   │   ├── uk.lproj
│   │       │   │   │   │   │   └── Localizable.strings
│   │       │   │   │   │   ├── vi.lproj
│   │       │   │   │   │   │   └── Localizable.strings
│   │       │   │   │   │   ├── zh_CN.lproj
│   │       │   │   │   │   │   └── Localizable.strings
│   │       │   │   │   │   ├── zh_HK.lproj
│   │       │   │   │   │   │   └── Localizable.strings
│   │       │   │   │   │   └── zh_TW.lproj
│   │       │   │   │   │       └── Localizable.strings
│   │       │   │   │   ├── Samples
│   │       │   │   │   │   ├── Autocomplete
│   │       │   │   │   │   │   └── AutocompleteWithSearchViewController.m
│   │       │   │   │   │   └── PlacePickerViewController.m
│   │       │   │   │   └── Support
│   │       │   │   │       └── BaseDemoViewController.h
│   │       │   │   ├── GooglePlacesDemos.xcodeproj
│   │       │   │   │   └── project.pbxproj
│   │       │   │   └── Podfile
│   │       │   └── Frameworks
│   │       │       └── GooglePlaces.framework
│   │       │           ├── GooglePlaces
│   │       │           ├── Headers
│   │       │           │   └── GMSAutocompleteTableDataSource.h
│   │       │           ├── Modules
│   │       │           │   └── module.modulemap
│   │       │           └── Resources
│   │       │               └── GooglePlaces.bundle
│   │       │                   ├── ar.lproj
│   │       │                   │   └── GooglePlaces.strings
│   │       │                   ├── ca.lproj
│   │       │                   │   └── GooglePlaces.strings
│   │       │                   ├── cs.lproj
│   │       │                   │   └── GooglePlaces.strings
│   │       │                   ├── da.lproj
│   │       │                   │   └── GooglePlaces.strings
│   │       │                   ├── de.lproj
│   │       │                   │   └── GooglePlaces.strings
│   │       │                   ├── el.lproj
│   │       │                   │   └── GooglePlaces.strings
│   │       │                   ├── en.lproj
│   │       │                   │   └── GooglePlaces.strings
│   │       │                   ├── en_AU.lproj
│   │       │                   │   └── GooglePlaces.strings
│   │       │                   ├── en_GB.lproj
│   │       │                   │   └── GooglePlaces.strings
│   │       │                   ├── en_IN.lproj
│   │       │                   │   └── GooglePlaces.strings
│   │       │                   ├── es.lproj
│   │       │                   │   └── GooglePlaces.strings
│   │       │                   ├── es_419.lproj
│   │       │                   │   └── GooglePlaces.strings
│   │       │                   ├── es_MX.lproj
│   │       │                   │   └── GooglePlaces.strings
│   │       │                   ├── fi.lproj
│   │       │                   │   └── GooglePlaces.strings
│   │       │                   ├── fr.lproj
│   │       │                   │   └── GooglePlaces.strings
│   │       │                   ├── fr_CA.lproj
│   │       │                   │   └── GooglePlaces.strings
│   │       │                   ├── he.lproj
│   │       │                   │   └── GooglePlaces.strings
│   │       │                   ├── hi.lproj
│   │       │                   │   └── GooglePlaces.strings
│   │       │                   ├── hr.lproj
│   │       │                   │   └── GooglePlaces.strings
│   │       │                   ├── hu.lproj
│   │       │                   │   └── GooglePlaces.strings
│   │       │                   ├── id.lproj
│   │       │                   │   └── GooglePlaces.strings
│   │       │                   ├── it.lproj
│   │       │                   │   └── GooglePlaces.strings
│   │       │                   ├── iw.lproj
│   │       │                   │   └── GooglePlaces.strings
│   │       │                   ├── ja.lproj
│   │       │                   │   └── GooglePlaces.strings
│   │       │                   ├── ko.lproj
│   │       │                   │   └── GooglePlaces.strings
│   │       │                   ├── lt.lproj
│   │       │                   │   └── GooglePlaces.strings
│   │       │                   ├── lv.lproj
│   │       │                   │   └── GooglePlaces.strings
│   │       │                   ├── ms.lproj
│   │       │                   │   └── GooglePlaces.strings
│   │       │                   ├── nb.lproj
│   │       │                   │   └── GooglePlaces.strings
│   │       │                   ├── nl.lproj
│   │       │                   │   └── GooglePlaces.strings
│   │       │                   ├── no.lproj
│   │       │                   │   └── GooglePlaces.strings
│   │       │                   ├── pl.lproj
│   │       │                   │   └── GooglePlaces.strings
│   │       │                   ├── powered-by-google-light.png
│   │       │                   ├── pt.lproj
│   │       │                   │   └── GooglePlaces.strings
│   │       │                   ├── pt_BR.lproj
│   │       │                   │   └── GooglePlaces.strings
│   │       │                   ├── pt_PT.lproj
│   │       │                   │   └── GooglePlaces.strings
│   │       │                   ├── ro.lproj
│   │       │                   │   └── GooglePlaces.strings
│   │       │                   ├── ru.lproj
│   │       │                   │   └── GooglePlaces.strings
│   │       │                   ├── sk.lproj
│   │       │                   │   └── GooglePlaces.strings
│   │       │                   ├── sv.lproj
│   │       │                   │   └── GooglePlaces.strings
│   │       │                   ├── th.lproj
│   │       │                   │   └── GooglePlaces.strings
│   │       │                   ├── tr.lproj
│   │       │                   │   └── GooglePlaces.strings
│   │       │                   ├── uk.lproj
│   │       │                   │   └── GooglePlaces.strings
│   │       │                   ├── vi.lproj
│   │       │                   │   └── GooglePlaces.strings
│   │       │                   ├── zh_CN.lproj
│   │       │                   │   └── GooglePlaces.strings
│   │       │                   ├── zh_HK.lproj
│   │       │                   │   └── GooglePlaces.strings
│   │       │                   └── zh_TW.lproj
│   │       │                       └── GooglePlaces.strings
│   │       ├── Manifest.lock
│   │       ├── Pods.xcodeproj
│   │       │   └── project.pbxproj
│   │       ├── SwiftyJSON
│   │       │   ├── LICENSE
│   │       │   └── Source
│   │       │       └── SwiftyJSON.swift
│   │       └── Target\ Support\ Files
│   │           ├── Pods-SafeGuide
│   │           │   └── Pods-SafeGuide-umbrella.h
│   │           └── SwiftyJSON
│   │               └── SwiftyJSON.modulemap
│   └── graphics
│       ├── AppIcon
│       │   ├── SG76.png
│       │   ├── v0
│       │   │   └── Icon-1024.png
│       │   ├── v1
│       │   │   └── APP_NAME.png
│       │   └── v2
│       │       └── APP_NAME.png
│       └── InAppGraphics
│           ├── Amatic_SC
│           │   └── OFL.txt
│           ├── Circle@2x.png
│           └── SmileyFaces
│               ├── RedT.png
│               └── originals
│                   └── Green@1x.png
├── install_git_hooks.sh
├── leftOne.py
├── starter-app
│   ├── back-end
│   │   ├── chatter
│   │   │   ├── migrations
│   │   │   │   └── __init__.py
│   │   │   └── models.py
│   │   ├── django_project
│   │   │   └── __init__.py
│   │   └── manage.py
│   └── front-end
│       ├── Chatter
│       │   ├── Assets.xcassets
│       │   │   └── AppIcon.appiconset
│       │   │       └── Contents.json
│       │   ├── Base.lproj
│       │   │   └── LaunchScreen.storyboard
│       │   └── ChattTableCell.swift
│       └── Chatter.xcodeproj
│           ├── project.pbxproj
│           └── project.xcworkspace
│               └── contents.xcworkspacedata
└── www
    ├── css
    │   └── new-age.min.css
    ├── device-mockups
    │   ├── apple_watch
    │   │   ├── edition
    │   │   │   └── rose.png
    │   │   ├── sport
    │   │   │   └── blue.png
    │   │   └── watch
    │   │       └── metal.png
    │   ├── device-mockups2.css
    │   ├── galaxy_s3
    │   │   └── s3_land_white.png
    │   ├── galaxy_s5
    │   │   └── galaxy_s5_land_black.png
    │   ├── galaxy_tab4
    │   │   └── galaxy_tab4_land_white.png
    │   ├── galaxy_tab4_small
    │   │   └── galaxy_tab4_white_small.png
    │   ├── imac
    │   │   └── imac.png
    │   ├── ipad
    │   │   └── ipad_land_white.png
    │   ├── ipad_air
    │   │   └── ipad_air_silver_port.png
    │   ├── ipad_air_2
    │   │   └── ipad_air_2_silver_port.png
    │   ├── ipad_pro
    │   │   └── ipad_pro_port_black.png
    │   ├── iphone5
    │   │   └── iphone5_port_white.png
    │   ├── iphone_6
    │   │   └── iphone_6_port_gold.png
    │   ├── iphone_6_plus
    │   │   └── iphone_6_plus_gold_port.png
    │   ├── iphone_se
    │   │   └── iphone_se_port_white.png
    │   ├── lumia920
    │   │   └── lumia920_port.png
    │   ├── lumia_930
    │   │   └── lumia_930_dark_port.png
    │   ├── macbook
    │   │   └── macbook.png
    │   ├── macbook_2015
    │   │   └── silver.png
    │   ├── nexus7
    │   │   └── nexus7_port.png
    │   ├── nexus_6
    │   │   └── nexus_6_land.png
    │   ├── samsung_tv
    │   │   └── samsung_tv.png
    │   └── surface
    │       └── surface.png
    ├── devices
    │   ├── Gruntfile.js
    │   └── assets
    │       ├── devices.min.css
    │       └── scss
    │           └── devices.scss
    ├── img
    │   └── iphonex_home.png
    ├── index.html
    ├── js
    │   └── new-age.min.js
    ├── scss
    │   └── _cta.scss
    └── vendor
        ├── bootstrap
        │   ├── css
        │   │   └── bootstrap.min.css
        │   └── js
        │       └── bootstrap.bundle.js
        ├── font-awesome
        │   ├── css
        │   │   └── font-awesome.css
        │   ├── fonts
        │   │   └── fontawesome-webfont.svg
        │   ├── less
        │   │   └── list.less
        │   └── scss
        │       └── _stacked.scss
        ├── fontawesome-free
        │   ├── README.md
        │   ├── css
        │   │   └── all.css
        │   ├── js
        │   │   └── all.min.js
        │   ├── less
        │   │   └── regular.less
        │   ├── scss
        │   │   └── _stacked.scss
        │   ├── sprites
        │   │   └── brands.svg
        │   ├── svgs
        │   │   ├── brands
        │   │   │   └── viadeo-square.svg
        │   │   ├── regular
        │   │   │   └── comment-dots.svg
        │   │   └── solid
        │   │       └── columns.svg
        │   └── webfonts
        │       └── fa-solid-900.ttf
        ├── jquery
        │   └── jquery.slim.min.js
        ├── jquery-easing
        │   └── jquery.easing.compatibility.js
        └── simple-line-icons
            ├── css
            │   └── simple-line-icons.css
            ├── fonts
            │   └── Simple-Line-Icons.svg
            ├── less
            │   └── simple-line-icons.less
            └── scss
                └── simple-line-icons.scss

354 directories, 337 files

```
