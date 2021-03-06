=begin
MTA Lab

Objectives:

Apply your knowledge of Ruby to solve a real world problem.
Get really good at array manipulation.
Activity

Create a program that models a simple subway system.

The program takes the line and stop that a user is getting on at and the line and stop that user is getting off at and prints the journey and the total number of stops for the trip in the console:

plan_trip 'N', 'Times Square', '6', '33rd' # This is only a suggested function name and signature.

# `puts` shows output similar to this:
# "You must travel through the following stops on the N line: 34th, 28th, 23rd, Union Square."
# "Change at Union Square."
# "Your journey continues through the following stops: 23rd, 28th, 33rd."
# "7 stops in total."
There are 3 subway lines:
The N line has the following stops: Times Square, 34th, 28th, 23rd, Union Square, and 8th
The L line has the following stops: 8th, 6th, Union Square, 3rd, and 1st
The 6 line has the following stops: Grand Central, 33rd, 28th, 23rd, Union Square, and Astor Place.
All 3 subway lines intersect at Union Square, but there are no other intersection points. (For example, this means the 28th stop on the N line is different than the 28th street stop on the 6 line, so you'll have to differentiate this when you name your stops in the arrays.)
Tell the user the number of stops AND the stops IN ORDER that they will pass through or change at.
Hints:

Work out how you would do it on paper first! Then start to explain that process in Ruby.
Get the program to work for a single line before trying to tackle multiple lines.
Don't worry about prompting the user for input. Hard code some values to get it working. You can use gets later to make it more interactive.
Consider diagramming the lines by sketching out the subway lines and their stops and intersection.
The key to the lab is finding the index positions of each stop. (hint: index)
Make sure the stops that are the same for different lines have different names (i.e. 23rd on the N and on the 6 need to be differentiated)
=end

LINES = {
  :line_n =>['times_square', '34th', '28th', '23rd', 'union_square', '8th'],
  :line_l =>['8th', '6th', 'union_square', '3rd','1st'],
  :line_6 =>['grand_central', '33rd', '28th', '23rd', 'union_square', 'astor_place']
}



def play_trip
  puts "Which line and station you start with ?such as line_n/line_l/line_6, 34th"
  date = gets.chomp.split(",")
  start_line = date.first.downcase
  start_station = date.last.downcase
  puts "Which line and station you end with? such as line_n/line_l/line_6, 34th "
  date1 = gets.chomp.split(",")
  end_line = date1.first.downcase
  end_station = date1.last.downcase

  line1 = LINES[start_line.to_sym]
  line2 = LINES[end_line.to_sym]
  common_station  = line1 & line2




  sc = LINES[start_line.to_sym].index("union_square")
  ec = LINES[end_line.to_sym].index("union_square")

  s1 = LINES[start_line.to_sym].index(start_station)
  e1 = LINES[end_line.to_sym].index(end_station)

  if start_line == end_line
    if (s1 < e1 )
    puts "You must travel through the following stops on the following: #{LINES[start_line.to_sym][s1..e1]}"
    else
    puts "You must travel through the following stops on the following: #{LINES[start_line.to_sym][e1..s1].reverse}"
    end
  else
     if (s1 < sc)
        puts "You must travel through the following stops on the #{start_line} : #{LINES[start_line.to_sym][s1..sc]}"
        puts  "Change at Union Square."
        if (e1 < ec)
          puts "Your journey continues through the following stops: #{LINES[end_line.to_sym][e1..ec].reverse}"
        else
          puts "Your journey continues through the following stops: #{LINES[end_line.to_sym][ec..e1]}"
        end
     else
        puts "You must travel through the following stops on the #{start_line} : #{LINES[start_line.to_sym][sc..s1].reverse}"
        puts  "Change at Union Square."
        if (e1 < ec)
          puts "Your journey continues through the following stops: #{LINES[end_line.to_sym][e1..ec].reverse}"
        else
          puts "Your journey continues through the following stops: #{LINES[end_line.to_sym][ec..e1]}"
        end
      end
   end
end



LINES.each{|line,station| puts "#{line} : #{station}"}
play_trip
