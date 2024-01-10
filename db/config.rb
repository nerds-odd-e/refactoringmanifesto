def log(msg)
    open("application.log", "a+") do |f|
      f << "[CONFIG] " << msg << "\n"
    end
end

configure :production do
  log "PRODUCTION"
  DataMapper.setup(:default, ENV['REFACTORINGMANIFESTO_DB_URL'])
end

configure :test do
  DataMapper.setup(:default, "sqlite3::memory:")
  DataMapper.auto_migrate!
end

configure :development do
  log "DEVELOPMENT"
  DataMapper.setup(:default, "postgres://127.0.0.1/refactoringmanifesto")
  DataMapper.auto_migrate!
end
