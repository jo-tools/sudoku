# Sudoku
Sudoku Solver & Generator

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

## Description

This project is a Sudoku Tool written in [Xojo](https://www.xojo.com/) and available as a Desktop and Web Application.  
The Web Application is also available as a [Docker Image: jotools/sudoku](https://hub.docker.com/r/jotools/sudoku).

### Features

- Sudoku Sizes
  - 4x4 | 6x6 | 8x8 | 9x9 | 12x12 | 16x16
- Create a Sudoku puzzle
  - Generate a random Sudoku puzzle with a given number of clues
  - Enter your own Sudoku puzzle
- Solve the Sudoku puzzle
  - Interactively edit puzzles with
    - On-the-fly validation
    - Hints
      - Highlight easiest cells to solve *(Naked Singles, Hidden Singles)*
      - Display all possible cell candidates
      - Optionally mark cell candidates that can be excluded *(Locked Candidates, Naked Subsets, Hidden Subsets, X-Wing)*
  - Let the solver complete the puzzle
- Export as PDF | Print
- Save to File | Open from File *(Desktop only)*
- Web Application
  - API to generate and solve Sudoku Puzzles *(Formats: Txt, Json, PDF)*


### Logic

*The solver uses Dancing Links (DLX) - Knuth's Algorithm X - for all solving operations. DLX models Sudoku as an exact cover problem with a sparse matrix representation, enabling fast solving even for larger grid sizes (12x12, 16x16). Puzzle generation creates a complete random solution using DLX, then removes cells while verifying unique solvability. Interactive hints (Naked Singles, Hidden Singles) and candidate exclusion strategies are provided separately for solving assistance.*


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
- `GET: /api/sudoku/generate?size=9&numClues=40&format=json&addSolution=false`  
  Generates a Sudoku according to the Query Params:  
  - `size`: Sudoku Size *(`4`, `6`, `8`, `9`, `12`, `16`; Default: `9`)*
  - `numClues`: Desired Number of Clues *(not guaranteed to be reached)*  
     *(Min: `30% of n*n`; Default: `45% of n*n`)*
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
