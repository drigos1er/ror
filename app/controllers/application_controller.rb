class ApplicationController < ActionController::Base
    before_action :set_locale #fixe la langue par défaut
    def default_url_options #surchage du helpers pour passer la langue locale entre les liens du navigateur
        { locale: I18n.locale } 
    end
    private 

      def set_locale
        I18n.locale= params[:locale] || I18n.default_locale # Prends la langue passé en paramètres ou la langue par défaut du système
        I18n.locale = locale
        cookies[:locale] = {value: locale, expires: 30.days}
      end

end
