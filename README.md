# Sudoku
Sudoku Solver & Generator – create, generate, or solve Sudoku puzzles

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

## Description

This project is a complete Sudoku tool written in [Xojo](https://www.xojo.com/).  

### Features

- Create a Sudoku puzzle
  - Enter your own Sudoku puzzle
  - Generate a random Sudoku puzzle with a given number of clues  
- Solve the Sudoku puzzle
  - Interactively edit puzzles in a desktop UI with on the fly validation  
  - Let the solver complete the puzzle  

### Logic
*The solver uses a classic backtracking algorithm with rule checking to guarantee correct solutions. Random puzzle generation is based on creating a full valid grid, applying digit shuffling, and then removing cells to reach the desired clue count.*


### ScreenShot

![ScreenShot: Disk Image](ScreenShots/Sudoku.png?raw=true)


## Xojo
### Requirements
[Xojo](https://www.xojo.com/) is a rapid application development for Desktop, Web, Mobile & Raspberry Pi.  

The Desktop application Xojo project ```Sudoku.xojo_project``` is using:
- Xojo 2024r4.2
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
