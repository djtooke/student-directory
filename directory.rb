@students = []

oldstudents = [
  {name: "Dr. Hannibal Lecter", cohort: :April},
  {name: "Darth Vader", cohort: :may},
  {name: "Nurse Ratched", cohort: :may},
  {name: "Michael Corleone", cohort: :may},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]

def input_students
  # This method is deprecated and shouldn't be used
  puts "Please enter the name of a student!"
  puts "To finish, just hit return twice."
  #creates an empty array
  students = []
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = STDIN.gets.chomp
  end
# return the array of students, otherwise the array remains a local variable
  students
end

def input_students_name_cohort_hobby
    while true do
    newstudent = {
      cohort: :Smarch,
      hobby: :Bogeling
    }
    puts "Please input the name of a student! Or to finish, just hit return."
    newname = STDIN.gets.chomp
    if newname.empty? then return @students else newstudent[:name] = newname end
    puts "Cohort? If you just press enter I'll assume it's Smarch."
    cohort = STDIN.gets.chomp.capitalize
    if cohort != "" then newstudent[:cohort] = cohort.to_sym end
    puts "Hobby? The default is bogeling because everyone likes bogeling."
    hobby = STDIN.gets.chomp.capitalize
    if hobby != "" then newstudent[:hobby] = hobby.to_sym end
    # @students << {name: name, cohort: cohort, hobby: hobby}
    @students << newstudent
    puts @students.length == 1 ? "Now we have #{@students.count} student" : "Now we have #{@students.count} students"
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  return nil if @students.length == 0
# Commented out lines give user the choice of a centre-oriented list
  # puts "Do you want the list nice and central? Yes or no?"
  # choice = STDIN.gets.chomp.downcase
  # if choice == "yes"
  #   @students.each_with_index do |student, num|
  #   puts ("#{num + 1}. #{student[:name]} (#{student[:cohort].capitalize} cohort; Their favourite hobby is #{student[:hobby]})".center(100))
  # end
  # elsif choice == "no"
    @students.each_with_index do |student, num|
    puts "#{num + 1}. #{student[:name]} (#{student[:cohort].capitalize} cohort; Their favourite hobby is #{student[:hobby]})"
    end
  # else
  #   puts "Well, you didn't answer yes or no so I'm going on strike."
  # end
end

def print_footer
  puts @students.length == 1 ? "Overall, we have #{@students.length} great student!" : "Overall, we have #{@students.length} great students!"
end

def print_students_starting_with_letter
  return nil if @students.length == 0
  puts "Alright then, give us a letter:"
  letter = STDIN.gets.chomp.downcase
  puts "Okay, here are all the names beginning with #{letter}"
  @students.each_with_index do |student, num|
    if student[:name][0].downcase == letter
    puts "#{num + 1}. #{student[:name]} (#{student[:cohort].capitalize} cohort)"
    end
  end
end

def print_students_under_n_letters
  return nil if @students.length == 0
  puts "Alright then, give us a number:"
  number = STDIN.gets.chomp.to_i
  puts "Okay, here are all the names shorter than #{number} letters:"
  @students.each_with_index do |student, num|
    if student[:name].length <= number
    puts "#{num + 1}. #{student[:name]} (#{student[:cohort].capitalize} cohort)"
    end
  end
end

def students_by_user_cohort
  return nil if @students.length == 0
  studentarray = []
  puts "Input a cohort to search for:"
  cohort = STDIN.gets.chomp.capitalize
  @students.each do |student|
    if student[:cohort] == cohort.to_sym
       studentarray << student[:name]
    end
  end
  puts "Alright, here are all the students in the #{cohort} cohort:"
  puts studentarray
end

def group_by_cohorts
# Gives a list of students by cohort
  return nil if @students.length == 0
  puts "Are you ready for a list of students by cohort? Well, either way here you go."
  cohorts = @students.map {|student| student[:cohort]}
  cohorts = cohorts.uniq
  students_by_cohort = []
  cohorts.each do |cohort|
    students_by_cohort << "#{cohort.capitalize}:"
    @students.each do |student|
      if student[:cohort] == cohort
        students_by_cohort << student[:name]
      end
    end
  end
  puts students_by_cohort
end

def print_menu_list
  puts "Alright, well here we are. These are your options:
  1 for inputting students
  2 for printing a list of students
  3 for selecting a cohort group of students
  4 for printing all students by cohort
  5 for saving the student database to disc
  6 for loading the student database from disc
  9 for exiting and going and making tea or something"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(choice)
  case choice
  when 1
    input_students_name_cohort_hobby
  when 2
    show_students
  when 3
    students_by_user_cohort
  when 4
    group_by_cohorts
  when 5
    save_students
  when 6
    load_students
  when 9
    exit
  else
    puts "What does that mean? That's not a number I recognise."
  end
end

def interactive_menu
  loop do
    print_menu_list
    process(STDIN.gets.chomp.to_i)
  end
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  #iterate over the array of students
  @students.each do |student|
    #turns hash data into array for one student at a time
    student_data = [student[:name], student[:cohort], student[:hobby]]
    # turns array into a string
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def try_load_students
  filename = ARGV.first #first argument from command line
  return if filename.nil? #get out of the method if command wasn't given
  if File.exists?(filename) #if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
# Assigning multiple variables per line!
    name, cohort, hobby = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym, hobby: hobby.to_sym}
  end
  file.close
end

# print(oldstudents)
# students = input_students_name_cohort_hobby
# print_header
# print(students)
# print_footer(students)
# group_by_cohorts(students)
# students_by_user_cohort(students)
# print_students_under_n_letters(students)
# print_students_starting_with_letter(students)
try_load_students
interactive_menu
