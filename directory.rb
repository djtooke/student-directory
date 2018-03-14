# Don't need this old array any more
# students = [
#   {name: "Dr. Hannibal Lecter", cohort: :november},
#   {name: "Darth Vader", cohort: :november},
#   {name: "Nurse Ratched", cohort: :november},
#   {name: "Michael Corleone", cohort: :november},
#   {name: "Alex DeLarge", cohort: :november},
#   {name: "The Wicked Witch of the West", cohort: :november},
#   {name: "Terminator", cohort: :november},
#   {name: "Freddy Krueger", cohort: :november},
#   {name: "The Joker", cohort: :november},
#   {name: "Joffrey Baratheon", cohort: :november},
#   {name: "Norman Bates", cohort: :november}
# ]

def input_students
  puts "Please enter the names of the students!"
  puts "To finish, just hit return twice."
  #creates an empty array
  students = []
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
# return the array of students, otherwise the array remains a local variable
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each_with_index do |student, num|
    puts "#{num + 1}. #{student[:name]} (#{student[:cohort].capitalize} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.length} great students!"
end

def print_students_starting_with_letter(students)
  puts "Alright then, give us a letter:"
  letter = gets.chomp.downcase
  puts "Okay, here are all the names beginning with #{letter}"
  students.each_with_index do |student, num|
    if student[:name][0].downcase == letter
    puts "#{num + 1}. #{student[:name]} (#{student[:cohort].capitalize} cohort)"
    end
  end
end

def print_students_under_n_letters(students)
  puts "Alright then, give us a number:"
  number = gets.chomp.to_i
  puts "Okay, here are all the names shorter than #{number} letters:"
  students.each_with_index do |student, num|
    if student[:name].length <= number
    puts "#{num + 1}. #{student[:name]} (#{student[:cohort].capitalize} cohort)"
    end
  end
end

students = input_students
print_header
#print(students)
print(students)
print_footer(students)
