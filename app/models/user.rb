class User < ApplicationRecord
  has_many :payments

  def lock_user
    self.lock = true
  end

  def unlock_user
    self.lock = false
  end
end
