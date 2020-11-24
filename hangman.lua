require '/ComputerCraftThings/library'

--TODO: Make this into a function

--Set game values to starting points
--These are currently unused and will probably be deleted in the future
local phraseGuessed = false
local guessedLetters = {}

function checkIfValid(toCheck)
    --Function to check if toCheck contains anything other than letters.
    if(toCheck:match("%A")) then
        --TODO: Change to allow spaces
        --Failed: Contains other than letters
        return false
    else
        --Passed: Only contains letters
        return true
    end
end

function askForPhrase()
    -- function that asks for and returns a phrase
    while true do
        --Loop that goes until a valid phrase is entered
        print("Enter the phrase")
        local phrase = read("*") --The phrase P1 enters

        if checkIfValid(phrase) == true then
            --Phrase was valid. Return phrase
            return phrase
            --break
        else
            --Phrase was not valid. Clear and keep asking for phrases.
            term.clear()
            print("Invalid phrase. Phrase may only contain letters.")
        end
    end
end   

function checkLetter(set, letter)
    --function to check if a letter is in a list
    for i,v in ipairs(set) do
        if v == letter then
            return true
        end
    end
    return false
end

function runGame(phrase)
    if phrase == nil then
        --If no phrase entered, ask for one
        phrase = askForPhrase()
    end

    phrase = string.lower(phrase) --make phrase lowercase

    local phraseLength = string.len(phrase)
    local phraseList = split(phrase, "%s")

    local guessedLetters = {}

    while true do
        --main game loop
        term.clear()
        print("Guess a letter")
        local letter = io.read()
        letter = string.lower(letter)

        --Currently broken: checkLetter() always returns false
        if checkLetter(guessedLetters, letter) then
            --letter has already been guessed
            print("You have already guessed that letter!")
            sleep(3)
        else
            --letter has not been poreviously guessed
            if string.len(letter) == 1 then
                --string is 1 character long
                if checkIfValid(letter) then                   
                    --Letter was valid
                    --Add the letter to the guessed letters, then sort alphabetically
                    table.insert(guessedLetters, letter)
                    table.sort(guessedLetters)
                    
                    print(table.concat(guessedLetters))
                    sleep(3)
                else
                    --letter was invalid
                    print("Error: Not a valid letter")
                    sleep(3)
                end
            else
                print("Error: Letter can only be 1 character long")
                sleep(3)
            end
        end
    end
end

--DEBUG

runGame()

-- local phrase = askForPhrase()


-- if checkIfValid(phrase) == true then
--     print("Valid phrase:")
--     print(phrase)
-- elseif checkIfValid(phrase) == false then
--     print("Invalid phrase. Phrase may only contain letters.")
-- else
--     print("An error occurred while checking if your phrase was valid.")
-- end

--TODO: Write main game loop