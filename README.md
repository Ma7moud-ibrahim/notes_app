# Notes App

A Flutter notes app with full offline local storage using Hive, dark UI and Bloc state management.

## Features

- Create notes with title and body via a bottom-sheet form
- Pick a color for each note
- Edit existing notes, including changing their color
- Delete notes
- Notes list with formatted dates
- Fully offline: all data persists locally in Hive
- Dark theme with Poppins font
- BlocObserver for state-change debugging

## Tech Stack

- **Local database:** hive, hive_flutter (with hive_generator + build_runner)
- **State management:** flutter_bloc / bloc
- **UI:** modal_progress_hud_nsn, intl (date formatting), Poppins font

## Project Structure

```
lib/
├── main.dart
├── constants.dart
├── cubits/        # add_note and notes cubits
├── models/        # NoteModel (Hive type adapter)
├── views/         # Notes view, edit note view
└── widgets/       # Note items, forms, color pickers
```

## Getting Started

1. Install Flutter (SDK ^3.12.2).
2. Clone the repo and fetch dependencies:
   ```bash
   flutter pub get
   ```
3. (Only if you change `NoteModel`) regenerate the Hive adapter:
   ```bash
   dart run build_runner build
   ```
4. Run:
   ```bash
   flutter run
   ```

## Future Work

This app is under active development, and the remaining features can be completed in the future. Planned next steps:

- Search notes
- Pin important notes to the top
- Note reminders and notifications
- Cloud sync and backup
