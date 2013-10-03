require_relative 'source'
require 'pry'

def valid_ip_addresses(check) 
  check.scan(/\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b/)
end 

def valid_mit_ip_addresses(check)
  check.scan(/18\.\d{1,3}\.\d{1,3}\.\d{1,3}\b/)
end

def non_mit_ip_addresses(check) 
   (check.scan(/\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b/)) - (check.scan(/18\.\d{1,3}\.\d{1,3}\.\d{1,3}\b/)) 

   # a = ip - mit 
   # a 
end 

def valid_phone_numbers(check)
  # check.scan(/((\d-)?(\d{3}-)?([^1]\d{2}-\d{4}))/)
  # check.scan(/((\d-)?(\d{3}-)?([^1]\d{2}-\d{4}))/)
   check.scan(/[2-9]{1}\d{0,2}\-\d{0,3}\-?\d{4}/).uniq
end

def area_codes(check) 
  # check.scan(/\b{3}\d{3}\b{3}/)
  check.scan(/\b[2-9]{1}\d{0,2}\-\d{0,3}\-\d{4}\b/).uniq.map{|x| x[0..2]}
end

def email_addresses(check)
  # (check.scan(/((\w){1,10}@\w{1,10}.com)/)).flatten 
  check.scan(/(([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,}))/).map(&:first)

end


def zip_codes(check) 
  a = check.scan(/\b\d{5}(?:[-\s]\d{4})?\b{5}/)
end

def hex_colors(check)
a = check.scan(/(#(?:[0-9a-fA-F]{3}){1,2})/).flatten
a.map do |hex| hex.slice!(0)
  end
  return a 
end

ip = valid_ip_addresses(@source_text)
zip = zip_codes(@source_text)
hex = hex_colors(@source_text)
mit = valid_mit_ip_addresses(@source_text)
non = non_mit_ip_addresses(@source_text) 

area = area_codes(@source_text)
email = email_addresses(@source_text)
phone = valid_phone_numbers(@source_text)





