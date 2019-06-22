# README


## Full Stack Challenge 2019

Project specification: [link](https://drive.google.com/file/d/1-gHa7VPbuXiPVAZ7ZVqYbdUfBPW2yZyS/view?usp=sharing)


# API 

* ULR Shortener API: [link](https://urlshortened.herokuapp.com/)


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
def shortenerUrlAlgorithm()
    uniqueIdLength = 3

    loop do
        self.shortUrl = @@URL + (Base64.encode64(self.originalUrl).split('')).sample(uniqueIdLength).join()

        if Url.findByShortUrl(self.shortUrl).nil?
             break
        else
             uniqueIdLength = uniqueIdLength + 1
        end
    end
end
```

* Check the **Gemfile** to verify the gems used

# Run local app in Ubuntu

* cd into application directory
* Execute:

* bundle install
* rails db:setup
* rails server

* Open browser and visit the link:  localhost:3000



# Curl commants examples


# top 100 of the most visited pages in the app 

- top GET method

```bash
$ curl https://urlshortened.herokuapp.com/top.json
```

# Receives the original URL of the page and returns a json with the characteristics and including the shortened URL 

- create POST method  

```bash
$ curl -X POST -d "original_url=https://www.youtube.com/" https://urlshortened.herokuapp.com/urls/create.json
```


# Shows the page consulted by means of the shortened URL, returns the page information 

- show GET method

```bash
$ curl https://urlshortened.herokuapp.com/Vje.json
```


# Display the newest page entered into the app 

- date GET method

```bash
$ curl https://urlshortened.herokuapp.com/date.json
```



*  If you want to verify these commands in the browser remove the word **curl** and **.json**


