api: cd ./blog-server/ && DATABASE_URL=postgres://cksqoriqcuxqpk:70071090f0365114366d6eab9677ace4d368318e59d99b87f5dc03d2f2fe8b5e@ec2-52-206-193-199.compute-1.amazonaws.com:5432/d58fmupnh1hp3r bundle exec puma -t ${PUMA_MIN_THREADS:-8}:${PUMA_MAX_THREADS:-12} -w ${PUMA_WORKERS:-2} -e development -b tcp://localhost:4000 config.ru 
web: bundle exec rails s -e production
