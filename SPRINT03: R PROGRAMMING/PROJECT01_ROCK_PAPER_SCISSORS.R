## PROJECT: ROCK_PAPER_SCISSORS

game <- function() {

## GREETING & USERNAME

    flush.console()
    username <- readline("What is Your Name: ")
    print(paste("Hi", username))
    print("Welcome to the Rock Paper Scissors Game")

## READY TO PLAY

    print(3)
    print(2)
    print(1)
    print("If You Want to Start the Rock Paper Scissors Game")
    print("Please Enter The Command: T")
    print("If You Want to Stop the Rock Paper Scissors Game")
    print("Please Enter The Command: F")

## HOW TO PLAY

    flush.console()
    ready <- as.logical(readline("Are You Ready to Play?: "))

        if(ready == T) {
            print("Each Player Chooses One of Three Hand Signals: Rock, Paper, or Scissors")
            print("[🫳] ROCK: A Closed Fist Represents Rock")
            print("[🫱] PAPER: A Flat Hand With Fingers and Thumb Extended, Palm Facing Down, Represents Paper")
            print("[✌️] SCISSORS: A fist With the Index and Middle Fingers Fully Extended Towards the Opponent Represents Scissors")
            print("Rules")
            print("Rock Beats Scissors")
            print("Paper Beats Rock")
            print("Scissors Beat Paper")
            print("The Game Has Two Rounds")
            print("If Both Players Choose the Same Hand Signal, It's A Tie and the Game Will Be Played Again")
            print("If A Player Chooses Rock and the Other Player Chooses Scissors, the Rock Player Wins")
            print("If A Player Chooses Paper and the Other Player Chooses Rock, the paper player Wins")
            print("If A Player Chooses Scissors and the Other Player Chooses Paper, the Scissors Player Wins")
            print("If You Win Your Score Plus 1 Point")
            print("If You Lose Your Score Minus 1 Point")
            print("Let's Play Together")
        } else

            if (ready == F) {
            print(paste("Nice to Meet You", username))
            return(print("🎉🎉🎊🎊Hope to See you Again Later🎊🎊"))
        }

## SCORE AND ROUND

    round <- 0
    p_score <- 0
    c_score <- 0

 ## HAND

    print("______________________________________")
    df <- data.frame(
        id_hand = 1:3,
        hand_type = c("Rock", "Paper", "Scissors")
    )
    print(df)
    print("______________________________________")


## START

    if (ready == T) {
    while (ready == T & round <= 5) {

        random <- c("R", "P", "S")
        c_hand <- sample(random, 1)
        flush.console()
        p_hand <- as.character(readline("Please Choose the Choices [R] Rock [P] Paper [S] Scissors: "))
        print(paste("Computer Hand", c_hand, "Versus", "Player Hand", p_hand))

## PLAYER WIN

        if(p_hand == "R" & c_hand == "S") {
            p_score <- p_score + 1
            print(toupper("🎗️player win🎗️"))
        } else

        if(p_hand == "P" & c_hand == "R") {
            p_score <- p_score + 1
            print(toupper("🎗️player win🎗️"))
        } else

        if(p_hand == "S" & c_hand == "P") {
            p_score <- p_score + 1
            print(toupper("🎗️player win🎗️"))
        } else

## COMPUTER WIN

        if(c_hand == "R" & p_hand == "S") {
            c_score <- c_score + 1
            print(toupper("🎗️computer win🎗️"))
        } else

        if(c_hand == "P" & p_hand == "R") {
            c_score <- c_score + 1
            print(toupper("🎗️computer win🎗️"))
        } else

        if(c_hand == "S" & p_hand == "P") {
            p_score <- p_score + 1
            print(toupper("🎗️computer win🎗️"))
        } else

        if(p_hand == c_hand | c_hand == p_hand) {
            print(toupper("🔥play again🔥"))
            c_score <- c_score + 0
            p_score <- p_score + 0
            print("✨No Score✨")
        }

   round <- round + 1

        if (round == 5) {
        print("👌STOP👌")
        break
        }
    }

        print(paste("Player's Total Score", p_score, "Computer Score", c_score))

## TOTAL SCORE OF PLAYER

        if(p_score > c_score) {
            print(toupper("🎉Congratulations🎉"))
            return(print(paste("Player Score", p_score)))
            print(toupper("✨You Are the Champions✨"))

        } else

## TOTAL SCORE OF COMPUTER

        if(p_score < c_score) {
            print(toupper("🎉Congratulations🎉"))
            return(print(paste("Computer Score", c_score)))
            print(toupper("✨Computer Is the Champions✨"))
        } else

        if(p_score == c_score) {
            print("😘😘Tie😘😘")
            return(print(paste("Computer Score", c_score, "Player Score", p_score)))
        }
    }

}
