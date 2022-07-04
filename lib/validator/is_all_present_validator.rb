# 個人情報を全て入力・本人確認書類が確認できている方

class IsAllPresentValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
        if record.name && record.email && record.password && record.phone_number && record.last_name && record.first_name && record.postcode && record.country && record.prefecture && record.city && record.block && record.building && record.identification && record.birthday && record.is_phone_number_authenticated && record.is_identification_authenticated
            
            record.is_all_present = true
            byebug
        end
    end
end