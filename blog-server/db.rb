require_relative "./config/env"
require "sequel"

# "postgres://postgres:12345@localhost:5432/blog_api"
DB = Sequel.connect(ENV["DATABASE_URL"])

DB.extension(:pg_streaming)
