require 'csv'

namespace :db do
  desc "Loads the CSV datasets from the db/import/"
  task :load_datasets => :environment do
    load_locations
    load_revenues
    load_functions
    load_departments
    load_programs
  end

  desc "Purges all datasets from database"
  task :purge_data => :environment do
    Program.destroy_all
    Department.destroy_all
    Function.destroy_all
    Revenue.destroy_all
    Location.destroy_all
  end

  def load_locations
    puts "Loading locations"
    ca = Location.create(name:'California')
    sf = Location.new(name:'San Francisco County').tap  { |t| t.parent_id = ca.id }
    sf.save
    Location.new(name:'City of San Francisco', population:812000).tap { |t| t.parent_id = sf.id }.save
  end

  def load_revenues
    puts "Loading Revenues"
    Revenue.create(year:2012, amount:7300000000)
    Revenue.create(year:2013, amount:7300000000)
  end

  def load_functions
    puts "Loading functions"
    # functionid,function
    CSV.foreach("#{Rails.root}/db/import/functions.csv", :headers => true) do |row|
      Function.new(name:row['function']).tap { |t| t.reference_code = row['functionid'] }.save
    end
  end

  def load_departments
    puts "Loading departments"
    # departmentid,functionid,department,department_refcode,description,url
    CSV.foreach("#{Rails.root}/db/import/departments.csv", :headers => true) do |row|
      if func = Function.find_by_reference_code(row['functionid'])
        func.departments.new(name:row['department']).tap { |t| t.reference_code = row['departmentid'] }.save
      end
    end
  end

  def load_programs
    puts "Loading programs"
    # programid,departmentid,program,refcode
    CSV.foreach("#{Rails.root}/db/import/programs.csv", :headers => true) do |row|
      if dept = Department.find_by_reference_code(row['departmentid'])
        dept.programs.new(name:row['program']).tap { |t| t.reference_code = row['programid'] }.save
      end
    end
  end

end
