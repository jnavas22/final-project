# == Schema Information
#
# Table name: roommate_requests
#
#  id           :integer          not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  recipient_id :integer
#  sender_id    :integer
#
class RoommateRequest < ApplicationRecord
  belongs_to(:sender, { :required => true, :class_name => "User", :foreign_key => "sender_id" })
  belongs_to(:recipient, { :required => true, :class_name => "User", :foreign_key => "recipient_id" })
end
