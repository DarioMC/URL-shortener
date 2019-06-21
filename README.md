# README


## Full Stack Challenge 2019

Project specification: [link](https://drive.google.com/file/d/1-gHa7VPbuXiPVAZ7ZVqYbdUfBPW2yZyS/view?usp=sharing)


# API 


# Ruby and rails version

* Ruby 2.6.3
* Rails 6.0.0

# Installation steps 

* Linux Ubuntu 18.04:  [link](https://gorails.com/setup/ubuntu/18.04)


# Project features

# Used algorithm

* Takes the original URL of the page, uses base64 module.
* Concatenates to a string formed by 3 characters chosen at random from the data base.
* Then makes a Join them and verify if this new URL exists in the database.
* If it exists, recalculate the URL but take one more character

```ruby
def shortUrlAlgorithm()
    uniqueIdLength = 3

    loop do
        self.shortUrl = @@URL + (Base64.encode64(self.original_url).split('')).sample(uniqueIdLength).join()

        if Url.findByShortUrl(self.short_url).nil?
             break
        else
             uniqueIdLength = uniqueIdLength + 1
        end
    end
end
```

* Check the gem file to verify the gems used

# Run local app in Ubuntu

* cd into application directory
* Execute:

* bundle install
* rails db:setup
* rails server

* Open browser and visit the link:  localhost:3000




