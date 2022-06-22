# frozen_string_literal: true

module AvantUtils
  # Facilita a construção de formulários de pesquisa/filtro.
  class ApplicationSearch
    private_class_method :new

    def initialize(scope)
      define_scope(scope)
    end

    def self.scope(scope)
      new(scope)
    end

    def search(attributes)
      narrow_search(attributes) if attributes.present?
      define_scope(redefine_scope, defined_by_method: :redefine_scope)
      self
    end

    def result
      @scope
    end

    def model_name
      @model_name ||= ActiveModel::Name.new(self.class, nil, 'search')
    end

    def to_key; end

    def persisted?
      true
    end

    private

    attr_reader :scope

    # Subclasses podem sobreescrever esse método para redefinir
    # o escopo da pesquisa com base nos atributos de pesquisa.
    def redefine_scope
      @scope
    end

    def narrow_search(attributes)
      attributes.each do |name, value|
        search_method = :"#{name}_search"
        if respond_to?(search_method, true)
          value = store_attribute(name, value)
          narrow_scope(search_method, value) if value.present?
        else
          Rails.logger.warn "#{self.class.name} não possui método `#{search_method}`"
        end
      end
    end

    def store_attribute(name, value)
      value = value.strip
      setter_method = :"#{name}="
      variable_name = "@#{name}"

      if respond_to?(setter_method, true)
        send(setter_method, value)
      else
        instance_variable_set(variable_name, value)
      end

      instance_variable_get(variable_name)
    end

    def narrow_scope(search_method, value)
      new_scope = send(search_method, value)
      define_scope(new_scope, defined_by_method: search_method)
    end

    def define_scope(scope, defined_by_method: nil)
      unless scope.is_a?(ActiveRecord::Relation)
        message = ["Tentativa de definição do escopo para #{scope.presence || 'blank'}."]
        message << 'O escopo precisa ser um objeto ActiveRecord::Relation.'
        message << "Verifique o retorno do método `#{defined_by_method}` de #{self.class}." if defined_by_method
        raise message.join(' ')
      end
      @scope = scope
    end
  end
end
