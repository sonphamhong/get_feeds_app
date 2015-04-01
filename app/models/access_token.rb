class AccessToken < ActiveRecord::Base
  attr_accessible :token, :user_id
  belongs_to :admin, :foreign_key => "user_id"
end
