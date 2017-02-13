class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :redirect_to_login_if_required

  def redirect_to_login_if_required
      # TODO[@jrmykolyn]
      # - decouple logic/condition from Devise controller.
      if !current_user && ( params[ :controller ] != 'devise/sessions' )
          redirect_to( login_path )
      end
  end
end
