# WDI SWL/Ruby Lab
# Blair Caple
# June 20, 2014

require_relative 'objects.rb'

puts '1. Get all current students (i.e. not alumni) sorted alphabetically'
puts 'name'
puts '----------'
result = $school.current_students
result.each { |e| puts e.name }
puts

puts '2. For a given student, find all spell categories they know spells in.'
puts "name: #{$potter.name}"
puts 'spell categories'
puts '----------------'
puts $potter.known_spell_categories
puts

puts '3. For a given student, get their average proficiency level across all spells they know.'
puts "name: #{$potter.name}"
puts "average proficiency: #{$potter.avg_proficiency}:"
puts 'detail:'
$potter.known_spells.each do |e|
  puts "spell: #{e.spell.name}, proficiency: #{e.proficiency}"
end
puts

puts '4. For a given student, find all spells at their level or lower that they don\'t know.'
puts "name: #{$potter.name}"
$potter.known_spells.each do |e|
  puts "spell: #{e.spell.name}, proficiency: #{e.proficiency}" if e.proficiency <= 30
end
puts

puts '5. For a given spell, find all students who are at the spell\'s level or higher, but don\'t know it.'
puts "spell: #{$levitation.name}"
$school.students.each do |student|
  proficiency = student.knows_spell?($levitation)
  if proficiency != false && proficiency <= 30
    puts "#{student.name}: proficiency: #{proficiency}"
  end
end
puts

puts '6. Get a roster of all current students:'
puts 'Return a hash where the keys are house names and the values are hashes. '
puts 'Within these hashes, the keys are year numbers and the values are arrays '
puts 'of students, sorted alphabetically.'
$school.current_student_roster.each do |k, house|
  puts "#{k.to_s} House:"
  keys = house.keys.sort
  keys.each do |year|
    prefix = year == 1 ? "#{year}st" : "#{year}th"
    puts "  #{prefix} years:"
    house[year].sort_by { |e| e.name }.each { |e| puts "    #{e.name}" }
  end
end
puts

puts '7. For a given spell category, houses have a "total proficiency", which'
puts 'is the sum of the proficiency scores of all students in the house for all'
puts 'spells in that category. Find out which spell category each house is '
puts 'most proficient in, using this metric.'
$school.houses.each do |house|
  puts "#{house.name}: "
  house.total_proficiencies.each { |e| puts "#{e.first}: #{e.last}" }
  puts
end
puts
