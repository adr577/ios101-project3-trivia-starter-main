# Project 3 - *Trivia 101*

Submitted by: **Adrian Hernandez*

**Trivia 101** is an a fast-paced trivia app where you test your knowledge across various categories. Answer questions quickly to earn points and track your score as you compete against yourself or challenge friends. 

Time spent: **8** hours spent in total

## Required Features

The following **required** functionality is completed:

- [X] User can view the current question and 4 different answers
- [X] User can view the next question after tapping an answer
- [X] User can answer at least 3 different questions


The following **optional** features are implemented:

- [X] User can use the vertical orientation of the app on any device
- [X] User can track the question they are on and how many questions are left
- [X] User can see how many questions they got correct after answering all questions
- [X] User should be able to restart the game after they've finished answering all questions


## Video Walkthrough

Here is a reminder on how to embed Loom videos on GitHub. Feel free to remove this reminder once you upload your README. 

[Guide]](https://www.youtube.com/watch?v=GA92eKlYio4) .

## Notes

- Configuring the buttons to appropiately update.
- Constraints and allignment
- I had an issue when I the question remaining reached zero, the show_results function was not being called
- Initially I had all buttons tied together as a strong var, but I was having major issues with their outlets, so I individually assigned them outlets.
- Question index out of range issues
- I had to deeply research making the alert issues pop up and configuring it.

## License

    Copyright [2024] [Adrian Hernandez]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
