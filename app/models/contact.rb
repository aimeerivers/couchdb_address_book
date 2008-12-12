class Contact < BasicModel
  
  def full_name
    "#{first_name} #{last_name}"
  end
  
  def label_lines
    returning Array.new do |arr|
      arr << full_name
      address.split("\r\n").each{|line| arr << line}
    end
  end

end
