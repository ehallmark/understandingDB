class Entry < ActiveRecord::Base
  has_many :members
  accepts_nested_attributes_for :members
  
  def sampletype
    ["", "Nationally Representative Sample", "Native Americans", "Added Member", "Native Americans (S2)","LA County", "ADDED MEMBER - LA County"][read_attribute(:sampletype)||0]
  end
  def batch
    ["", "ASDE 2014/01 Nat.Rep.", "ASDE 2014/01 Native Am.", "ASDE 2014/11 Native Am.", "LA County 2015/05 List Sample", "MSG 2015/07 Nat.Rep."][read_attribute(:batch)||0]
  end
  def language
    ["", "English", "Spanish"][read_attribute(:language)||0]
  end
  def agerange
    ["", "18-29","30-39","40-49","50-59","60-69","70-79","80-89","90+"][read_attribute(:agerange)||0]
  end
  
  def stateborn
    ["","Alaska (AK)", "Alabama (AL)", "Arizona (AZ)", "Arkansas (AR)", "California (CA)", "Colorado (CO)", "Connecticut (CT)", "Delaware (DE)", "Florida (FL)", "Georgia (GA)", "Hawaii (HI)", "Idaho (ID)", "Illinois (IL)", "Indiana (IN)", "Iowa (IA)", "Kansas (KS)", "Kentucky (KY)", "Louisiana (LA)", "Maine (ME)", "Maryland (MD)", "Massachusetts (MA)", "Michigan (MI)", "Minnesota (MN)", "Mississippi (MS)", "Missouri (MO)", "Montana (MT)", "Nebraska (NE)", "Nevada (NV)", "New Hampshire (NH)", "New Jersey (NJ)", "New Mexico (NM)", "New York (NY)", "North Carolina (NC)", "North Dakota (ND)", "Ohio (OH)", "Oklahoma (OK)", "Oregon (OR)", "Pennsylvania (PA)", "Rhode Island (RI)", "South Carolina (SC)", "South Dakota (SD)", "Tennessee (TN)", "Texas (TX)", "Utah (UT)", "Vermont (VT)", "Virginia (VA)", "Washington (WA)", "West Virginia (WV)", "Wisconsin (WI)", "Wyoming (WY)", "Washington D.C.", "Puerto Rico"][read_attribute(:stateborn)||0]
  end
  
  def statereside
    ["","Alaska (AK)", "Alabama (AL)", "Arizona (AZ)", "Arkansas (AR)", "California (CA)", "Colorado (CO)", "Connecticut (CT)", "Delaware (DE)", "Florida (FL)", "Georgia (GA)", "Hawaii (HI)", "Idaho (ID)", "Illinois (IL)", "Indiana (IN)", "Iowa (IA)", "Kansas (KS)", "Kentucky (KY)", "Louisiana (LA)", "Maine (ME)", "Maryland (MD)", "Massachusetts (MA)", "Michigan (MI)", "Minnesota (MN)", "Mississippi (MS)", "Missouri (MO)", "Montana (MT)", "Nebraska (NE)", "Nevada (NV)", "New Hampshire (NH)", "New Jersey (NJ)", "New Mexico (NM)", "New York (NY)", "North Carolina (NC)", "North Dakota (ND)", "Ohio (OH)", "Oklahoma (OK)", "Oregon (OR)", "Pennsylvania (PA)", "Rhode Island (RI)", "South Carolina (SC)", "South Dakota (SD)", "Tennessee (TN)", "Texas (TX)", "Utah (UT)", "Vermont (VT)", "Virginia (VA)", "Washington (WA)", "West Virginia (WV)", "Wisconsin (WI)", "Wyoming (WY)", "Washington D.C.", "Puerto Rico"][read_attribute(:statereside)||0]
  end
  
  def countryborn
    return "Other" if read_attribute(:countryborn)==300 #special case
    ['', 'Afghanistan', 'Aland Islands', 'Albania', 'Algeria', 'American Samoa', 'Andorra', 'Angola', 'Anguilla', 'Antarctica', 'Antigua And Barbuda', 'Argentina', 'Armenia', 'Aruba', 'Australia', 'Austria', 'Azerbaijan', 'Bahamas', 'Bahrain', 'Bangladesh', 'Barbados', 'Belarus', 'Belgium', 'Belize', 'Benin', 'Bermuda', 'Bhutan', 'Bolivia', 'Bosnia And Herzegovina', 'Botswana', 'Bouvet Island', 'Brazil', 'British Indian Ocean Territory', 'Brunei Darussalam', 'Bulgaria', 'Burkina Faso', 'Burundi', 'Cambodia', 'Cameroon', 'Canada', 'Cape Verde', 'Cayman Islands', 'Central African Republic', 'Chad', 'Chile', 'China', 'Christmas Island', 'Cocos (Keeling) Islands', 'Colombia', 'Comoros', 'Congo', 'Congo, The Democratic Republic Of The', 'Cook Islands', 'Costa Rica', "Cote D'ivoire", 'Croatia', 'Cuba', 'Cyprus', 'Czech Republic', 'Denmark', 'Djibouti', 'Dominica', 'Dominican Republic', 'Ecuador', 'Egypt', 'El Salvador', 'Equatorial Guinea', 'Eritrea', 'Estonia', 'Ethiopia', 'Falkland Islands (Malvinas)', 'Faroe Islands', 'Fiji', 'Finland', 'France', 'French Guiana', 'French Polynesia', 'French Southern Territories', 'Gabon', 'Gambia', 'Georgia', 'Germany', 'Ghana', 'Gibraltar', 'Greece', 'Greenland', 'Grenada', 'Guadeloupe', 'Guam', 'Guatemala', 'Guernsey', 'Guinea', 'Guinea-bissau', 'Guyana', 'Haiti', 'Heard Island And Mcdonald Islands', 'Holy See (Vatican City State)', 'Honduras', 'Hong Kong', 'Hungary', 'Iceland', 'India', 'Indonesia', 'Iran, Islamic Republic Of', 'Iraq', 'Ireland', 'Isle Of Man', 'Israel', 'Italy', 'Jamaica', 'Japan', 'Jersey', 'Jordan', 'Kazakhstan', 'Kenya', 'Kiribati', "Korea, Democratic People's Republic Of", 'Korea, Republic Of', 'Kuwait', 'Kyrgyzstan', "Lao People's Democratic Republic (Laos)", 'Latvia', 'Lebanon', 'Lesotho', 'Liberia', 'Libyan Arab Jamahiriya', 'Liechtenstein', 'Lithuania', 'Luxembourg', 'Macao', 'Macedonia, The Former Yugoslav Republic Of', 'Madagascar', 'Malawi', 'Malaysia', 'Maldives', 'Mali', 'Malta', 'Marshall Islands', 'Martinique', 'Mauritania', 'Mauritius', 'Mayotte', 'Mexico', 'Micronesia, Federated States Of', 'Moldova, Republic Of', 'Monaco', 'Mongolia', 'Montenegro', 'Montserrat', 'Morocco', 'Mozambique', 'Myanmar', 'Namibia', 'Nauru', 'Nepal', 'Netherlands', 'Netherlands Antilles', 'New Caledonia', 'New Zealand', 'Nicaragua', 'Niger', 'Nigeria', 'Niue', 'Norfolk Island', 'Northern Mariana Islands', 'Norway', 'Oman', 'Pakistan', 'Palau', 'Palestinian Territory, Occupied', 'Panama', 'Papua New Guinea', 'Paraguay', 'Peru', 'Philippines', 'Pitcairn', 'Poland', 'Portugal', 'Puerto Rico', 'Qatar', 'Reunion', 'Romania', 'Russian Federation', 'Rwanda', 'Saint Helena', 'Saint Kitts And Nevis', 'Saint Lucia', 'Saint Pierre And Miquelon', 'Saint Vincent And The Grenadines', 'Samoa', 'San Marino', 'Sao Tome And Principe', 'Saudi Arabia', 'Senegal', 'Serbia', 'Seychelles', 'Sierra Leone', 'Singapore', 'Slovakia', 'Slovenia', 'Solomon Islands', 'Somalia', 'South Africa', 'South Georgia And The South Sandwich Islands', 'Spain', 'Sri Lanka', 'Sudan', 'Suriname', 'Svalbard And Jan Mayen', 'Swaziland', 'Sweden', 'Switzerland', 'Syrian Arab Republic', 'Taiwan, Republic Of China', 'Tajikistan', 'Tanzania, United Republic Of', 'Thailand', 'Timor-leste', 'Togo', 'Tokelau', 'Tonga', 'Trinidad And Tobago', 'Tunisia', 'Turkey', 'Turkmenistan', 'Turks And Caicos Islands', 'Tuvalu', 'Uganda', 'Ukraine', 'United Arab Emirates', 'United Kingdom', 'United States', 'United States Minor Outlying Islands', 'Uruguay', 'Uzbekistan', 'Vanuatu', 'Venezuela', 'Viet Nam', 'Virgin Islands, British', 'Virgin Islands, U.S.', 'Wallis And Futuna', 'Western Sahara', 'Yemen', 'Zambia', 'Zimbabwe', 'Other'][read_attribute(:countryborn)||0]
  end
  
  def cs_001
    ["", "Very interesting", "Interesting", "Neither interesting nor uninteresting", "Uninteresting", "Very uninteresting"][read_attribute(:cs_001)||0]
  end
  
  def maritalstatus
    ["","Married (Spouse lives with me)", "Married (Spouse lives elsewhere)", "Separated", "Divorced", "Widowed", "Never Married"][read_attribute(:maritalstatus)||0]
  end
    
  def education
    ["", "Less than 1st grade", "Up to 4th grade", "5th or 6th grade", "7th or 8th grade", "9th grade", "10th grade", "11th grade", "12th grade-no diploma", "High school graduate or GED", "Some college-no degree", "Assoc. college degree-occ/voc program", "Assoc. college degree-academic program", "Bachelor's degree", "Master's degree", "Professional school degree", "Doctorate degree"][read_attribute(:education)||0]
  end
  
  def race
    ["", "White", "Black or African American", "American Indian or Alaska Native", "Asian", "Native Hawaiian or Other Pacific Islander"][read_attribute(:race)||0]
  end
  
  def workfullpart
    ["", "Full-time", "Part-time"][read_attribute(:workfullpart)||0]
  end

  def hhincome
    ['', 'Less than $5,000', '5,000 to 7,499', '7,500 to 9,999', '10,000 to 12,499', '12,500 to 14,999', '15,000 to 19,999', '20,000 to 24,999', '25,000 to 29,999', '30,000 to 34,999', '35,000 to 39,999', '40,000 to 49,999', '50,000 to 59,999', '60,000 to 74,999', '75,000 to 99,999', '100,000 to 149,999', '150,000 or more'][read_attribute(:hhincome)||0]
  end
  
  def gender
    ["", "Male", "Female"][read_attribute(:gender)||0]
  end
  
  def laborstatus
    ["", "Currently working", "On sick or other leave", "Unemployed - on layoff", "Unemployed - looking", "Retired", "Disabled", "Other"][read_attribute(:laborstatus)||0]
  end
  
  def employmenttype
    ["", "Government", "Private-for-profit company", "Non-profit organization including tax exempt and charitable organizations", "Self-employed"][read_attribute(:employmenttype)||0]
  end
  
  def start_date
    read_attribute(:start_date) || (Date.new(self.start_year,self.start_month,self.start_day) if self.start_year.present? and self.start_month.present? and self.start_day.present?)
  end
  
  def end_date
    read_attribute(:end_date) || (Date.new(self.end_year,self.end_month,self.end_day) if self.end_year.present? and self.end_month.present? and self.end_day.present?)
  end
  
  def self.headers
    [:uasid, :primary_respondent, :uashhid, :survhhid, :uasmembers, :sampletype, :batch, :language, :start_year, :start_month, :start_day, :start_hour, :start_min, :start_sec, :end_year, :end_month, :end_day, :end_hour, :end_min, :end_sec, :cs_001, :gender, :dateofbirth_day, :dateofbirth_month, :dateofbirth_year, :age, :agerange, :citizenus, :bornus, :stateborn, :countryborn, :countryborn_other, :statereside, :maritalstatus, :livewithpartner, :education, :hisplatino, :white, :black, :nativeamer, :asian, :pacific, :race, :working, :sick_leave, :unemp_layoff, :unemp_look, :retired, :disabled, :lf_other, :laborstatus, :employmenttype, :workfullpart, :hourswork, :hhincome, :anyhhmember, :hhmembernumber, :lastmyhh_date, :end_date, :start_date].collect{|s| s.to_s }
  end
  
  
end
