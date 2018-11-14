activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

activate :sprockets

page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
  activate :relative_assets
  set :relative_links, true
end

activate :deploy do |deploy|
  deploy.build_before = true
  deploy.deploy_method = :git
end

require "sinatra"

class MySinatra < Sinatra::Base
  get "/" do
    "Hello World (Sinatra)"
  end
  get "/contact.html" do
    @name = params["name"]
    @email = params["email"]
    @message = params["message"]
    byebug
  end
end

map "/sinatra" do
  run MySinatra
end
