class Student < ActiveRecord::Base
  def to_s
    self.first_name + " " + self.last_name
  end

  def active_status
    if self.active == false
      "inactive"
    elsif self.active == true
      "active"
    end
  end

  def activate_student
    if self.active?
      self.update_attribute(:active, false)
    else
      self.update_attribute(:active, true)
    end
  end
end