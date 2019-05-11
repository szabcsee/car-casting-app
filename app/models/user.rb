class User < ApplicationRecord
  def lock_user
    self.lock = true
  end

  def unlock_user
    self.lock = false
  end
end
