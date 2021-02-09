module AvantUtils
  module ParamsStorage
    def stored_param(param_name)
      SessionStorage.new(params, session).store_or_retrieve(param_name)
    end

    class SessionStorage
      def initialize(params, session)
        @params = params
        @session = session
      end

      def store_or_retrieve(param_name)
        if clear_params?
          clear_params
        elsif params.include?(param_name)
          store_param(param_name)
        else
          retrieve_param(param_name)
        end
        params[param_name]
      end

      private

      attr_reader :params, :session

      def clear_params?
        params[:clear] == '1'
      end

      def clear_params
        params_storage.delete(params_storage_key)
        params.delete(:clear)
      end

      def store_param(param_name)
        storage = params_storage[params_storage_key] ||= {}
        param_value = extract_value_from_params(param_name)

        if param_value.present?
          storage[param_name.to_s] = param_value
        else
          storage.delete(param_name.to_s)
        end

        params_storage.delete(params_storage_key) if storage.blank?
      end

      def retrieve_param(param_name)
        param_value = params_storage.dig(params_storage_key, param_name.to_s)
        params[param_name] = param_value if param_value
      end

      def params_storage
        session[:params_storage] ||= {}
      end

      def params_storage_key
        params[:controller]
      end

      def extract_value_from_params(param_name)
        param_value = params[param_name]

        if param_value.is_a? ActionController::Parameters
          param_value = param_value.to_unsafe_h
          deep_clear_blank_values(param_value)
        end

        param_value
      end

      def deep_clear_blank_values(hash)
        hash.each do |key, value|
          deep_clear_blank_values(value) if value.is_a? Hash
          hash.delete(key) if value.blank?
        end
      end
    end
    private_constant :SessionStorage
  end
end
