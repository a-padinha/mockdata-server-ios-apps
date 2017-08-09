#
# Mock Server for iOS, March 2017
# Thin + Sinatra + daplie free SSL certificate
#
# Use README to install dependencies
#

require 'sinatra'
require "sinatra/multi_route"
require 'thin'

class MockServer < ::Thin::Backends::TcpServer
  def initialize(host, port, options)
    super(host, port)
    end
end

configure do
  set :environment, :production
  set :bind, '127.0.0.1'
  set :port, 8443
  set :server, "thin"
  class << settings
    def server_settings
      {
        :backend          => MockServer,
        #For SSL cert uncomment private_key_file and cert_chain_file
        #:private_key_file => File.dirname(__FILE__) + '/cert/privkey.pem',
        #:cert_chain_file  => File.dirname(__FILE__) + '/cert/cert.pem',
        :verify_peer      => false
      }
    end
  end
end

set :public_folder, 'mock'

# Exit 'correctly'
get '/exit' do
  Process.kill('TERM', Process.pid)
end

# Debug Example call
get '/' do
  "Hello, SSL."
end

#Generic call method for mock calls under mock/ folder
route :get, :post, "/*" do
  a = request.url.split('?').first
  c = File.basename("#{a}", ".*")
  redirect "/"+"#{c}"+".json"
end
