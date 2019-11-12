# == Schema Information
#
# Table name: companies
#
#  id               :integer          not null, primary key
#  billing_address1 :string
#  billing_address2 :string
#  city             :string
#  company_name     :string
#  company_number   :string
#  company_type     :string
#  tax_number       :string
#  vat              :boolean
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_profile_id  :integer
#
# Indexes
#
#  index_companies_on_user_profile_id  (user_profile_id)
#

class Company < ApplicationRecord
  belongs_to :user_profile
end
