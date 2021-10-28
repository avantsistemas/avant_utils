module AvantUtils
  class Phone
    def self.brazilian_format?(phone)
      /\A\d{2}\s\d{4,5}-\d{4}\z/.match?(phone.to_s)
    end

    def self.brazilian_mobile?(phone)
      match_data = phone.to_s.match(/(\d{4,5}-\d{4})/)

      return false unless match_data

      first_number = match_data[0][0]
      %w[9 8 7 6].include? first_number
    end
  end
end
