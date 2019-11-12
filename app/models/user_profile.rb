# == Schema Information
#
# Table name: user_profiles
#
#  id         :integer          not null, primary key
#  address1   :string
#  address2   :string
#  city       :string
#  post_code  :string
#  telephone  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_user_profiles_on_user_id  (user_id)
#

class UserProfile < ApplicationRecord
  belongs_to :user
end
