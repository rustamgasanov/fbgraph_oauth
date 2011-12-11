class FbOauthController < ApplicationController
  def start
   redirect_to client.authorization.authorize_url(
                   :redirect_uri => "http://#{request.env['HTTP_HOST']}/fbauth/callback/",
                   :client_id => '214364498638052',
                   :scope => '') #email
  end

  def callback
    @access_token = client.authorization.process_callback(params[:code],
                    :redirect_uri => "http://#{request.env['HTTP_HOST']}/fbauth/callback/")
    session[:access_token] = @access_token
    @fb_user = client.selection.me.info!
  end

  def info
    @fb_user = client.selection.me.info!
    @fb_user_friends = client.selection.me.friends.info!
  end

  def logout
    session[:access_token] = ""
  end
end
