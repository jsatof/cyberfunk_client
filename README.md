# cyberfunk_client
A futuristic-themed rhythm game with rudimentary network capabilities. 

# Web End
For the web server hosting the database and web views, see the repo:  https://github.com/jsferrarelli/cyberfunk_web

# Demo Video
For a demonstation of what this can do, see here: https://www.youtube.com/watch?v=kM1__B-jWEk

# Assets
We think it is best to leave the static files outside of the repository for sake of repo size. To access the assets we used, they're uploaded on Dropbox. We have a shared folder here: https://www.dropbox.com/sh/5zu27wvs0ddwf4n/AAB3nY27QCDVf6lG-pPodXmsa?dl=0

# Dependencies
First off, we build this with the Godot game engine. If you want to seemlessly run by yourself, it is recommended you have Godot installed (https://godotengine.org/download/)
On top of that we have the following dependencies:
- Godot 3.2.3
- SConstruct
- Python 3.9
- gcc 10.2

# Installation / Building
We aim to have Windows, Mac OSX, and Linux binaries built and released. However that is proving to be another hurdle. Cross-compiling for Windows is being a bit of a doozy but should hopefully be out soon.<br>
In the meantime, Godot themselves advise for the the engine executable be zipped in with our project directory.

# Gameplay Functions
Godot strcutures its games in scenes. Each screen you see is a Scene containing sub-scenes and Godot Nodes. This makes Godot development very modular and easy to expand.

## Main Screen
The first scene you will encounter. It shows a looping animation, a prompt to advance, and a button to login.
### Login
The login feature is half-complete. Upon clicking, the game will prompt for Username and Password. Those fields are prepped to be send for authentification, however they will never reach, as the server doesn't have that implemented.

## Song Selection
The user is given the option to return to the Main Screen or jump into a song to play. They can click on the title card for a song to instantly transition to playing the game.

## Playing a Beatmap
The beatmap is the music in tandem with the arbtriary notes. They notes are synced to the beat of the music, and the player must click the designated button at the right time. 
The player is rewarded based on the timing they hit the note:
```
Perfect Hit: 100pt Base 
Great Hit:   50pt Base
Good Hit:    25pt Base
Miss:        0pt
```
There is a combo counter, it increments when you continuously hit notes without missing.<br>
If you miss, the counter resets to 0, and you lose potential for a high score<br>
The counters are checked every frame of the game, including the score. 
The score is calculated by the formula `(combo + 5) * base_value` - the 5 is just an arbitrary number. This way the score can scale up with combo seemingly exponentially without getting crazy large.

# Post-Beatmap
When a user completes the beatmap, they will be asked to enter a name. They cannot advance without doing so, since we do not have an account system to attach a user id or something.

# End-Screen
This is a scene that reports all the data collected from the user's performance. Perfect, Great, Good, Misses, Accuracy, Score and a Grade based on their accuracy. This data is packaged into a POST request to the Cyberfunk Web Server. Once this data is sent off. The values reset, ready for the next round. They are taken back to Song Selection.
