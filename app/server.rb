class Bandaoke < Sinatra::Base
  register Sinatra::Partial
  set :root, File.join(File.dirname(__FILE__), '.')
  set :views, proc { File.join(root, 'views') }
  set :public_folder, proc { File.join(root, '../public') }
  set :partial_template_engine, :erb
  enable :partial_underscores

  configure do
    enable :sessions
  end

  Genius.access_token = ENV['GENIUS_TOKEN']

  get '/' do
    File.read("public/app/index.html")
  end

  get '/test' do
    File.read("public/app/index.html")
  end
end
