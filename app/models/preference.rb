# == Schema Information
#
# Table name: preferences
#
#  id              :integer          not null, primary key
#  air_conditioner :boolean
#  bathroom_num    :integer
#  doorman         :boolean
#  elevator        :boolean
#  laundry         :boolean
#  max_rent        :integer
#  person_type     :string
#  pets            :boolean
#  roommate_num    :integer
#  smoker          :boolean
#  transportation  :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer
#
class Preference < ApplicationRecord
end
