# ToonTrail

ToonTrail is a Flutter-based application that allows users to explore and enjoy webtoons. With ToonTrail, users can browse today's top webtoons, view detailed information about each webtoon, and keep track of their favorite episodes. The app fetches data from a webtoon API and displays it in a user-friendly interface.

## Project Structure

The project follows a structured and organized approach with the following folders and main files:

- **models/**: Contains the data models for webtoons and episodes.
  - `webtoon_model.dart`: Defines the Webtoon model.
  - `webtoon_detail_model.dart`: Defines the detailed Webtoon model.
  - `webtoon_episode_model.dart`: Defines the Webtoon episode model.
- **screens/**: Contains the main screens of the app.
  - `home_screen.dart`: The main screen displaying today's webtoons.
  - `detail_screen.dart`: The detailed view screen for a selected webtoon.
- **services/**: Contains the service class for API interactions.
  - `api_service.dart`: Handles all API requests and responses.
- **widgets/**: Contains custom widgets used throughout the app.
  - `webtoon_widget.dart`: A widget for displaying a webtoon in the list.
  - `episode_widget.dart`: A widget for displaying webtoon episodes.
- **main.dart**: The entry point of the application.

## Installation

To run this project locally, follow these steps:

1. **Clone the repository:**

   ```bash
   git clone https://github.com/minhosong88/ToonTrail.git
   cd ToonTrail
   ```

2. **Install dependencies:**
   Ensure you have Flutter installed. Run the following command to install dependencies:
   ```bash
   flutter pub get
   ```
3. **Run the app:**
   Use the following command to run the app on your emulator or connected device:
   ```bash
   flutter run
   ```

## Usage

Upon launching ToonTrail, users are presented with a list of today's top webtoons. Tapping on a webtoon takes the user to a detailed screen that provides more information about the webtoon and its latest episodes. Users can tap on an episode to open it in their browser.

### Key Features

- **Browse Today's Webtoons**: View a curated list of today's most popular webtoons.
- **Detailed Webtoon Information**: Access detailed descriptions, genres, and ratings for each webtoon.
- **Favorite Episodes**: Mark episodes as favorites and keep track of them.
- **Responsive Design**: Optimized for both mobile and tablet devices.

## Technologies Used

- **Flutter**: The primary framework used for building the app.
- **Dart**: The programming language used with Flutter.
- **HTTP Package**: For handling API requests.
- **Shared Preferences**: For storing user preferences locally.
- **URL Launcher**: To open webtoon episodes in the user's default browser.

## API

ToonTrail uses the Webtoon Crawler API hosted on Cloudflare Workers to fetch webtoon data.

- **Base URL**: `https://webtoon-crawler.nomadcoders.workers.dev`
- **Endpoints**:
  - `/today`: Fetches today's webtoons.
  - `/:id`: Fetches details for a specific webtoon.
  - `/:id/episodes`: Fetches episodes for a specific webtoon.

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request for any improvements or new features.

1. Fork the Project.
2. Create your feature branch: `git checkout -b feature/AmazingFeature`.
3. Commit your changes: `git commit -m 'Add some AmazingFeature'`.
4. Push to the branch: `git push origin feature/AmazingFeature`.
5. Open a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Contact

For any questions or feedback, please reach out to me on GitHub: [minhosong88](https://github.com/minhosong88)
