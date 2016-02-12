class StatisticsController < ApplicationController
  require "rinruby"
  
  def index
    n = 10
    beta_0 = 1
    beta_1 = 0.25
    alpha = 0.05
    seed = 23423
    R.x = (1..n).entries
    R.eval %Q{
        set.seed(#{seed})
        y <- #{beta_0} + #{beta_1}*x + rnorm(#{n})
        fit <- lm( y ~ x )
        est <- round(coef(fit),3)
        pvalue <- summary(fit)$coefficients[2,4]
    }
    
    puts "E(y|x) ~= #{R.est[0]} + #{R.est[1]} * x"
    if R.pvalue < alpha
      @message = "Reject the null hypothesis and conclude that x and y are related."
    else
      @message = "There is insufficient evidence to conclude that x and y are related."
    end
  end
end
