# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

puts "Seeding database..."

# Create admin user
admin_user = User.find_or_create_by!(email: 'admin@gym.com') do |user|
  user.first_name = 'Admin'
  user.last_name = 'User'
  user.phone = '123-456-7890'
  user.date_of_birth = Date.new(1990, 1, 1)
  user.role = :admin
  user.status = :active
  user.password = 'password123'
  user.password_confirmation = 'password123'
end

# Create gym
gym = Gym.find_or_create_by!(name: 'Main Gym') do |g|
  g.address = '123 Main Street, City, State 12345'
  g.phone = '555-123-4567'
  g.email = 'info@maingym.com'
  g.hours = 'Monday-Friday: 6AM-10PM, Saturday-Sunday: 8AM-8PM'
  g.status = :active
end

# Create membership plans
basic_plan = MembershipPlan.find_or_create_by!(name: 'Basic Membership') do |plan|
  plan.description = 'Access to gym facilities and basic equipment'
  plan.price = 29.99
  plan.duration_months = 1
  plan.features = 'Gym access, Basic equipment, Locker room'
  plan.status = :active
end

premium_plan = MembershipPlan.find_or_create_by!(name: 'Premium Membership') do |plan|
  plan.description = 'Full access to all facilities including classes and personal training'
  plan.price = 59.99
  plan.duration_months = 1
  plan.features = 'Gym access, All equipment, Classes, Personal training, Sauna'
  plan.status = :active
end

# Create sample member user
member_user = User.find_or_create_by!(email: 'member@gym.com') do |user|
  user.first_name = 'John'
  user.last_name = 'Doe'
  user.phone = '555-987-6543'
  user.date_of_birth = Date.new(1985, 5, 15)
  user.role = :member
  user.status = :active
  user.password = 'password123'
  user.password_confirmation = 'password123'
end

# Create member
member = Member.find_or_create_by!(user: member_user) do |m|
  m.membership_plan = premium_plan
  m.gym = gym
  m.join_date = Date.current - 30.days
  m.expiry_date = Date.current + 30.days
  m.status = :active
  m.emergency_contact = 'Jane Doe'
  m.emergency_phone = '555-111-2222'
end

# Create sample staff user
staff_user = User.find_or_create_by!(email: 'staff@gym.com') do |user|
  user.first_name = 'Sarah'
  user.last_name = 'Johnson'
  user.phone = '555-444-3333'
  user.date_of_birth = Date.new(1992, 8, 20)
  user.role = :staff
  user.status = :active
  user.password = 'password123'
  user.password_confirmation = 'password123'
end

# Create staff
staff = Staff.find_or_create_by!(user: staff_user) do |s|
  s.gym = gym
  s.position = 'Personal Trainer'
  s.hire_date = Date.current - 90.days
  s.salary = 2500.00
  s.status = :active
end

# Create activities
yoga_class = Activity.find_or_create_by!(name: 'Yoga Class') do |activity|
  activity.description = 'Relaxing yoga session for all levels'
  activity.duration = 60
  activity.capacity = 20
  activity.price = 15.00
  activity.category = 'Fitness'
  activity.status = :active
  activity.gym = gym
end

spinning_class = Activity.find_or_create_by!(name: 'Spinning Class') do |activity|
  activity.description = 'High-intensity cardio cycling workout'
  activity.duration = 45
  activity.capacity = 15
  activity.price = 20.00
  activity.category = 'Cardio'
  activity.status = :active
  activity.gym = gym
end

# Create equipment
treadmill = Equipment.find_or_create_by!(name: 'Treadmill Pro 2000') do |equipment|
  equipment.description = 'Professional grade treadmill with incline'
  equipment.category = 'Cardio'
  equipment.serial_number = 'TM001'
  equipment.purchase_date = Date.current - 365.days
  equipment.maintenance_date = Date.current + 30.days
  equipment.status = :available
  equipment.gym = gym
end

bench_press = Equipment.find_or_create_by!(name: 'Bench Press Station') do |equipment|
  equipment.description = 'Adjustable bench press with safety bars'
  equipment.category = 'Strength'
  equipment.serial_number = 'BP001'
  equipment.purchase_date = Date.current - 180.days
  equipment.maintenance_date = Date.current + 60.days
  equipment.status = :available
  equipment.gym = gym
end

puts "Database seeded successfully!"
puts "Admin user: admin@gym.com / password123"
puts "Member user: member@gym.com / password123"
puts "Staff user: staff@gym.com / password123"
