# README

### Heroku
https://blooming-gorge-63212.herokuapp.com/posts

### Run locally
```
  foreman start -f Procfile.dev
```

* Ruby version
```
  2.5.8
```

* Database creation
```
  cd blog-server
  rake db:migrate
```

* How to run the test suite
```
  rspec
```

### Technical debts
> https://github.com/jm-maniego/blog-untitled-1/blob/main/app/javascript/stylesheets/tailwind.config.js
- put back the purge
- replace `./**/*.html.erb` with `./**/*.html.slim`

> https://github.com/jm-maniego/blog-untitled-1/blob/main/Procfile
- remove `DATABASE_URL` secret
