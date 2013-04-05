# Helpers for dates and times
module DateTimeHelper

  def time_picker(method_name, options = {:hour => 23, :step => 5})
    %W(
    #{select method_name, :hours, (0..options[:hour]).to_a.map { |i| i }, :default => 1}
    h
    #{select method_name, :minutes, (0..59).step(options[:step])}
    m)
  end
   
end
