# Rename-And-Organize by DomainTyler

A simple Windows batch script to **rename and organize files** in a specified folder by their creation date. The script groups files into folders named by the day, month, date, and year of creation, and renames the files with their creation timestamp to keep them sorted and easily identifiable.

---

## Features

- Organizes files into folders based on their creation date (e.g., `Thursday May 15 2025`).
- Renames files to include their full creation timestamp.
- Automatically handles filename conflicts by appending a counter.
- Simple user prompt to specify the target folder.
- Pure batch script — no dependencies other than Windows PowerShell.

---

## Usage

1. Download or clone the repository.
2. Place the `Rename-And-Organize by DomainTyler.bat` file anywhere on your system.
3. Double-click to run or execute via Command Prompt.
4. When prompted, enter the full path to the folder containing the files you want to organize.
5. The script will rename and move the files into folders named by their creation date.

---
## Example

Before:
/MyFolder
├─ file1.txt
├─ image.png
└─ document.docx

After running the script, files will be organized like:
/MyFolder
├─ Thursday May 15 2025
├─ Thursday May 15 2025 10-30 AM.txt
├─ Thursday May 15 2025 10-45 AM.png
└─ Thursday May 15 2025 11-00 AM.docx


---

## Requirements

- Windows OS with PowerShell support (default on Windows 7 and later).
- Command Prompt access to run batch files.

---

## Limitations

- Only processes files in the specified folder (does not recurse subfolders).
- Uses file creation time which can be changed by some tools or copied files.

---

## License

This project is released under the MIT License.

---

## Author

**DomainTyler**

Feel free to contribute or report issues!

---

