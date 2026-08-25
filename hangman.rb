# frozen_string_literal: true


=begin
  1) First we need to create our word class
    - Initializes from the data directory wordlist (5-12 char long)
  2) Next we need to create our UI class
    - It will have a reference to the word class
    - Uses the word class to get the word outline (letters guessed and underscores)
    - Then it will print the lives you have left (tracked in main loop)
    - It also prints the letters already guessed
  2) Next we need to design the main loop
    - Start with init the word class
    - Init the UI class with the word class
    - Then enter an infinite loop prompting the user for a letter and validating and sanitizing input
    - It then will query the word class for validity which then the word class responds by true or false
    - If false the letter is put into a bad letter list and a life is lost (8 lives)
    - If true the word class updates itself
  3) Keep going until out of lives or we get the word
=end