module AvantUtils
  class ApplicationSearch
    private_class_method :new

    def initialize(scope)
      @scope = scope
      @empty = true
    end

    def self.scope(scope = default_scope)
      new(scope)
    end

    def self.default_scope
      raise NotImplementedError, "default_scope não implementado em #{name}"
    end

    def search(attributes)
      narrow_search(attributes) if attributes.present?
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
      @scope = send(search_method, value)
      @empty = false
    end
  end
end
