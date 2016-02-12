class RandomVariablesController < ApplicationController
  require 'rinruby'
  before_action :set_random_variable, except: [:index]

  # GET /random_variables
  # GET /random_variables.json
  def index
    @random_variables = RandomVariable.all
  end

  # GET /random_variables/1
  # GET /random_variables/1.json
  def show
    min = params[:plot_min]
    min.present? ? min = min.to_i : min = nil
    max = params[:plot_max]
    max.present? ? max = max.to_i : max = nil
    scale = params[:scale] 
    scale = 0.5 unless scale.present?
    scale = scale.to_f
    frequency = params[:frequency] 
    frequency = "no" unless frequency.present?
    @random_variable.plot("most_recent_plot.png",min,max,scale,frequency)
  end
  
  def get_values_gt_or_lt_num
    params[:greater_than]=="yes" ? @greater_than_or_less_than = "greater than" : @greater_than_or_less_than = "less than"
    @compared = params[:compare_value].to_f
    results = 0
    @random_variable.values.each{|v|
      if params[:greater_than] == "yes"
        results+=1 if v > @compared
      else
        results+=1 if v < @compared
      end
    }
    @compared = @compared.to_s
    
    @results = "#{results} values #{@greater_than_or_less_than} #{@compared}"

    respond_to do |format|
      format.html { redirect_to :back }
      format.js 
    end
  end
  
  def get_probability_gt_or_lt_num
    params[:greater_than]=="yes" ? @greater_than_or_less_than = "greater than" : @greater_than_or_less_than = "less than"
    @compared = params[:compare_value].to_f
    results = 0
    @random_variable.values.each{|v|
      if params[:greater_than] == "yes"
        results+=1 if v > @compared
      else
        results+=1 if v < @compared
      end
    }
    results = results.to_f/@random_variable.n_count
    @compared = @compared.to_s
    
    @results = "#{results} probability #{@greater_than_or_less_than} #{@compared}"
    
    respond_to do |format|
      format.html { redirect_to :back }
      format.js 
    end
  end
  
  def get_theoretical_probability_gt_or_lt_num
    params[:greater_than]=="yes" ? @greater_than = true : @greater_than = false
    @greater_than ? @greater_than_or_less_than = "greater than" : @greater_than_or_less_than = "less than"


    @compared = params[:compare_value].to_f
    results = @random_variable.theoretical_probability(@compared,@greater_than)
    @compared = @compared.to_s
    @results = "#{results} probability #{@greater_than_or_less_than} #{@compared}"
    respond_to do |format|
      format.html { redirect_to :back }
      format.js 
    end
  end
  
  def regenerate_data
    @random_variable.save
    redirect_to :back
  end


  # GET /random_variables/new
  def new
    @random_variable = RandomVariable.new
  end

  # GET /random_variables/1/edit
  def edit
  end

  # POST /random_variables
  # POST /random_variables.json
  def create
    @random_variable = RandomVariable.new(random_variable_params)

    respond_to do |format|
      if @random_variable.save
        format.html { redirect_to @random_variable, notice: 'Random variable was successfully created.' }
        format.json { render :show, status: :created, location: @random_variable }
      else
        format.html { render :new }
        format.json { render json: @random_variable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /random_variables/1
  # PATCH/PUT /random_variables/1.json
  def update
    respond_to do |format|
      if @random_variable.update(random_variable_params)
        format.html { redirect_to @random_variable, notice: 'Random variable was successfully updated.' }
        format.json { render :show, status: :ok, location: @random_variable }
      else
        format.html { render :edit }
        format.json { render json: @random_variable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /random_variables/1
  # DELETE /random_variables/1.json
  def destroy
    @random_variable.destroy
    respond_to do |format|
      format.html { redirect_to random_variables_url, notice: 'Random variable was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_random_variable
      @random_variable = RandomVariable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def random_variable_params
      params.require(:random_variable).permit!
    end
end
