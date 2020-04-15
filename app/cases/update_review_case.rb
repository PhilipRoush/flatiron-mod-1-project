def update_review(user)
    prompt = TTY::Prompt.new

    list = list_all_reviews(user)
    if list.length > 0
        puts "Please select the review you would like to update:"
        puts "\n"

        num = gets.chomp

        while num.to_i > list.length || num.to_i == 0
            puts "Invalid choice, please try again."
            puts "\n"
            num = gets.chomp
        end

        puts "\n"
        updated_review_text = prompt.ask("Please provide a new review text:")

        puts "\n"
        updated_review_rating = prompt.slider('Please provide a review rating:', max: 10, step: 1)

        selected_review = list[num.to_i - 1]

        puts "\n"
        if prompt.yes?('Are you sure you want to update this review?')
            selected_review.update(review_text: updated_review_text, rating: updated_review_rating)
            puts "Your review has been updated!"
        else
            puts "Review has not been updated."
        end
    end
end