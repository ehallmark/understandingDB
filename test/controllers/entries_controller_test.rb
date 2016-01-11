require 'test_helper'

class EntriesControllerTest < ActionController::TestCase
  setup do
    @entry = entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create entry" do
    assert_difference('Entry.count') do
      post :create, entry: { age: @entry.age, agerange: @entry.agerange, anyhhmember: @entry.anyhhmember, asian: @entry.asian, batch: @entry.batch, black: @entry.black, bornus: @entry.bornus, citizenus: @entry.citizenus, countryborn: @entry.countryborn, countryborn_other: @entry.countryborn_other, cs_001: @entry.cs_001, dateofbirth_day: @entry.dateofbirth_day, dateofbirth_month: @entry.dateofbirth_month, dateofbirth_year: @entry.dateofbirth_year, disabled: @entry.disabled, education: @entry.education, employmenttype: @entry.employmenttype, end_date: @entry.end_date, end_day: @entry.end_day, end_hour: @entry.end_hour, end_min: @entry.end_min, end_month: @entry.end_month, end_sec: @entry.end_sec, end_year: @entry.end_year, gender: @entry.gender, hhincome: @entry.hhincome, hhmembernumber: @entry.hhmembernumber, hisplatino: @entry.hisplatino, hourswork: @entry.hourswork, laborstatus: @entry.laborstatus, language: @entry.language, lastmyhh_date: @entry.lastmyhh_date, lf_other: @entry.lf_other, livewithpartner: @entry.livewithpartner, maritalstatus: @entry.maritalstatus, nativeamer: @entry.nativeamer, pacific: @entry.pacific, primary_respondent: @entry.primary_respondent, race: @entry.race, retired: @entry.retired, sample_type: @entry.sample_type, sick_leave: @entry.sick_leave, start_date: @entry.start_date, start_day: @entry.start_day, start_hour: @entry.start_hour, start_min: @entry.start_min, start_month: @entry.start_month, start_sec: @entry.start_sec, start_year: @entry.start_year, stateborn: @entry.stateborn, statereside: @entry.statereside, survhhid: @entry.survhhid, uashhid: @entry.uashhid, uasid: @entry.uasid, uasmembers: @entry.uasmembers, unemp_layoff: @entry.unemp_layoff, unemp_look: @entry.unemp_look, white: @entry.white, workfullpart: @entry.workfullpart, working: @entry.working }
    end

    assert_redirected_to entry_path(assigns(:entry))
  end

  test "should show entry" do
    get :show, id: @entry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @entry
    assert_response :success
  end

  test "should update entry" do
    patch :update, id: @entry, entry: { age: @entry.age, agerange: @entry.agerange, anyhhmember: @entry.anyhhmember, asian: @entry.asian, batch: @entry.batch, black: @entry.black, bornus: @entry.bornus, citizenus: @entry.citizenus, countryborn: @entry.countryborn, countryborn_other: @entry.countryborn_other, cs_001: @entry.cs_001, dateofbirth_day: @entry.dateofbirth_day, dateofbirth_month: @entry.dateofbirth_month, dateofbirth_year: @entry.dateofbirth_year, disabled: @entry.disabled, education: @entry.education, employmenttype: @entry.employmenttype, end_date: @entry.end_date, end_day: @entry.end_day, end_hour: @entry.end_hour, end_min: @entry.end_min, end_month: @entry.end_month, end_sec: @entry.end_sec, end_year: @entry.end_year, gender: @entry.gender, hhincome: @entry.hhincome, hhmembernumber: @entry.hhmembernumber, hisplatino: @entry.hisplatino, hourswork: @entry.hourswork, laborstatus: @entry.laborstatus, language: @entry.language, lastmyhh_date: @entry.lastmyhh_date, lf_other: @entry.lf_other, livewithpartner: @entry.livewithpartner, maritalstatus: @entry.maritalstatus, nativeamer: @entry.nativeamer, pacific: @entry.pacific, primary_respondent: @entry.primary_respondent, race: @entry.race, retired: @entry.retired, sample_type: @entry.sample_type, sick_leave: @entry.sick_leave, start_date: @entry.start_date, start_day: @entry.start_day, start_hour: @entry.start_hour, start_min: @entry.start_min, start_month: @entry.start_month, start_sec: @entry.start_sec, start_year: @entry.start_year, stateborn: @entry.stateborn, statereside: @entry.statereside, survhhid: @entry.survhhid, uashhid: @entry.uashhid, uasid: @entry.uasid, uasmembers: @entry.uasmembers, unemp_layoff: @entry.unemp_layoff, unemp_look: @entry.unemp_look, white: @entry.white, workfullpart: @entry.workfullpart, working: @entry.working }
    assert_redirected_to entry_path(assigns(:entry))
  end

  test "should destroy entry" do
    assert_difference('Entry.count', -1) do
      delete :destroy, id: @entry
    end

    assert_redirected_to entries_path
  end
end
