# F1 Champions Challenge

A new Flutter project for the INJOZI Frontend Developer Coding Challenge.
It creates a single page application [(SPA)](https://en.wikipedia.org/wiki/Single-page_application) that shows the F1 world champions starting from 2005 until present. Allows a user to view the winners for every race for the selected year. Uses the [Ergast Developer API](http://ergast.com/mrd/) to retrieve the data.

## Color Scheme

Got the Color Scheme using the [Material 3 Theme builder](https://m3.material.io/theme-builder#/dynamic) and inputting the Official F1 Color.

## Project Structure

Inside this project you'll see the following folders and files:

```text
├── public/
├── lib/
│   ├── main.dart - launches the app
│   ├── app/ - contains the main app widget
│   ├── classes/ - classes for representing the API data
│   ├── services/ - retrieves data from the API endpoint
│   ├── widgets/ - widgets that are used in the API
│   └── pages/ - The two pages that display the smaller widgets
├── Dockerfile
├── docker-compose.yaml
├── README.md
├── pubspec.yaml
```
