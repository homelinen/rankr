# Helpers for dates and times
module MatchesHelper

  def time_picker(method_name, options = {})
    options[:hour] ||= 23
    options[:step] ||= 5

    %Q(
    #{select method_name, :hours, (0..options[:hour].to_i).to_a.map { |i| i }, :default => 1}
    h
    #{select method_name, :minutes, (0..59).step(options[:step].to_i)}
    m).html_safe
  end
   
end
