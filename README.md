# cstocks

With cstocks you can - 

- Explore Stock Offerings!
- Request Trades!
- Request Sales!
- Monitor Your Portfolio!

* All trades made by portfolio managers *

## Getting Started 

Clone the project. 

run 
```bundle install```

run 
```rails db:migrate```

run 
```rails db:seed```

run 
```bundle exec figaro install```

Navigate to https://www.alphavantage.co/support/#api-key to get a free API key!

Add API key to config/application.yml

```av_api_key: "* your api key *"```

run the server! 

```rails s```

Login w/ ```email: derek@test.com, password: 'password'``` to explore as a user
Login w/ ```email: kelley@test.com, password: 'password'``` to explore as a manager

## Built with 

Rails 6.0.3

## Contributing

Not accepting contributions at this time.

## Authors

* **Derek Cerretani** = [drkjc](https://github.com/drkjc)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details