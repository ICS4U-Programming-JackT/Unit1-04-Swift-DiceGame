import Foundation

// Constants for the guessing game
let MinValue: Int = 1
let MaxValue: Int = 6

// Error cases for invalid input
enum GuessError: Error {
    case invalidInput
    case outOfRange
}

// Main program function
func main() {
    // Generate random target number
    let target = Int.random(in: MinValue...MaxValue)
    var guesses = 0
    var guessedCorrectly = false
    
    print("Welcome to the Guessing Game!")
    print("I picked a number between \(MinValue) and \(MaxValue). Try to guess it!")
    
    while !guessedCorrectly {
        print("Enter your guess:", terminator: " ")
        
        if let input = readLine() {
            do {
                // Try converting input to Int
                guard let guess = Int(input) else {
                    throw GuessError.invalidInput
                }
                
                // Increment guess count
                guesses += 1
                
                // Check range
                if guess < MinValue || guess > MaxValue {
                    throw GuessError.outOfRange
                }
                
                // Compare guess with target
                if guess < target {
                    print("Too low! Try again.")
                } else if guess > target {
                    print("Too high! Try again.")
                } else {
                    print("Correct! The number was \(target).")
                    print("It took you \(guesses) guess(es).")
                    guessedCorrectly = true
                }
                
            } catch GuessError.invalidInput {
                print("Error: Please enter a valid number between \(MinValue) and \(MaxValue).")
            } catch GuessError.outOfRange {
                print("Error: Your guess must be between \(MinValue) and \(MaxValue).")
            } catch {
                print("An unexpected error occurred: \(error)")
            }
        } else {
            print("Error: Could not read input.")
        }
    }
}

// Run the program
main()
