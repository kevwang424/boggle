# Boggle by Kevin Wang

### Prompt
Using a 4x4 boggle board output all possible words. Words are:
1. At least one character
2. The letters in each word must be next to or diagonal to each other
3. Once a letter is used, it cannot be used again

### Testing
You must run 'bundle install' to install ```ruby-dictionary``` gem.

The test can be found in ```test.rb```
I have provided a ```test_board``` and a using the dictionary gem created a ```new Dictionary``` object to compare the results against.

Used [this](http://fuzzylogicinc.net/boggle/EnterBoard.aspx?BoardID=tgcahtovttqrsbei&Length=3) site to get the board and the possible word combinations. (**NOTE**: I had to add one and two character words to the list as the website only provided words with a minimum of 3 letters. "a", "be", "go", "i", "or", "to". were added number of results are *79*.)

To run type ```ruby test.rb``` in the console.

Results return ```true``` to the console if words equal to the ```test_answer``` words, an array of the *79* words.

### How Code Works
You must run 'bundle install' to install ```ruby-dictionary``` gem.
The ```main.rb``` is where everything is kicked off.
To run type ```ruby main.rb``` in the console.

1. A board needs to be randomly generated using the CreateBoard class. The board will print out to the console in a visually appealing format in order for users to see current random board.

   * The ```create_board.rb``` file contains the class that will create a new board with random characters.


2. The dictionary of words needs to be instantiated. Valid English words are stored in ```words.txt```, source of file can be found [here](https://github.com/dwyl/english-words). (**NOTE**: The legitimacy of this list is questionable.)

3. A new instance of ```Boggle``` is created by passing in the board and dictionary and is saved as ```game```.

   * When an instance is initialized ```board``` and ```dictionary``` are stored as an instance variable and an ```Adjacent``` instance is also instantiated.

     * The ```adjacent.rb``` contains the code to find all neighboring letters, given a letters position. It returns a ```Hash``` with ```keys``` of the position and ```values``` of the letters.


4. ```game``` will call the ```boggle()``` method which is the method that returns the list of words.

   * This method will need is going to iterate through each letter.

     * The current letter's position is stored with variable ```current_letter_position```
     * An array will have to keep track of all positions (characters) that have already been used. This is variable ```used_chars_position```
     * The letter that we are on will make the beginning of a word and stored as ```word_start```.

    * ```building_words``` is called passing in all three variables as arguments.

      * If ```word_start``` is considered a word it will be pushed into the ```WORDS``` constant.
      * Then we find all ```adjacent_letters``` based on the position of the letter that was passed in.
      * Do a check to see if any of the ```adjacent_letters``` have already been used by comparing it to ```used_chars_position```. If so we will delete them. This prevents the application from using letters that have already been used.
      * Now that "used" letters are removed, iterate through each adjacent letter. With this letter I add it's position to the "used" array and concatenate it to the existing word. **NOTE** In order to not mutate the ```word_start``` and ```used_chars_position``` that were used in the first iteration, I reassign to ```concat_word``` and  ```add_to_used_chars_position``` respectively.
      * With the second character of the word thus far I have to repeat the same process by finding adjacent letters. I call ```building_words``` again and pass in the ```concat_word```,  ```position``` of this second letter, and the positions that have already been used. This keeps repeating until there are no more valid ```adjacent_letters``` AKA they have already been used.  


5. ```boggle()``` will remove the duplicates and sort the words in alphabetical order before returning all possible words. I store what is returned from ```boggle()``` into the variable ```all_words``` and print it to the console for the user to see and compare.

### Notes
The runtime of this program is not ideal, it does take about 10-15 minutes to run. An enhancement will be performed to improve runtime at a later date.
