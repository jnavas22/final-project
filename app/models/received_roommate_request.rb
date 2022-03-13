# == Schema Information
#
# Table name: received_roommate_requests
#
#  id           :integer          not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  recipient_id :integer
#  sender_id    :integer
#
class ReceivedRoommateRequest < ApplicationRecord
end
