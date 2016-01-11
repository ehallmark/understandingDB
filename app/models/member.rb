class Member < ActiveRecord::Base
  belongs_to :entry
  
  def hhmembergen
    ["", "Male", "Female"][read_attribute(:hhmembergen)||0]
  end
  
  def hhmemberrel
    ['', 'Spouse/Registered partner (e.g. husband, wife, registered partner)', 'Significant other (e.g. fianc\xe9e, boyfriend, girlfriend)', 'Parent (e.g. father, mother, stepfather, stepmother)', 'Child (e.g. son, daughter, stepson, stepdaughter, adopted child)', 'Sibling (e.g. brother, sister, stepbrother, stepsister)', 'Grandparent (e.g. grandfather, grandmother)', 'Grandchild (e.g. grandson, granddaughter)', 'Aunt/uncle', 'Other relative (e.g. cousin, nephew, niece, 2nd cousin, great nephew)', 'Family-in-law (e.g. father-in-law, sister-in-law)', 'Roommate/housemate (e.g. friend)', 'Financial (e.g. tenant, renter, landlord, employer, nanny)', 'Not related', 'Other'][read_attribute(:hhmemberrel)||0]
  end
  
  def self.headers
    [:hhmemberin, :hhmembergen, :hhmemberage, :hhmemberrel, :hhmemberuasid].collect{|s| s.to_s }
  end
end
