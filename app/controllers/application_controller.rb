class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :set_locale

  def set_locale
    I18n.locale = 'pt-BR'
  end
  
  protected
    def authenticate_user!
      if user_signed_in?
        super
      else
        redirect_to new_user_session_path, :notice => 'Por favor, faça login na aplicação antes de continuar.'
        ## if you want render 404 page
        ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
      end
    end
end
