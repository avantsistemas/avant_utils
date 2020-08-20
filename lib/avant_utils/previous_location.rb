module AvantUtils
  module PreviousLocation
    def self.included(base)
      base.helper_method :previous_location
    end

    # Se o parâmetro `spl` é igual a 1, este método armazena na sessão o caminho da localização anterior (obtido
    # via request.referer). Se `spl` não existir, este método limpa a informação anteriormente armazenada na sessão.
    # Se `spl` é igual a 0, este método não limpa a informação anteriormente armazenada na sessão.
    def store_previous_location
      SessionStorage.new(request, session).store_previous_location
    end

    # Obtém o caminho da localização armazenada anteriormente pelo método #store_previous_location ou retorna o caminho
    # default quando a informação anterior não existir. Este método deve ser utilizado sempre em conjunto com o método
    # store_previous_location. Exemplo, a ação `new` chama o método #store_previous_location e a ação create chama o
    # método #previous_location.
    def previous_location(default:, params: {})
      previous_location = SessionStorage.new(request, session).retrieve_previous_location

      previous_location ||= default

      Url.add_params previous_location, params
    end

    class SessionStorage
      def initialize(request, session)
        @request = request
        @session = session
      end

      def store_previous_location
        if store_previous_location?
          previous_locations[previous_locations_key] = find_previous_location
        elsif clear_previous_location?
          previous_locations.delete(previous_locations_key)
        end
      end

      def retrieve_previous_location
        previous_locations[previous_locations_key]
      end

      private

      attr_reader :request, :session

      def params
        request.params
      end

      def store_previous_location?
        params[:spl] == '1'
      end

      def clear_previous_location?
        params[:spl] != '0'
      end

      def find_previous_location
        referer = request.referer
        # optamos por guardar somente o path, sem parâmetros, para evitar
        # estourar o espaço de 4096 bytes disponível para o cookie da sessão
        URI(referer).path if referer
      end

      def previous_locations
        session[:previous_locations] ||= {}
      end

      def previous_locations_key
        params[:controller]
      end
    end
  end
end
