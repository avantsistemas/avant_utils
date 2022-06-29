# frozen_string_literal: true

module AvantUtils
  # Simplifies the construction of search forms.
  class SimpleSearch
    private_class_method :new

    def initialize(base_scope)
      define_scope(base_scope)
    end

    def self.scope(base_scope)
      new(base_scope)
    end

    def search(attributes)
      perform_search(attributes) if attributes.present?
      define_scope(redefine_scope, defined_by: :redefine_scope)
      self
    end

    # Returns the result of the search.
    def result
      @scope
    end

    def model_name
      @model_name ||= ActiveModel::Name.new(self.class, nil, 'search')
    end

    def to_key; end

    private

    attr_reader :scope

    def perform_search(attributes)
      attributes.each do |attribute_name, attribute_value|
        search_method = :"#{attribute_name}_search"
        if respond_to?(search_method, true)
          attribute_value = store_attribute(attribute_name, attribute_value)
          narrow_scope(search_method, attribute_value) if attribute_value.present?
        else
          Rails.logger.warn "#{self.class.name} does not implement method `#{search_method}`"
        end
      end
    end

    def store_attribute(attribute_name, attribute_value)
      attribute_value = attribute_value.strip
      setter_method = :"#{attribute_name}="
      variable_name = :"@#{attribute_name}"

      if respond_to?(setter_method, true)
        send(setter_method, attribute_value)
      else
        instance_variable_set(variable_name,
                              attribute_value)
      end

      instance_variable_get(variable_name)
    end

    def narrow_scope(search_method, attribute_value)
      new_scope = send(search_method, attribute_value)
      define_scope(new_scope, defined_by: search_method)
    end

    def define_scope(scope, defined_by: nil)
      unless scope.is_a?(ActiveRecord::Relation)
        message = ["Attempt to define search scope to `#{scope}`."]
        message << 'The scope must be an instance of ActiveRecord::Relation.'
        message << "Check the return of method `#{defined_by}` of class #{self.class}." if defined_by
        raise message.join(' ')
      end
      @scope = scope
    end

    # If necessary, subclasses can override this method
    # to redefine the scope based on search attributes.
    def redefine_scope
      @scope
    end
  end
end
