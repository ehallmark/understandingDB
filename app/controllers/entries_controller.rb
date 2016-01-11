class EntriesController < ApplicationController
  require 'csv'
  before_action :set_entry, only: [:show, :edit, :update, :destroy]

  # GET /entries
  # GET /entries.json
  def index
    @entries = Entry.all.first(100)
  end

  # GET /entries/1
  # GET /entries/1.json
  def show
  end

  # GET /entries/new
  def new
    @entry = Entry.new
  end

  # GET /entries/1/edit
  def edit
  end

  def file_upload
  end

  def import
    first_row = true
    headers = Array.new
    CSV.foreach(params[:path]) do |row|
      puts row.inspect
      if first_row
        headers = row
        first_row = false
      else
        raise if headers.nil?
        entry_hash = {}
        Entry.headers.each do |header|
          if ["lastmyhh_date","end_date","start_date"].include? header
            begin
              entry_hash[header] = Date.strptime(row[headers.index(header)], '%d%b%Y') if headers.include?(header) and Entry.new(header=>Date.strptime(row[headers.index(header)], '%d%b%Y')).valid?
            rescue
              entry_hash[header] = ""
            end
          else
            entry_hash[header] = ((row[headers.index(header)] || "").split[0] || "").gsub(/[^0-9 ]/,"") if headers.include?(header) and Entry.new(header=>((row[headers.index(header)] || "").split[0]) || "").valid?
          end
        end
        entry_hash.each do |k,v|
          entry_hash.delete(k) unless v.present?
        end
        if entry_hash.keys.length > 0
          entry = Entry.find_or_create_by(entry_hash)
          1.upto(20) do |num| 
            member_hash = {:entry_id=>entry.id}
            Member.headers.each do |header|
              member_hash[header] = ((row[headers.index([header,"_#{num}"].join)] || "").split[0] || "").gsub(/[^0-9 ]/,"") if headers.include?([header,"_#{num}"].join) and Member.new(header=>((row[headers.index([header,"_#{num}"].join)] || "").split[0] || "").gsub(/[^0-9 ]/,"")).valid?
            end
            member_hash.each do |k,v|
              member_hash.delete(k) unless v.present?
            end
            if member_hash.keys.length > 1
              member = Member.find_or_create_by(member_hash)
              entry.members << member unless (entry.members || []).include? member 
            end
          end
        end
      end
    end
    redirect_to :back
  end 

  # POST /entries
  # POST /entries.json
  def create
    @entry = Entry.new(entry_params)

    respond_to do |format|
      if @entry.save
        format.html { redirect_to @entry, notice: 'Entry was successfully created.' }
        format.json { render :show, status: :created, location: @entry }
      else
        format.html { render :new }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entries/1
  # PATCH/PUT /entries/1.json
  def update
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to @entry, notice: 'Entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @entry }
      else
        format.html { render :edit }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.json
  def destroy
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to entries_url, notice: 'Entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
 
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_params
      params.require(:entry).permit(:uasid, :primary_respondent, :uashhid, :survhhid, :uasmembers, :sample_type, :batch, :language, :start_date, :start_year, :start_month, :start_day, :start_hour, :start_min, :start_sec, :end_year, :end_month, :end_day, :end_hour, :end_min, :end_sec, :end_date, :cs_001, :gender, :dateofbirth_day, :dateofbirth_month, :dateofbirth_year, :age, :agerange, :citizenus, :bornus, :stateborn, :countryborn, :countryborn_other, :statereside, :maritalstatus, :livewithpartner, :education, :hisplatino, :white, :black, :nativeamer, :asian, :pacific, :race, :working, :sick_leave, :unemp_layoff, :unemp_look, :retired, :disabled, :lf_other, :laborstatus, :employmenttype, :workfullpart, :hourswork, :hhincome, :anyhhmember, :hhmembernumber, :lastmyhh_date)
    end
end
