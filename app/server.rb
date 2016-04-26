class Bandaoke < Sinatra::Base
  register Sinatra::Partial
  set :root, File.join(File.dirname(__FILE__), '.')
  set :views, proc { File.join(root, 'views') }
  set :public_folder, proc { File.join(root, '../public') }
  set :partial_template_engine, :erb
  enable :partial_underscores

  get '/' do
    redirect 'songs/'
  end
end
