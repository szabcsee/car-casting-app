class VehicleValidator < ActiveModel::Validator
  def validate(record)
    unless current_user.admin || record.user_id == current_user.id
      record.errors[:user_id] << 'You do not have rights to update this record.'
    end
  end
end