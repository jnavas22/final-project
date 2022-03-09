# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  first_name      :string
#  from_city       :string
#  gender          :string
#  last_name       :string
#  password_digest :string
#  to_city         :string
#  university      :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  validates :university, :presence => true
  validates :gender, :presence => true
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  has_secure_password

  has_many(:roommate_inquiries, { :class_name => "RoommateRequest", :foreign_key => "sender_id", :dependent => :destroy })
  has_many(:roommate_requests, { :class_name => "RoommateRequest", :foreign_key => "recipient_id", :dependent => :destroy })


end
