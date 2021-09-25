# A simple blog server

## Running the app

git clone the app and run bundle install

```
git clone git@github.com:bluethumbart/blog-server.git
cd blog-server
bundle install
shotgun -p 4000
```

An API server will be running on http://localhost:4000

# Routes

```
GET  /posts
POST /posts

GET  /posts/:id

GET  /posts/:id/comments
POST /posts/:id/comments
```
