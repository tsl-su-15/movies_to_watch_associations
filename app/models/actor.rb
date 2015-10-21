class Actor < ActiveRecord::Base
  def roles
    Role.where(actor_id: id)
  end
end
