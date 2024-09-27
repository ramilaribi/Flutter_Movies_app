# 🎬 Movies App

A Flutter application using Getx for state management that showcases a list of movies using the TVmaze API. The app includes a splash screen, home screen, search screen, and details screen for a seamless movie browsing experience. 🌟

## 📋 Features

- **Splash Screen**: Displays an introductory image related to the app theme. 🎉
- **Home Screen**: 
  - Lists all movies fetched from the TVmaze API. 📺
  - Each movie is displayed with a thumbnail image, title, and summary. 🖼️
  - Includes a search bar to navigate to the search screen. 🔍
- **Search Screen**: 
  - Allows users to search for movies by name. 📝
  - Displays search results in a similar format to the home screen. 📄
- **Details Screen**: 
  - Shows detailed information about the selected movie, including the image, title, and summary. 🧐
- **Bottom Navigation**: 
  - Easy navigation between the Home Screen and Search Screen. 📱

## 🌐 API Endpoints

- **Home Screen**: 
  - Fetch movies: 
    ```plaintext
    https://api.tvmaze.com/search/shows?q=all
    ```
  
- **Search Screen**: 
  - Search movies: 
    ```plaintext
    https://api.tvmaze.com/search/shows?q={search_term}
    ```

## ⚙️ Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/ramilaribi/movies_app.git
