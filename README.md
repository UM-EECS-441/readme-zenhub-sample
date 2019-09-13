# APP_NAME

This repo will help us store code for the APP_NAME project (EECS 441, Fall 2018). Team members: Noriyuki Kojima (kojimano), Il Jae Lee (iljae), Tejas Prahlad (prtejas), Sesh Sadasivam (seshrs), Victoria Whydell (vwhydell), Daniel Zhang (dtzhang), Harry Zhang (zharry).

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
├── README.md
├── Vagrantfile
├── data
│   ├── BPD_Part_1_Victim_Based_Crime_Data.pk
│   ├── Raw_Data
│   │   └── Samples
│   │       └── samples.png
│   ├── data_research.txt
│   └── scripts
│       ├── process_911.py
│       └── process_data.py
├── data-tools
│   ├── Baltimore\ Scoring.ipynb
│   ├── bing_news.py
│   ├── crime_severity.json
│   ├── gridsearch_objective.py
│   ├── nearest_safe_locations.ipynb
│   ├── news_crawled_baltimore
│   │   ├── 0_100.pkl
│   │   ├── 1000_1100.pkl
│   │   ├── 100_200.pkl
│   │   ├── 1100_1200.pkl
│   │   ├── 1200_1300.pkl
│   │   ├── 1300_1400.pkl
│   │   ├── 1400_1500.pkl
│   │   ├── 1500_1600.pkl
│   │   ├── 1600_1700.pkl
│   │   ├── 1700_1800.pkl
│   │   ├── 1800_1900.pkl
│   │   ├── 1900_2000.pkl
│   │   ├── 2000_2100.pkl
│   │   ├── 200_300.pkl
│   │   ├── 2100_2200.pkl
│   │   ├── 2200_2300.pkl
│   │   ├── 2300_2400.pkl
│   │   ├── 2400_2500.pkl
│   │   ├── 2500_2600.pkl
│   │   ├── 2600_2700.pkl
│   │   ├── 2700_2800.pkl
│   │   ├── 2800_2900.pkl
│   │   ├── 2900_3000.pkl
│   │   ├── 3000_3100.pkl
│   │   ├── 300_400.pkl
│   │   ├── 3100_3200.pkl
│   │   ├── 3200_3300.pkl
│   │   ├── 3300_3400.pkl
│   │   ├── 3400_3500.pkl
│   │   ├── 3500_3600.pkl
│   │   ├── 3600_3700.pkl
│   │   ├── 3700_3800.pkl
│   │   ├── 3800_3900.pkl
│   │   ├── 3900_4000.pkl
│   │   ├── 4000_4100.pkl
│   │   ├── 400_500.pkl
│   │   ├── 4100_4200.pkl
│   │   ├── 4200_4300.pkl
│   │   ├── 4300_4400.pkl
│   │   ├── 4400_4500.pkl
│   │   ├── 4500_4600.pkl
│   │   ├── 4600_4700.pkl
│   │   ├── 4700_4800.pkl
│   │   ├── 4800_4900.pkl
│   │   ├── 4900_5000.pkl
│   │   ├── 500_600.pkl
│   │   ├── 600_700.pkl
│   │   ├── 700_800.pkl
│   │   ├── 800_900.pkl
│   │   └── 900_1000.pkl
│   ├── plots_baltimore
│   │   ├── N_0.1P_1000K_604.8.png
│   │   ├── N_0.1P_1000K_6048.png
│   │   ├── N_0.1P_1000K_60480.png
│   │   ├── N_0.1P_1000K_604800.png
│   │   ├── N_0.1P_1000K_6048000.png
│   │   ├── N_0.1P_100K_604.8.png
│   │   ├── N_0.1P_100K_6048.png
│   │   ├── N_0.1P_100K_60480.png
│   │   ├── N_0.1P_100K_604800.png
│   │   ├── N_0.1P_100K_6048000.png
│   │   ├── N_0.1P_10K_604.8.png
│   │   ├── N_0.1P_10K_6048.png
│   │   ├── N_0.1P_10K_60480.png
│   │   ├── N_0.1P_10K_604800.png
│   │   ├── N_0.1P_10K_6048000.png
│   │   ├── N_0.1P_50K_604.8.png
│   │   ├── N_0.1P_50K_6048.png
│   │   ├── N_0.1P_50K_60480.png
│   │   ├── N_0.1P_50K_604800.png
│   │   ├── N_0.1P_50K_6048000.png
│   │   ├── N_0.5P_1000K_604.8.png
│   │   ├── N_0.5P_1000K_6048.png
│   │   ├── N_0.5P_1000K_60480.png
│   │   ├── N_0.5P_1000K_604800.png
│   │   ├── N_0.5P_1000K_6048000.png
│   │   ├── N_0.5P_100K_604.8.png
│   │   ├── N_0.5P_100K_6048.png
│   │   ├── N_0.5P_100K_60480.png
│   │   ├── N_0.5P_100K_604800.png
│   │   ├── N_0.5P_100K_6048000.png
│   │   ├── N_0.5P_10K_604.8.png
│   │   ├── N_0.5P_10K_6048.png
│   │   ├── N_0.5P_10K_60480.png
│   │   ├── N_0.5P_10K_604800.png
│   │   ├── N_0.5P_10K_6048000.png
│   │   ├── N_0.5P_50K_604.8.png
│   │   ├── N_0.5P_50K_6048.png
│   │   ├── N_0.5P_50K_60480.png
│   │   ├── N_0.5P_50K_604800.png
│   │   ├── N_0.5P_50K_6048000.png
│   │   ├── N_10P_1000K_604.8.png
│   │   ├── N_10P_1000K_6048.png
│   │   ├── N_10P_1000K_60480.png
│   │   ├── N_10P_1000K_604800.png
│   │   ├── N_10P_1000K_6048000.png
│   │   ├── N_10P_100K_604.8.png
│   │   ├── N_10P_100K_6048.png
│   │   ├── N_10P_100K_60480.png
│   │   ├── N_10P_100K_604800.png
│   │   ├── N_10P_100K_6048000.png
│   │   ├── N_10P_10K_604.8.png
│   │   ├── N_10P_10K_6048.png
│   │   ├── N_10P_10K_60480.png
│   │   ├── N_10P_10K_604800.png
│   │   ├── N_10P_10K_6048000.png
│   │   ├── N_10P_50K_604.8.png
│   │   ├── N_10P_50K_6048.png
│   │   ├── N_10P_50K_60480.png
│   │   ├── N_10P_50K_604800.png
│   │   ├── N_10P_50K_6048000.png
│   │   ├── N_10P_5K_604800.png
│   │   ├── N_1P_1000K_604.8.png
│   │   ├── N_1P_1000K_6048.png
│   │   ├── N_1P_1000K_60480.png
│   │   ├── N_1P_1000K_604800.png
│   │   ├── N_1P_1000K_6048000.png
│   │   ├── N_1P_100K_604.8.png
│   │   ├── N_1P_100K_6048.png
│   │   ├── N_1P_100K_60480.png
│   │   ├── N_1P_100K_604800.png
│   │   ├── N_1P_100K_6048000.png
│   │   ├── N_1P_10K_604.8.png
│   │   ├── N_1P_10K_6048.png
│   │   ├── N_1P_10K_60480.png
│   │   ├── N_1P_10K_604800.png
│   │   ├── N_1P_10K_6048000.png
│   │   ├── N_1P_50K_604.8.png
│   │   ├── N_1P_50K_6048.png
│   │   ├── N_1P_50K_60480.png
│   │   ├── N_1P_50K_604800.png
│   │   ├── N_1P_50K_6048000.png
│   │   ├── N_1P_5K_604800.png
│   │   ├── N_5P_1000K_604.8.png
│   │   ├── N_5P_1000K_6048.png
│   │   ├── N_5P_1000K_60480.png
│   │   ├── N_5P_1000K_604800.png
│   │   ├── N_5P_1000K_6048000.png
│   │   ├── N_5P_100K_604.8.png
│   │   ├── N_5P_100K_6048.png
│   │   ├── N_5P_100K_60480.png
│   │   ├── N_5P_100K_604800.png
│   │   ├── N_5P_100K_6048000.png
│   │   ├── N_5P_10K_604.8.png
│   │   ├── N_5P_10K_6048.png
│   │   ├── N_5P_10K_60480.png
│   │   ├── N_5P_10K_604800.png
│   │   ├── N_5P_10K_6048000.png
│   │   ├── N_5P_50K_604.8.png
│   │   ├── N_5P_50K_6048.png
│   │   ├── N_5P_50K_60480.png
│   │   ├── N_5P_50K_604800.png
│   │   └── N_5P_50K_6048000.png
│   ├── plots_chicago
│   │   ├── N_0.1P_0.5K_6048.png
│   │   ├── N_0.1P_0.5K_60480.png
│   │   ├── N_0.1P_0.5K_604800.png
│   │   ├── N_0.1P_0.5K_6048000.png
│   │   ├── N_0.1P_500K_6048.png
│   │   ├── N_0.1P_500K_60480.png
│   │   ├── N_0.1P_500K_604800.png
│   │   ├── N_0.1P_500K_6048000.png
│   │   ├── N_0.1P_50K_6048.png
│   │   ├── N_0.1P_50K_60480.png
│   │   ├── N_0.1P_50K_604800.png
│   │   ├── N_0.1P_50K_6048000.png
│   │   ├── N_0.1P_5K_6048.png
│   │   ├── N_0.1P_5K_60480.png
│   │   ├── N_0.1P_5K_604800.png
│   │   ├── N_0.1P_5K_6048000.png
│   │   ├── N_100P_0.5K_6048.png
│   │   ├── N_100P_0.5K_60480.png
│   │   ├── N_100P_0.5K_604800.png
│   │   ├── N_100P_0.5K_6048000.png
│   │   ├── N_100P_500K_6048.png
│   │   ├── N_100P_500K_60480.png
│   │   ├── N_100P_500K_604800.png
│   │   ├── N_100P_500K_6048000.png
│   │   ├── N_100P_50K_6048.png
│   │   ├── N_100P_50K_60480.png
│   │   ├── N_100P_50K_604800.png
│   │   ├── N_100P_50K_6048000.png
│   │   ├── N_100P_5K_6048.png
│   │   ├── N_100P_5K_60480.png
│   │   ├── N_100P_5K_604800.png
│   │   ├── N_100P_5K_6048000.png
│   │   ├── N_10P_0.5K_6048.png
│   │   ├── N_10P_0.5K_60480.png
│   │   ├── N_10P_0.5K_604800.png
│   │   ├── N_10P_0.5K_6048000.png
│   │   ├── N_10P_500K_6048.png
│   │   ├── N_10P_500K_60480.png
│   │   ├── N_10P_500K_604800.png
│   │   ├── N_10P_500K_6048000.png
│   │   ├── N_10P_50K_6048.png
│   │   ├── N_10P_50K_60480.png
│   │   ├── N_10P_50K_604800.png
│   │   ├── N_10P_50K_6048000.png
│   │   ├── N_10P_5K_6048.png
│   │   ├── N_10P_5K_60480.png
│   │   ├── N_10P_5K_604800.png
│   │   ├── N_10P_5K_6048000.png
│   │   ├── N_1P_0.5K_6048.png
│   │   ├── N_1P_0.5K_60480.png
│   │   ├── N_1P_0.5K_604800.png
│   │   ├── N_1P_0.5K_6048000.png
│   │   ├── N_1P_500K_6048.png
│   │   ├── N_1P_500K_60480.png
│   │   ├── N_1P_500K_604800.png
│   │   ├── N_1P_500K_6048000.png
│   │   ├── N_1P_50K_6048.png
│   │   ├── N_1P_50K_60480.png
│   │   ├── N_1P_50K_604800.png
│   │   ├── N_1P_50K_6048000.png
│   │   ├── N_1P_5K_6048.png
│   │   ├── N_1P_5K_60480.png
│   │   ├── N_1P_5K_604800.png
│   │   └── N_1P_5K_6048000.png
│   ├── prod_sampling.py
│   ├── read_news.py
│   ├── rest_sampling.py
│   ├── safety_scoring.ipynb
│   ├── safety_scoring.py
│   ├── safety_scoring_old.py
│   ├── scoring_out_baltimore.txt
│   ├── scoring_out_chicago.txt
│   └── test.py
├── front-end
│   ├── APP_NAME
│   │   ├── Podfile
│   │   ├── Podfile.lock
│   │   ├── Pods
│   │   │   ├── GoogleMaps
│   │   │   ├── Manifest.lock
│   │   │   ├── Pods.xcodeproj
│   │   │   ├── SwiftyJSON
│   │   │   └── Target\ Support\ Files
│   │   ├── APP_NAME
│   │   │   ├── API
│   │   │   │   ├── ApiHelpers.swift
│   │   │   │   └── ApiResultShapes.swift
│   │   │   ├── Assets.xcassets
│   │   │   │   ├── AppIcon.appiconset
│   │   │   │   │   ├── Contents.json
│   │   │   │   │   ├── SG1024.png
│   │   │   │   │   ├── SG120-1.png
│   │   │   │   │   ├── SG120.png
│   │   │   │   │   ├── SG180.png
│   │   │   │   │   ├── SG40.png
│   │   │   │   │   ├── SG58.png
│   │   │   │   │   ├── SG60.png
│   │   │   │   │   ├── SG80.png
│   │   │   │   │   └── SG87.png
│   │   │   │   ├── Circle.imageset
│   │   │   │   │   ├── Circle@1x.png
│   │   │   │   │   ├── Circle@2x.png
│   │   │   │   │   ├── Circle@3x.png
│   │   │   │   │   └── Contents.json
│   │   │   │   ├── Contents.json
│   │   │   │   ├── Green.imageset
│   │   │   │   │   ├── Contents.json
│   │   │   │   │   ├── Green@1x.png
│   │   │   │   │   ├── Green@2x.png
│   │   │   │   │   └── Green@3x.png
│   │   │   │   ├── GreenBW.imageset
│   │   │   │   │   ├── Contents.json
│   │   │   │   │   ├── GreenBW@1x.png
│   │   │   │   │   ├── GreenBW@2x.png
│   │   │   │   │   └── GreenBW@3x.png
│   │   │   │   ├── GreenT.imageset
│   │   │   │   │   ├── Contents.json
│   │   │   │   │   ├── GreenT@1x.png
│   │   │   │   │   ├── GreenT@2x.png
│   │   │   │   │   └── GreenT@3x.png
│   │   │   │   ├── LaunchImage.launchimage
│   │   │   │   │   ├── Contents.json
│   │   │   │   │   └── SGLaunchTEST.png
│   │   │   │   ├── Red.imageset
│   │   │   │   │   ├── Contents.json
│   │   │   │   │   ├── Red@1x.png
│   │   │   │   │   ├── Red@2x.png
│   │   │   │   │   └── Red@3x.png
│   │   │   │   ├── RedBW.imageset
│   │   │   │   │   ├── Contents.json
│   │   │   │   │   ├── RedBW@1x.png
│   │   │   │   │   ├── RedBW@2x.png
│   │   │   │   │   └── RedBW@3x.png
│   │   │   │   ├── RedT.imageset
│   │   │   │   │   ├── Contents.json
│   │   │   │   │   ├── RedT@1x.png
│   │   │   │   │   ├── RedT@2x.png
│   │   │   │   │   └── RedT@3x.png
│   │   │   │   ├── APP_NAMELaunchScreen.imageset
│   │   │   │   │   ├── Contents.json
│   │   │   │   │   └── SGLaunchTEST.png
│   │   │   │   ├── TabIconHome.imageset
│   │   │   │   │   ├── Contents.json
│   │   │   │   │   ├── Home@1x.png
│   │   │   │   │   ├── Home@2x.png
│   │   │   │   │   └── Home@3x.png
│   │   │   │   ├── TabIconMap.imageset
│   │   │   │   │   ├── Contents.json
│   │   │   │   │   ├── Map@1x.png
│   │   │   │   │   ├── Map@2x.png
│   │   │   │   │   └── Map@3x.png
│   │   │   │   ├── TabIconSettings.imageset
│   │   │   │   │   ├── Contents.json
│   │   │   │   │   ├── Settings@1x.png
│   │   │   │   │   ├── Settings@2x.png
│   │   │   │   │   └── Settings@3x.png
│   │   │   │   ├── Yellow.imageset
│   │   │   │   │   ├── Contents.json
│   │   │   │   │   ├── Yellow@1x.png
│   │   │   │   │   ├── Yellow@2x.png
│   │   │   │   │   └── Yellow@3x.png
│   │   │   │   ├── YellowBW.imageset
│   │   │   │   │   ├── Contents.json
│   │   │   │   │   ├── YellowBW@1x.png
│   │   │   │   │   ├── YellowBW@2x.png
│   │   │   │   │   └── YellowBW@3x.png
│   │   │   │   └── YellowT.imageset
│   │   │   │       ├── Contents.json
│   │   │   │       ├── YellowT@1x.png
│   │   │   │       ├── YellowT@2x.png
│   │   │   │       └── YellowT@3x.png
│   │   │   ├── Base.lproj
│   │   │   │   ├── LaunchScreen.storyboard
│   │   │   │   └── Main.storyboard
│   │   │   ├── Controllers
│   │   │   │   ├── AmaticSC-Bold.ttf
│   │   │   │   ├── AmaticSC-Regular.ttf
│   │   │   │   ├── AppDelegate.swift
│   │   │   │   ├── FirstViewController.swift
│   │   │   │   ├── GMapStyle.json
│   │   │   │   ├── GMapStyleLight.json
│   │   │   │   ├── Graphics
│   │   │   │   │   ├── Home@1x.png
│   │   │   │   │   ├── Home@2x.png
│   │   │   │   │   ├── Home@3x.png
│   │   │   │   │   ├── Map@1x.png
│   │   │   │   │   ├── Map@2x.png
│   │   │   │   │   ├── Map@3x.png
│   │   │   │   │   ├── SGLaunchTEST.png
│   │   │   │   │   ├── Settings@1x.png
│   │   │   │   │   ├── Settings@2x.png
│   │   │   │   │   └── Settings@3x.png
│   │   │   │   ├── SecondViewController.swift
│   │   │   │   └── ThirdViewController.swift
│   │   │   ├── CowMooCow.gpx
│   │   │   ├── Globals.swift
│   │   │   ├── Images.xcassets
│   │   │   │   ├── Contents.json
│   │   │   │   ├── bakery.imageset
│   │   │   │   │   ├── Contents.json
│   │   │   │   │   └── bakery@2x.png
│   │   │   │   ├── bakery_pin.imageset
│   │   │   │   │   ├── Contents.json
│   │   │   │   │   └── bakery_pin@2x.png
│   │   │   │   ├── bar.imageset
│   │   │   │   │   ├── Contents.json
│   │   │   │   │   └── bar@2x.png
│   │   │   │   ├── bar_pin.imageset
│   │   │   │   │   ├── Contents.json
│   │   │   │   │   └── bar_pin@2x.png
│   │   │   │   ├── cafe.imageset
│   │   │   │   │   ├── Contents.json
│   │   │   │   │   └── cafe@2x.png
│   │   │   │   ├── cafe_pin.imageset
│   │   │   │   │   ├── Contents.json
│   │   │   │   │   └── cafe_pin@2x.png
│   │   │   │   ├── coffee.imageset
│   │   │   │   │   ├── Contents.json
│   │   │   │   │   └── coffee@2x.png
│   │   │   │   ├── driving.imageset
│   │   │   │   │   ├── Contents.json
│   │   │   │   │   └── driving@2x.png
│   │   │   │   ├── driving_pin.imageset
│   │   │   │   │   ├── Contents.json
│   │   │   │   │   └── driving@2x.png
│   │   │   │   ├── filter.imageset
│   │   │   │   │   ├── Contents.json
│   │   │   │   │   └── filter@2x.png
│   │   │   │   ├── generic.imageset
│   │   │   │   │   ├── Contents.json
│   │   │   │   │   └── generic@2x.png
│   │   │   │   ├── grocery_or_supermarket.imageset
│   │   │   │   │   ├── Contents.json
│   │   │   │   │   └── grocery_or_supermarket@2x.png
│   │   │   │   ├── grocery_or_supermarket_pin.imageset
│   │   │   │   │   ├── Contents.json
│   │   │   │   │   └── grocery_or_supermarket_pin@2x.png
│   │   │   │   ├── icon_me.imageset
│   │   │   │   │   ├── Contents.json
│   │   │   │   │   └── icon_me@2x.png
│   │   │   │   ├── restaurant.imageset
│   │   │   │   │   ├── Contents.json
│   │   │   │   │   └── restaurant@2x.png
│   │   │   │   ├── restaurant_pin.imageset
│   │   │   │   │   ├── Contents.json
│   │   │   │   │   └── restaurant_pin@2x.png
│   │   │   │   ├── rw-logo.imageset
│   │   │   │   │   ├── Contents.json
│   │   │   │   │   └── Razewarelogo_1024.png
│   │   │   │   ├── rwdevcon-bg.imageset
│   │   │   │   │   ├── Contents.json
│   │   │   │   │   └── rwdevcon-bg.png
│   │   │   │   └── walking.imageset
│   │   │   │       ├── Contents.json
│   │   │   │       └── walking@2x.png
│   │   │   ├── Info.plist
│   │   │   ├── SharedLocationManager.swift
│   │   │   ├── SharedNotificationManager.swift
│   │   │   └── Views
│   │   │       ├── MarkerInfoView.swift
│   │   │       ├── MarkerInfoView.xib
│   │   │       └── UIViewExtension.swift
│   │   ├── APP_NAME.xcodeproj
│   │   │   ├── project.pbxproj
│   │   │   ├── project.xcworkspace
│   │   │   └── xcuserdata
│   │   └── APP_NAME.xcworkspace
│   │       ├── contents.xcworkspacedata
│   │       ├── xcshareddata
│   │       └── xcuserdata
│   └── graphics
│       ├── AppIcon
│       │   ├── SG1024.png
│       │   ├── SG120.png
│       │   ├── SG152.png
│       │   ├── SG167.png
│       │   ├── SG180.png
│       │   ├── SG20.png
│       │   ├── SG29.png
│       │   ├── SG40.png
│       │   ├── SG58.png
│       │   ├── SG60.png
│       │   ├── SG76.png
│       │   ├── SG80.png
│       │   ├── SG83point5-84.png
│       │   ├── SG87.png
│       │   ├── SGLaunchTEST2.png
│       │   ├── APP_NAME1024.png
│       │   ├── APP_NAMELoadScreen.png
│       │   ├── APP_NAMELoadScreenPhoneSize.png
│       │   ├── APP_NAMELoadScreenPhoneSize.xcf
│       │   ├── v0
│       │   │   ├── Icon-1024.png
│       │   │   ├── Icon-180.png
│       │   │   ├── Icon-20.png
│       │   │   ├── Icon-512.png
│       │   │   ├── Icon-57.png
│       │   │   ├── Icon-72.png
│       │   │   ├── APP_NAMEAppIcon.PNG
│       │   │   ├── sg.PNG
│       │   │   └── sgcrop.png
│       │   ├── v1
│       │   │   ├── SGAppIcon.PNG
│       │   │   ├── APP_NAME1024notgreat.png
│       │   │   ├── APP_NAME120.png
│       │   │   ├── APP_NAME180.png
│       │   │   ├── APP_NAME40.png
│       │   │   ├── APP_NAME58.png
│       │   │   ├── APP_NAME60.png
│       │   │   ├── APP_NAME80.png
│       │   │   ├── APP_NAME87.png
│       │   │   └── APP_NAMESQUARE.png
│       │   └── v2
│       │       ├── SG1024.png
│       │       ├── APP_NAME120.png
│       │       ├── APP_NAME180.png
│       │       ├── APP_NAME20.png
│       │       ├── APP_NAME40.png
│       │       ├── APP_NAME58.png
│       │       ├── APP_NAME60.png
│       │       ├── APP_NAME80.png
│       │       ├── APP_NAME87.png
│       │       ├── logoNew.png
│       │       └── logoNewSG.png
│       └── InAppGraphics
│           ├── 1024px-Font_Awesome_5_solid_circle.svg.png
│           ├── Amatic_SC
│           │   └── OFL.txt
│           ├── Circle@1x.png
│           ├── Circle@2x.png
│           ├── Circle@3x.png
│           ├── Home.png
│           ├── Map.png
│           ├── Settings.png
│           ├── SmileyFaces
│           │   ├── Green.png
│           │   ├── GreenBW.png
│           │   ├── GreenT.png
│           │   ├── Red.png
│           │   ├── RedBW.png
│           │   ├── RedT.png
│           │   ├── Yellow.png
│           │   ├── YellowBW.png
│           │   ├── YellowT.png
│           │   ├── facesRanking.jpg
│           │   ├── facesRanking.psd
│           │   └── originals
│           │       ├── Green@1x.png
│           │       ├── Green@2x.png
│           │       ├── Green@3x.png
│           │       ├── GreenBW@1x.png
│           │       ├── GreenBW@2x.png
│           │       ├── GreenBW@3x.png
│           │       ├── GreenT@1x.png
│           │       ├── GreenT@2x.png
│           │       ├── GreenT@3x.png
│           │       ├── Red@1x.png
│           │       ├── Red@2x.png
│           │       ├── Red@3x.png
│           │       ├── RedBW@1x.png
│           │       ├── RedBW@2x.png
│           │       ├── RedBW@3x.png
│           │       ├── RedT@1x.png
│           │       ├── RedT@2x.png
│           │       ├── RedT@3x.png
│           │       ├── Yellow@1x.png
│           │       ├── Yellow@2x.png
│           │       ├── Yellow@3x.png
│           │       ├── YellowBW@1x.png
│           │       ├── YellowBW@2x.png
│           │       ├── YellowBW@3x.png
│           │       ├── YellowT@1x.png
│           │       ├── YellowT@2x.png
│           │       └── YellowT@3x.png
│           └── speedo.PNG
├── install_git_hooks.sh
├── install_packages.sh
├── install_APP NAME.sh
├── APP NAME-django
│   ├── nginx
│   │   ├── APP NAME_nginx.conf
│   │   └── uwsgi_params
│   ├── requirements.txt
│   ├── APP NAME
│   │   ├── batch_911.py
│   │   ├── batch_load.py
│   │   ├── geoloc
│   │   │   ├── __init__.py
│   │   │   ├── admin.py
│   │   │   ├── apps.py
│   │   │   ├── hacks.py
│   │   │   ├── management
│   │   │   │   ├── __init__.py
│   │   │   │   └── commands
│   │   │   │       ├── __init__.py
│   │   │   │       ├── elastic.py
│   │   │   │       └── initialize.py
│   │   │   ├── migrations
│   │   │   │   ├── 0001_initial.py
│   │   │   │   ├── 0002_event_score.py
│   │   │   │   ├── 0003_auto_20181006_2145.py
│   │   │   │   ├── 0004_area.py
│   │   │   │   ├── 0005_auto_20181111_1954.py
│   │   │   │   ├── 0006_auto_20181114_1542.py
│   │   │   │   └── __init__.py
│   │   │   ├── models.py
│   │   │   ├── search.py
│   │   │   ├── serializers.py
│   │   │   ├── signals.py
│   │   │   ├── tests
│   │   │   │   ├── __init__.py
│   │   │   │   ├── test_geoquery.py
│   │   │   │   ├── test_serializers.py
│   │   │   │   ├── test_signals.py
│   │   │   │   ├── test_views.py
│   │   │   │   └── utils.py
│   │   │   ├── urls.py
│   │   │   └── views.py
│   │   ├── manage.py
│   │   ├── APP NAME
│   │   │   ├── __init__.py
│   │   │   ├── settings.py
│   │   │   ├── urls.py
│   │   │   └── wsgi.py
│   │   ├── update_events.py
│   │   └── users
│   │       ├── __init__.py
│   │       ├── admin.py
│   │       ├── apps.py
│   │       ├── migrations
│   │       │   ├── 0001_initial.py
│   │       │   └── __init__.py
│   │       ├── models.py
│   │       ├── tests
│   │       │   ├── __init__.py
│   │       │   └── test_views.py
│   │       ├── urls.py
│   │       ├── utils.py
│   │       └── views.py
│   └── tutorial.md
└── starter-app
    ├── back-end
    │   ├── chatter
    │   │   ├── __init__.py
    │   │   ├── admin.py
    │   │   ├── apps.py
    │   │   ├── migrations
    │   │   │   └── __init__.py
    │   │   ├── models.py
    │   │   ├── tests.py
    │   │   └── views.py
    │   ├── django_project
    │   │   ├── __init__.py
    │   │   ├── settings.py
    │   │   ├── settings.py.orig
    │   │   ├── urls.py
    │   │   └── wsgi.py
    │   └── manage.py
    └── front-end
        ├── Chatter
        │   ├── AppDelegate.swift
        │   ├── Assets.xcassets
        │   │   └── AppIcon.appiconset
        │   │       └── Contents.json
        │   ├── Base.lproj
        │   │   ├── LaunchScreen.storyboard
        │   │   └── Main.storyboard
        │   ├── Chatt.swift
        │   ├── ChattTableCell.swift
        │   ├── Info.plist
        │   └── ViewController.swift
        └── Chatter.xcodeproj
            ├── project.pbxproj
            ├── project.xcworkspace
            └── xcuserdata

233 directories, 936 files

```
