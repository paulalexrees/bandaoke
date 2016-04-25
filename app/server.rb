class Bandaoke < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '.')
  set :views, proc { File.join(root, 'views') }
  set :public_folder, proc { File.join(root, '../public') }
  get '/' do
    'Hello bandaoke!'
  end
end
