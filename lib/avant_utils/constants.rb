# frozen_string_literal: true

module AvantUtils
  module Constants
    EMAIL_FORMAT = /\A\s*([-\p{L}\d+._]{1,64})@((?:[-\p{L}\d]+\.)+\p{L}{2,})\s*\z/i.freeze
    URL_FORMAT = %r(https?://(www\.)?[-a-zA-Z0-9@:%._+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_+.~#?&/=]*)).freeze
  end
end
