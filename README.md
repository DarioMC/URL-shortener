
## URL Shortener API

URL Shortener written in Ruby on Rails using CI with Heroku 

1.  [API](#API)

2.  [Ruby and rails version](#Ruby-and-rails-version)

3.  [ROR Installation steps](#ROR-Installation-steps)

4.  [Project features and design decisions](#Project-features-and-design-decisions)

5.  [Curl commants examples](#Curl-commants-examples)

6. [Future improvements](#Future-improvements)


### API 

* ULR Shortener API: [link](https://urlshortened.herokuapp.com/)


#### Ruby and rails version

* Ruby 2.6.3
* Rails 6.0.0

### ROR Installation steps 

* Linux Ubuntu 18.04:  [link](https://gorails.com/setup/ubuntu/18.04)


Clone the repo and cd into the folder:

```sh
$ git clone https://github.com/DarioMC/URL-shortener
$ cd URL-shortener
$ bundle install
$ rails db:setup
$ rails server
```
* Open browser and visit the link:  localhost:3000

* note: in case of errors with `bundle install` commant, comment in `Gemfile` the pg gem and try again.

### Project features and design decisions

### How to generate short code

* Takes the original URL of the page, uses base64 module.
* Concatenates to a string formed by 3 characters chosen at random from the data base.
* Then makes a Join them and verify if this new URL exists in the database.
* Base64 has the characters `+` and `/` that are not safe for a URL, 
* therefore, the `gsub` method will be used to replace these elements with `-` and `_` respectively.
* If it exists, recalculate the URL but take one more character.

```ruby
  def short_url_algorithm()
    
    unique_id_length = 3
    base64 =   Base64.encode64(self.original_url)
    join_url = (base64.split('')).sample(unique_id_length).join()
    safe_url = join_url.gsub("+", "-").gsub("/","_")
    
    loop do 
      self.short_url = @@URL + safe_url
      
      if Url.find_by_short_url(self.short_url).nil?
        break
      else
        unique_id_length = unique_id_length + 1
      end
      
    end
    
  end
```


- The front-end uses the [A scrolling navigation template](https://startbootstrap.com/templates/scrolling-nav/)



### Curl commants examples


### top 100 of the most visited pages in the app 

- top GET method

```bash
$ curl https://urlshortened.herokuapp.com/top.json
```

### Receives the original URL of the page and returns a json with the characteristics and including the shortened URL 

- create POST method  

```bash
$ curl -X POST -d "original_url=https://www.youtube.com/" https://urlshortened.herokuapp.com/urls/create.json
```


### Shows the page consulted by means of the shortened URL, returns the page information 

- show GET method

```bash
$ curl https://urlshortened.herokuapp.com/Vje.json
```


### Display the newest page entered into the app 

- date GET method

```bash
$ curl https://urlshortened.herokuapp.com/date.json
```

## Future improvements

- [ ] Improve the interface specifically when displaying the URLs with their respective information.

- [ ] Solve some problems with JavaScript imports in the page 

