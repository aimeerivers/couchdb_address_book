 class Contact < BasicModel
  
  def full_name
    "#{first_name} #{last_name}"
  end

end
