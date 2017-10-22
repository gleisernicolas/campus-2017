# == Schema Information
#
# Table name: properties
#
#  id                :integer          not null, primary key
#  title             :string
#  location          :string
#  area              :integer
#  description       :string
#  daily_rate        :decimal(, )
#  rooms             :integer
#  minimum_rent_days :integer
#  maximun_rent_days :integer
#  photo             :string
#  maximum_occupancy :integer
#  usage_rules       :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  property_type_id  :integer
#

class Property < ApplicationRecord
  belongs_to :property_type
end
