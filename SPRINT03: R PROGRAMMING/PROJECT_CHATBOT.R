## PROJECT_CHATBOT

chatbot <- function() {

## SHOW MENU

    p_small <- list(
                pizza_id = 1:5,
                pizza_small = c("Angry Chicken", "Seafood Cocktail", "Double Pepperoni", "Shrimp Cocktail", "Meat Deluxe"),
                prices = rep(479, 5)
                )

    p_medium <- list(
                pizza_id = 6:10,
                pizza_medium = c("Angry Chicken", "Seafood Cocktail", "Double Pepperoni", "Shrimp Cocktail", "Meat Deluxe"),
                prices =  rep(569, 5)
                )

    p_large <- list(
                pizza_id = 11:15,
                pizza_large = c("Angry Chicken", "Seafood Cocktail", "Double Pepperoni", "Shrimp Cocktail", "Meat Deluxe"),
                prices = rep(689, 5)
                )
## NESTED LIST

    df_pizza <- list(
                p_small,
                p_medium,
                p_large
                )

## GREETING AND USERNAME

    flush.console()
    user_name <- as.character(readline("What is Your Name: "))
    print(paste("Hi", user_name, "Nice to Meet You"))
    print("Welcome to the Pizza Shop")
    print("How Can I Assist You Today?")
    print(3)
    print(2)
    print(1)
    print("If You Want to Order the Pizza")
    print("Please Enter the Command: T")
    print("If You Are not Order the Pizza")
    print("Please Enter the Command: F")

    flush.console()
    p_order <- as.logical(readline("Are You Want to Order the Pizza?: "))

    if (p_order == F) {
            print("🎉Congratulations🎉")
            print("You Get A Discount Code: ROCK (50%)")
            return(print(paste("Hope to See you Again", user_name)))
        }

    while(p_order == T) {

    flush.console()
    command <- as.logical(readline("Please Enter the Command Again: "))

        if(command == T) {
            print("What Kind of Pizza Do You Like?")
            print("1. Angry Chicken")
            print("2. Seafood Cocktail")
            print("3. Double Pepperoni")
            print("4. Meat Deluxe")
            print("Small Size Price: 479 Bath")
            print("Medium Size Price: 569 Bath")
            print("Large Size Price: 689 Bath")
            print("_______________________________________")
            print(data.frame(p_small))
            print("_______________________________________")
            print(data.frame(p_medium))
            print("_______________________________________")
            print(data.frame(p_large))
            print("_______________________________________")
            break
        }
    }

## PRICE AND ORDER

total_price <- 0

            print("If You Ready to Order the Pizza")
            print("Please Enter the Command: T")
            print("If You Are not Order the Pizza")
            print("Please Enter the Command: F")

            flush.console()
  choice <- as.logical(readline("Let's Do It: "))

    while(choice == T) {

    flush.console()
    order <- readline("Which One Would Like to Order 1-15:  ")

                if(order == 1) {
                flush.console()
    quantity <- as.integer(readline("Quantity: "))
                print("Angry Chicken")
                print("Small Size")
                print("price")
       price <- print(479)
total_price <- (quantity * price) + total_price
                break
                } else

                if(order == 2) {
                flush.console()
    quantity <- as.integer(readline("Quantity: "))
                print("Seafood Cocktail")
                print("Small Size")
                print("price")
       price <- print(479)
total_price <- (quantity * price) + total_price
                break
                } else

                if(order == 3) {
                flush.console()
    quantity <- as.integer(readline("Quantity: "))
                print("Double Pepperoni")
                print("Small Size")
                print("price")
       price <- print(479)
total_price <- (quantity * price) + total_price
                break
                } else

                if(order == 4) {
                    flush.console()
    quantity <- as.integer(readline("Quantity: "))
                print("Shrimp Cocktail")
                print("Small Size")
                print("price")
       price <- print(479)
total_price <- (quantity * price) + total_price
                break
                } else

                if(order == 5) {
                flush.console()
    quantity <- as.integer(readline("Quantity: "))
                print("Meat Deluxe")
                print("Small Size")
                print("price")
       price <- print(479)
total_price <- (quantity * price) + total_price
                break
                } else

                if(order == 6) {
                flush.console()
    quantity <- as.integer(readline("Quantity: "))
                print("Angry Chicken")
                print("Medium Size")
                print("price")
       price <- print(569)
total_price <- (quantity * price) + total_price
                break
                } else

                if(order == 7) {
                flush.console()
    quantity <- as.integer(readline("Quantity: "))
                print("Seafood Cocktail")
                print("Medium Size")
                print("price")
       price <- print(569)
total_price <- (quantity * price) + total_price
                break
                } else

                if(order == 8) {
                flush.console()
    quantity <- as.integer(readline("Quantity: "))
                print("Double Pepperoni")
                print("Medium Size")
                print("price")
       price <- print(569)
total_price <- (quantity * price) + total_price
                break
                } else

                if(order == 9) {
                flush.console()
    quantity <- as.integer(readline("Quantity: "))
                print("Shrimp Cocktail")
                print("Medium Size")
                print("price")
       price <- print(569)
total_price <- (quantity * price) + total_price
                break
                } else

                if(order == 10) {
                flush.console()
    quantity <- as.integer(readline("Quantity: "))
                print("Meat Deluxe")
                print("Medium Size")
                print("price")
       price <- print(569)
total_price <- (quantity * price) + total_price
                break
                } else

                if(order == 11) {
                flush.console()
    quantity <- as.integer(readline("Quantity: "))
                print("Angry Chicken")
                print("Large Size")
                print("price")
       price <- print(689)
total_price <- (quantity * price) + total_price
                break
                } else

                if(order == 12) {
                flush.console()
    quantity <- as.integer(readline("Quantity: "))
                print("Seafood Cocktail")
                print("Large Size")
                print("price")
       price <- print(689)
total_price <- (quantity * price) + total_price
                break
                } else

                if(order == 13) {
                flush.console()
    quantity <- as.integer(readline("Quantity: "))
                print("Double Pepperoni")
                print("Large Size")
                print("price")
       price <- print(689)
total_price <- (quantity * price) + total_price
                break
                } else

                if(order == 14) {
                flush.console()
    quantity <- as.integer(readline("Quantity: "))
                print("Shrimp Cocktail")
                print("Large Size")
                print("price")
       price <- print(689)
total_price <- (quantity * price) + total_price
                break
                } else

                if(order == 15) {
                flush.console()
    quantity <- as.integer(readline("Quantity: "))
                print("Meat Deluxe")
                print("Large Size")
                print("price")
       price <- print(689)
total_price <- (quantity * price) + total_price
                break
                }
    }
            print("If You Have Some Discount Code")
            print("Please Enter the Command: Y")
            print("If You Have Not Any Code")
            print("Please Enter the Command: N")
            flush.console()
question <- as.character(readline("Do You Hava Any Discount Code: "))

            if(question == "N") {
                    print(paste("🎉🎉🎉Total Price", total_price, "Bath🎉🎉🎉"))
            }

        while(question == "Y") {

                flush.console()
    discount <- readline("Discount Code: ")
                if(discount == "Rock") {
  reduction <- (total_price * 0.5)
                print(paste("🎉🎉🎉Total Price", reduction, "Bath🎉🎉🎉"))
                break
                }
            }


}
