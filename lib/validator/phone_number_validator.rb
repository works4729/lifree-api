class PhoneNumberValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
        format = /\A0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1})[-)]?\d{4}\z|\A0[5789]0[-]?\d{4}[-]?\d{4}\z/
        record.errors.add(attribute, :invalid) unless format =~ value
        
        record.errors.add(attribute, :taken) if record.phone_number_activated?
    end
end