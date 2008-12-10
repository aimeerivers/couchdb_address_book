 class Contact < BasicModel
  
  def full_name
    "#{firstname} #{lastname}"
  end

end
