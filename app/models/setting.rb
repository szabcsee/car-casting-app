# == Schema Information
#
# Table name: settings
#
#  id                    :integer          not null, primary key
#  new_user_registration :boolean
#  theme                 :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class Setting < ApplicationRecord
end
