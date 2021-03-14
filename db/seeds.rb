# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Location.upsert_all locations
# Salary.upsert_all salaries
require "csv"

def now
  @now ||= Time.now
end

def data
  @data ||= CSV.open("./db/seed_data.csv", headers: true)
end

def users
  data.map do |datum|
    {
      slack_id: Digest::SHA256.hexdigest(datum["slack_id"]),
      created_at: now,
      updated_at: now
    }
  end
end

def profiles
  data.map do |datum|
    {
      user_id: User.find_by(slack_id: Digest::SHA256.hexdigest(datum["slack_id"])).id,
      graduation_year: datum["graduation_year"],
      created_at: now,
      updated_at: now
    }
  end
end

def locations
  [
    {place_id: "ChIJzxcfI6qAa4cR1jaKJ_j0jhE", name: "Denver, CO, USA", created_at: now, updated_at: now},
    {place_id: "ChIJIQBpAG2ahYAR_6128GcTUEo", name: "San Francisco, CA, USA", created_at: now, updated_at: now},
    {place_id: "ChIJOwg_06VPwokRYv534QaPC8g", name: "New York, NY, USA", created_at: now, updated_at: now}
  ]
end

def salaries
  data.each_with_object([]) do |datum, accumulator|
    user = User.find_by(slack_id: Digest::SHA256.hexdigest(datum["slack_id"]))
    amount1 = datum["amount1"]
    amount2 = datum["amount2"]
    amount3 = datum["amount3"]

    year1, month1, day1 = datum["start1"].split("-").map(&:to_i)
    year2, month2, day2 = datum["start2"].split("-").map(&:to_i) if amount2
    year3, month3, day3 = datum["start3"].split("-").map(&:to_i) if amount3

    current1 = amount2.blank?
    current2 = amount3.blank?

    end_date1 = Date.new(year2, month2, day2) - 1.week if amount2
    end_date2 = Date.new(year3, month3, day3) - 1.week if amount3

    location1 = Location.find_by(name: datum["location1"])&.id
    location2 = Location.find_by(name: datum["location2"])&.id unless current1
    location3 = Location.find_by(name: datum["location3"])&.id unless current2

    salary1 = {
      user_id: user.id,
      amount: amount1,
      start_date: Date.new(year1, month1, day1),
      end_date: end_date1,
      current_salary: current1,
      location_id: location1,
      remote: location1 || true,
      created_at: now,
      updated_at: now
    }

    salary2 = if amount2
      {
        user_id: user.id,
        amount: amount2,
        start_date: Date.new(year2, month2, day2),
        end_date: end_date2,
        current_salary: current2,
        location_id: location2,
        remote: location2 || true,
        created_at: now,
        updated_at: now
      }
    end

    salary3 = if amount3
      {
        user_id: user.id,
        amount: amount3,
        start_date: Date.new(year3, month3, day3),
        end_date: nil,
        current_salary: true,
        location_id: location3,
        remote: location3 || true,
        created_at: now,
        updated_at: now
      }
    end

    [salary1, salary2, salary3].map { |salary| accumulator << salary if salary.present? }
  end
end

if User.count <= 1
  puts "Creating users...."
  User.insert_all users
  puts "Completed seeding users."
else
  puts "Users have already been seeded."
end

if Profile.count != User.count
  puts "Creating profiles...."
  Profile.upsert_all profiles
  puts "Completed seeding profiles."
else
  puts "User have already been seeded."
end

if Location.count != locations.count
  puts "Creating locations...."
  Location.upsert_all locations
  puts "Completed seeding locations."
else
  puts "Locations have already been seeded."
end

if Salary.count <= User.count
  puts "Creating salaries...."
  Salary.upsert_all salaries
  puts "Completed seeding salaries."
else
  puts "Salaries have already been seeded."
end
