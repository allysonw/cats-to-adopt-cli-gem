# Specifications for the CLI Assessment

Specs:
- [X] Have a CLI for interfacing with the application

The CLI shows a list of current cats available for adoption at the NKLA website. It asks the user which cat they would like more info on and also allows them to list the cats again or exit the program. The CLI validates the user input.

- [X] Pull data from an external source

I used Nokogiri & Open URI to scrape data from the NKLA index site for adoptable cats as well as each cat's profile page. I used VCR and WebMock to cache the results of my HTTP requests during testing as to not bombard the NKLA site with requests.

- [X] Implement both list and detail views

The user selects a cat number which then shows them additional information about the cat scraped from the cat's profile page.
