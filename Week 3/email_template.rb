#!/usr/local/bin/ruby
# NAME: Tegan Broderick
# COURSE: CS132A
# DATE: 20190215
# FILE: email_template.rb
# DESC: Email letterhead template, prints out contact information for companies

#Contact data for four companies
contact_data = [
  ['Company 1','123 Main Street', 'Anytown','Anystate', 88888,'444-444-4444','CompanyOne@companyone.com','https://company1.com'],
  ['Company 2','77 Market Street', 'San Francisco','California', 94111,'415-444-4444','Company2@company2.com','https://company2.com'],
  ['Company 3', '200 Larkin St', 'San Francisco', 'CA', 94112, '415-581-3615', 'tbroderick@asianart.org', 'https://www.asianart.org'],
  ['Company 4', '1234 Fillmore St', 'San Francisco', 'CA', 91234, '415-123-4567', 'name@fakecompany.com', 'http://www.fakecompanyscandalclub.com'],
]

#Email template
email_template = <<HERE
%s
%s
%s, %s %d
Tel: %s
Email: %s
URL: %s
----------------------------------
HERE

# Process the data one array at a time
contact_data.each do |arr|
  company_name = arr[0]
  address = arr[1]
  city = arr[2]
  state = arr[3]
  zip = arr[4]
  phone = arr[5]
  email = arr[6]
  url = arr[7]

  print email_template % [company_name, address, city, state, zip, phone, email, url]
end
