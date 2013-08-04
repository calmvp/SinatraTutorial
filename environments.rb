configure :development do
  set :database, 'sqlite:///dev.db'
end

configure :production do
  db = URI.parse(ENV['DATABASE_URL'] || 'postgres:///localhost/mydb')

  ActiveRecord::Base.establish_connection(
    :adapter    => db.schem == 'postgres' ? 'postgresql' : db.scheme,
    :host       => db.host,
    :username   => db.user,
    :password   => db.user,
    :database   => db.path[1..-1],
    :encoding   => 'utf8'

  )
end

