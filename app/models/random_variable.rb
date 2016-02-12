class RandomVariable < ActiveRecord::Base
  require 'rinruby'
  validate :valid_distribution
  validates_uniqueness_of :name
  validates_presence_of [:name, :n_count]
  has_one :child_variable, :class_name=>"RandomVariable", :foreign_key=>:associated_variable_id
  belongs_to :associated_variable, :class_name=>"RandomVariable"
  
  before_validation do
    self.add_values()
  end
  
  def self.distributions
    ["Normal", "1.5-(2X/Y)", "Cauchy", "Chi-Squared", "T", "F", "Uniform", "Binomial", "Exponential", "Poisson"]
  end
  
  
  def add_values
    self.values = random_array_of_values()
  end
  
  def random_array_of_values() 
    n = self.n_count
    return [] unless n.present?
    if(self.associated_variable.present?)
      x = self.associated_variable
      nums = 1.upto(n).collect{
        x.random_array_of_values()
      }
      return nums.collect{|num| num.sum/x.n_count }
    elsif self.distribution == "1.5-(2X/Y)"
      norm1 = RandomVariable.new(:distribution=>"Normal",:param1=>0,:param2=>1,:n_count=>self.n_count) 
      norm2 = RandomVariable.new(:distribution=>"Normal",:param1=>0,:param2=>1,:n_count=>self.n_count) 
      x = norm1.random_array_of_values()
      y = norm2.random_array_of_values()
      return 0.upto(self.n_count-1).collect{|i| 1.5-2*x[i]/y[i]}
    else
      R.numbers = []
      R.eval("numbers <- #{self.get_R_distribution()}")
      return R.numbers
    end
  end
  
  def theoretical_probability(value,greater_than)
    n = self.n_count
    return 0 unless n.present? and value.present?
    if(self.associated_variable.present?)
      x = self.associated_variable
      nums = 1.upto(n).collect{
        x.theoretical_probability()
      }
      return nums.collect{|num| num.sum/x.n_count }
    elsif self.distribution == "1.5-(2X/Y)"
      cauchy = RandomVariable.new(:distribution=>"Cauchy",:param1=>0,:param2=>1,:n_count=>self.n_count) 
      greater_than = !greater_than
      R.eval(%Q[number = #{cauchy.get_R_probability(greater_than,0.75-value.to_f/2)}])
      return R.number
    else
      R.eval("number = #{self.get_R_probability(greater_than,value)}")
      return R.number
    end
  end
  
  def distribution_param_count
    return case self.distribution
      when "Normal" then 2
      when "Chi-Squared" then 1
      when "Custom Chi-Squared" then 3
      when "T" then 1
      when "F" then 2
      when "Binomial" then 2
      when "Uniform" then 2
      when "Exponential" then 1
      when "Poisson" then 1
      when "Cauchy" then 2
      else
        return 0
    end
  end
  
  def sample_mean 
    R.values = self.values
    R.eval("num = mean(values)")
    return R.num.to_f
  end
  
  def sample_median
    R.values = self.values
    R.eval("num = median(values)")
    return R.num.to_f
  end
  
  def sample_mode
    R.eval(%Q{
      Mode <- function(x) {
        ux <- unique(x)
        ux[which.max(tabulate(match(x, ux)))]
      }
     })
    R.values = self.values
    R.eval("num = Mode(values)")
    return R.num.to_f
  end
  
  def plot(filename,min,max,scale,freq)
    return unless filename.present?
    freq == "yes" ? freq = "TRUE" : freq = "FALSE"
    min = self.values.min.floor-1 unless min.present?
    max = self.values.max.ceil+1 unless max.present?
    R.image_path = Rails.root.join("app", "assets", "images", filename).to_s
    breaks = []
    increment = min
    while(increment<=max) do
      breaks.push(increment)
      increment+=scale
    end
    breaks.push(increment)
    R.breakpoints = breaks
    R.numbers = self.values
    R.eval("png(filename=image_path)")
    R.min_n = min
    R.max_n = max
    R.chart_title = "Histogram for #{self.name}"
    R.x_label = "Values"
    R.range_x=[min,max]
    R.eval("h = hist(numbers, breaks=breakpoints, freq=#{freq}, xlab=x_label, main=chart_title, xlim=range_x, panel.first=grid())")
    R.eval("dev.off()")
  end
  
  def sample_variance
    R.values = self.values
    R.eval("num = var(values)")
    return R.num.to_f
  end
  
  def get_R_distribution
    return case self.distribution
      when "Normal" then "rnorm(#{self.n_count},mean=#{self.param1},sd=#{Math.sqrt(self.param2)})"
      when "Chi-Squared" then "rchisq(#{self.n_count},df=#{self.param1})"
      when "T" then "rt(#{self.n_count},df=#{self.param1})"
      when "F" then "rf(#{self.n_count},df1=#{self.param1},df2=#{self.param2})"
      when "Binomial" then "rbinom(#{self.n_count},#{self.param1},#{self.param2})"
      when "Uniform" then 2
      when "Cauchy" then "rcauchy(#{self.n_count},location=#{self.param1},scale=#{self.param2})"
      when "1.5-(2X/Y)" then 0
      when "Exponential" then 1
      when "Poisson" then "rpois(#{self.n_count},lambda=#{self.param1})"
    end
  end
  
  def get_R_probability(greater_than,value)
    greater_than ? lower_tail = "FALSE" : lower_tail = "TRUE"
    return case self.distribution
      when "Normal" then "pnorm(#{value},mean=#{self.param1},sd=#{Math.sqrt(self.param2)},lower.tail=#{lower_tail})"
      when "Chi-Squared" then "pchisq(#{value},df=#{self.param1},lower.tail=#{lower_tail})"
      when "T" then "pt(#{value},df=#{self.param1},lower.tail=#{lower_tail})"
      when "F" then "pf(#{value},df1=#{self.param1},df2=#{self.param2},lower.tail=#{lower_tail})"
      when "Binomial" then "pbinom(#{value},#{self.param1},#{self.param2},lower.tail=#{lower_tail})"
      when "Uniform" then 2
      when "Cauchy" then "pcauchy(#{value},location=#{self.param1},scale=#{self.param2},lower.tail=#{lower_tail})"
      when "1.5-(2X/Y)" then 0
      when "Exponential" then 1
      when "Poisson" then "ppois(#{value},lambda=#{self.param1},lower.tail=#{lower_tail})"
    end
  end
  
  def all_params
    (1..5).entries.collect{|n| self.send("param#{n}") }.compact
  end
  
  def valid_distribution
    errors.add(:no_distribution,"No distribution or child variable found.") unless self.associated_variable.present? or self.distribution.present?
    errors.add(:not_a_valid_distribution, "#{self.distribution} is not a valid distribution.") unless RandomVariable.distributions.include?(self.distribution) or self.associated_variable.present?
    errors.add(:wrong_number_of_params, "#{self.all_params.length} params provided, but #{self.distribution_param_count} are required.") unless self.all_params.length == self.distribution_param_count
    errors.add(:could_not_get_values, "Could not find values for this distribution.") unless self.values.present?
  end
  
end
