class String
  def to_snake_case
    self.gsub('::', '/')  # Home::PagesController => Home/PagesController
    .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2') # HOMEController => home_controller
    .gsub(/([a-z\d])([A-Z])/, '\1_\2') # FO86OBar => fo86_o_bar
    .tr('-', '_')
    .downcase
  end

  def to_camel_case
    # if does not have _ and is in the format of Azzz
    return self if self !~ /_/ && self =~ /[A-Z]+.*/

    split('_').map{ |str| str.capitalize }.join # my_str MyStr
  end
end