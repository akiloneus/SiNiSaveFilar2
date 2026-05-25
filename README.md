[English](README.md) | [简体中文](README_zh_cn.md) | [繁體中文](README_zh_tw.md) | [日本語](README_jp.md)
---

# SiNiSaveFilar2 - SiNiSistar2 Save Tool

A multi-lingual save data decoding and repacking tool designed specifically for the game **SiNiSistar2**. 

## Features
- **Interactive TUI**: An easy-to-use Terminal User Interface with full multi-language support (English, Simplified Chinese, Traditional Chinese, Japanese).
- **Decode Obfuscated Saves**: Safely reads the game's obfuscated save files (`File01`, `System`, etc.) and decodes them into a highly readable, editable `.json` format while preserving thumbnail images.
- **Automated Backups**: Automatically creates backups of your original save files before performing any decoding operations to prevent accidental data loss.
- **Smart Repacking (Encode)**: Seamlessly repacks your modified JSON data back into the game's native obfuscated and encoded format, ready to be loaded by the game engine.

## Usage
1. Place `SiNiSaveFilar2.ps1` and `Run_SiNiSaveFilar2.bat` in the same directory as your SiNiSistar2 save files.
   - *Default Save Path on Windows:* `%USERPROFILE%\AppData\LocalLow\Uu\SiNiSistar2\SaveData`
2. Double-click **`Run_SiNiSaveFilar2.bat`** to launch the tool.
   - *(Note: Using the `.bat` file automatically bypasses PowerShell execution policy restrictions, allowing the script to run safely with a double-click).*
3. Follow the on-screen TUI to select your language and choose an operation:
   - **[1] Decode Saves**: Extracts your saves into a newly created `<timestamp>_SaveData_decoded` folder and backs up the originals to `<timestamp>_SaveData_backup`.
   - **Edit**: Open the extracted `.json` files using any text editor (e.g., Notepad, VSCode) to modify in-game variables such as `m_PlayerName`, items, or stats.
   - **[2] Encode Saves**: Select your modified folder in the tool to repack the edited JSONs into `<timestamp>_SaveData_encoded`.
4. Copy the newly repacked files from the `encoded` folder back into the root `SaveData` directory, overwriting the originals.
5. Launch the game and enjoy your modifications!

## Disclaimer

**USE AT YOUR OWN RISK.** Modifying game save data can lead to unpredictable game behavior, crashes, or irreversible save file corruption. 
- While this tool attempts to create automated backups, manual backups of your `SaveData` folder are highly recommended before use.
- The author of this tool is **NOT** responsible for any lost progress, corrupted data, or other damages resulting from the use or misuse of this script.

**NOT AFFILIATED:** SiNiSaveFilar2 is an unofficial, community-made tool. It is **NOT** affiliated with, endorsed by, maintained by, or in any way officially connected to **Uu** (the official development team of SiNiSistar2) or their partners. All product names, logos, and brands are property of their respective owners.

## License
This project is licensed under the GNU General Public License v3.0 - see the LICENSE file for details.
