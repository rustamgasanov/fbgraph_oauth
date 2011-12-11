class ApplicationController < ActionController::Base
  protect_from_forgery


  protected

  def client
    @client ||= FBGraph::Client.new(:client_id => '214364498638052',
                                    :secret_id => '94cb5e8d5e0ce54d9086f3863972f950',
                                    :token => session[:access_token])
  end
end
