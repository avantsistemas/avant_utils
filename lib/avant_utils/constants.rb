# frozen_string_literal: true

module AvantUtils
  module Constants
    EMAIL_FORMAT = /\A\s*([-\p{L}\d+._]{1,64})@((?:[-\p{L}\d]+\.)+\p{L}{2,})\s*\z/i.freeze
  end
end
