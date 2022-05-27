class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  


  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:carrier])
  end

  def acess_validation
    return if admin_signed_in?
    @carrier = Carrier.find(params[:id])
    redirect_to root_path, notice: 'Erro! Página não encontrada :(' unless current_user.acess_carrier?(@carrier)
  end


  def autenticate
    if user_signed_in?
      :authenticate_user!
    elsif admin_signed_in?
      :authenticate_admin!
    else
      redirect_to root_path, notice: 'Por favor, entre antes de navegar pelo site.'
  end
end

end
