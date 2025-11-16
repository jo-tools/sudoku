# Sudoku
Sudoku Solver & Generator

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

## Description

This project is a Sudoku Tool written in [Xojo](https://www.xojo.com/) and available as a Desktop and Web Application.  
The Web Application is also available as a [Docker Image: jotools/sudoku](https://hub.docker.com/r/jotools/sudoku).

### Features

- Create a Sudoku puzzle
  - Enter your own Sudoku puzzle
  - Generate a random Sudoku puzzle with a given number of clues
- Solve the Sudoku puzzle
  - Interactively edit puzzles with
    - On-the-fly validation
    - Hints
      - Highlight easiest cells to solve *(Naked Singles, Hidden Singles)*
      - Display possible cell candidates
  - Let the solver complete the puzzle
- Export as PDF | Print
- Save to File | Open from File *(Desktop only)*
- Web Application
  - API to generate and solve Sudoku Puzzles *(Formats: Txt, Json, PDF)*


### Logic

*The solver uses a classic backtracking algorithm with strategies and rule checking to guarantee correct solutions. Random puzzle generation is based on creating a full valid grid, applying digit shuffling, and then removing cells to reach the desired clue count while enforcing a unique solution.*


### Web Application

The Web Application can be used with it's User Interface.  
Sudoku Puzzles can be exported as JSON or Text *(these files can be opened in the corresponding Desktop Application)*, or downloaded as PDF.  
The Web Application is also available as a [Docker Image: jotools/sudoku](https://hub.docker.com/r/jotools/sudoku).

#### Sudoku API

The Web Application also provides an API to generate and solve Sudoku Puzzles.  
See also the included [Postman Collection: Sudoku API](./Resources/Sudoku.postman_collection.json) *(Note: Change the `WebAppBaseUrl` in the Collection Variables according to your environment)*.

Endpoints:  
- `GET: /api/sudoku/info`  
  Returns JSON information about the Web Application
- `GET: /api/sudoku/generate?numClues=40&format=json&addSolution=false`  
  Generates a Sudoku according to the Query Params:  
  - `numClues`: Number of Clues *(Min: `24`, Max: `81`; Default: `40`)*
  - `format`: Download Format *(Available: [`json` | `txt` | `pdf`]; Default: `json`)*
  - `addSolution`: Add Solution in Response *(Default: `false`; not available in Format txt)*
- `POST: /api/sudoku/solve?format=json`  
  Solves the posted Sudoku Puzzle.  
  The Body Content can be either in Text or Json Format.  
  - `format`: Response Format *(Available: [`json` | `txt`]; Default: empty - returns in posted format)*

### ScreenShots

#### Desktop Application

![ScreenShot: Sudoku Desktop](ScreenShots/SudokuDesktop.png?raw=true)

#### Web Application

![ScreenShot: Sudoku Web](ScreenShots/SudokuWeb.png?raw=true)


## Xojo
### Requirements
[Xojo](https://www.xojo.com/) is a rapid application development for Desktop, Web, Mobile & Raspberry Pi.  

The Xojo projects `SudokuDesktop.xojo_project` and `SudokuWeb.xojo_project` are using:
- Xojo 2025r2.1
- API 2


## About
Juerg Otter is a long term user of Xojo and working for [CM Informatik AG](https://cmiag.ch/). Their Application [CMI LehrerOffice](https://cmi-bildung.ch/) is a Xojo Design Award Winner 2018. In his leisure time Juerg provides some [bits and pieces for Xojo Developers](https://www.jo-tools.ch/).

### Contact
[![E-Mail](https://img.shields.io/static/v1?style=social&label=E-Mail&message=xojo@jo-tools.ch)](mailto:xojo@jo-tools.ch)
&emsp;&emsp;
[![Follow on Facebook](https://img.shields.io/static/v1?style=social&logo=facebook&label=Facebook&message=juerg.otter)](https://www.facebook.com/juerg.otter)
&emsp;&emsp;
[![Follow on Twitter](https://img.shields.io/twitter/follow/juergotter?style=social)](https://twitter.com/juergotter)

### Donation
Do you like this project? Does it help you? Has it saved you time and money?  
You're welcome - it's free... If you want to say thanks I'd appreciate a [message](mailto:xojo@jo-tools.ch) or a small [donation via PayPal](https://paypal.me/jotools).  

[![PayPal Dontation to jotools](https://img.shields.io/static/v1?style=social&logo=paypal&label=PayPal&message=jotools)](https://paypal.me/jotools)
