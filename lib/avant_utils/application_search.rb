module AvantUtils
  # Facilita a construção de formulários de pesquisa/filtro.
  class ApplicationSearch
    private_class_method :new

    def initialize(scope)
      define_scope(scope)
      @empty = true
    end

    def self.scope(scope)
      new(scope)
    end

    def search(attributes)
      narrow_search(attributes) if attributes.present?
      define_scope(redefine_scope, by: :redefine_scope)
      self
    end

    def result
      @scope
    end

    def empty?
      @empty
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

    # Subclasses podem sobreescrever essa classe para redefinir
    # o escopo da pesquisa com base nos atributos de pesquisa.
    def redefine_scope
      @scope
    end

    def narrow_search(attributes)
      attributes.each do |name, value|
        search_method = "#{name}_search"
        if respond_to?(search_method, true)
          value = value.strip
          instance_variable_set("@#{name}", value)
          narrow_scope(search_method, value) if value.present?
        else
          Rails.logger.warn "#{self.class.name} não possui método `#{search_method}`"
        end
      end
    end

    def narrow_scope(search_method, value)
      new_scope = send(search_method, value)
      define_scope(new_scope, by: search_method)
      @empty = false
    end

    def define_scope(scope, by: nil)
      unless scope.is_a?(ActiveRecord::Relation)
        message = ["Tentativa de definição do escopo para #{scope || 'nil'}."]
        message << ['O escopo precisa ser um objeto ActiveRecord::Relation.']
        message << ["Verifique o método `#{by}` de #{self.class}."] if by
        raise message.join(' ')
      end
      @scope = scope
    end
  end
end
