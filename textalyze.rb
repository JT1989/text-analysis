# This is the base code for v0.1 of our Ruby text analyzer.
# Visit https://github.com/codeunion/text-analysis/wiki to see what to do.
#
# Send an email to your cohort mailing list if you have any questions
# or you're stuck!

# Method name: item_counts
# Input:   An arbitrary array
#
# Returns: A hash where every item is a key whose value is the number of times
#          that item appears in the array
#
# Prints:  Nothing

# Here are some examples:
#     item_counts(["I", "am", "Sam", "I", "am"])
#       # => {"I" => 2, "am" => 2, "Sam" => 1}
#
#     item_counts([10, 20, 10, 20, 20])
#       # => {10 => 2, 20 => 3}
#
# In short, item_counts(array) tells us how many times each item appears
# in the input array.

#[v0.1] Basic count statistics
def item_counts(array)
  counts = Hash.new(0) #Count the array by creating a new hash
	#the first fime we find the word, it will have a default value of 0

  array.each do |key| #Iterate through each "key" in the array
  	#for each item we find, assume that it's a key
  	counts[key] = counts[key] + 1 #increment the key by 1
    # Add code here to modify the "counts" hash accordingly
    # You'll need to handle two cases:
    #   1. The first time we've seen a particular item in the array
    #   2. The second-or-later time we've seen a particular item in the array
  end

  counts # This returns the "counts" hash
end

#[v0.2] String to characters
def string_to_characters(string)
  split_the_string = string.split(//)     #take the string, return an array of characters
  result = item_counts(split_the_string)  #feed this into the array counting method
end

#[v0.3] Basic String Sanitizing
def sanitize(string)
  downcase_string = string.chars.sort.join.downcase
  result = string_to_characters(downcase_string) #returns a sanitized string
end

#[v0.4] Reading From a Hard-Coded File
#file_contents = File.read("sample_data/moby-dick.txt")
#contents = File.read('sample_data/great-gatsby.txt')
# moby_dick_full = File.read('sample_data/moby-dick.full.txt')
# moby_dick = File.read('sample_data/moby-dick.txt')
# tale_of_two_cities = File.read('sample_data/tale-of-two-cities.txt')

#[v1.0] Reading From a User-Supplied File
if ARGV.size == 0
  puts "Welcome! What is the filename that you want to anlayze?"
  puts "For example, type: sample_data/great-gatsby.txt"
  file_name = gets.chomp
  contents = File.read(file_name)
else
  contents = File.read(ARGV[0])
end

# [v1.1] Basic Frequency Statistics
def calculate_percentage(string) #def calculate_percentage("Aand")
  characters = sanitize(string) #characters = sanitize("Aand") --> {"a" => 2, "n" => 1, "d" => 1}
  characters.each do |letter, count|  #|a, 2| |n, 1| |d,2|
    characters[letter] = count.to_f/string.length # 2/4   1/4   1/4
  end
end

# [v1.2] Pretty Histograms
def histogram(string)
  calculated_percentage = calculate_percentage(string)

  calculated_percentage.each do |character, percentage|
    bar_chart = percentage * 100
    bar = "=" * bar_chart
    percentage = percentage.round(2) * 100
    puts "#{character} [#{percentage}%] #{bar}"
  end
end

if __FILE__ == $0
	#p item_counts([1,2,1,2,1]) == {1 => 3, 2 => 2}
	#p item_counts(["a","b","a","b","a","ZZZ"]) == {"a" => 3, "b" => 2, "ZZZ" => 1}
	#p item_counts([]) == {}
	#p item_counts(["hi", "hi", "hi"]) == {"hi" => 3}
	#p item_counts([true, nil, "dinosaur"]) == {true => 1, nil => 1, "dinosaur" => 1}
	#p item_counts(["a","a","A","A"]) == {"a" => 2, "A" => 2}

  #p string_to_characters("Aand") == {"A" => 1, "a" => 1, "n" => 1, "d" => 1}
  #p string_to_characters("remember") == {"r" => 2, "e" => 3, "m" => 2, "b" => 1}

  #p sanitize("Aand") == {"a" => 2, "n" => 1, "d" => 1}
  #p sanitize("ReMemBEr") == {"r" => 2, "e" => 3, "m" => 2, "b" => 1}
  #p sanitize("Dog iS slEepinG!") == {"d"=>1, "o"=>1, "g"=>2, " "=>2, "i"=>2, "s"=>2, "l"=>1, "e"=>2, "p"=>1, "n"=>1, "!"=>1}

  #v0.4 and 1.0
  #p item_counts(sanitize(contents))

  # p calculate_percentage("Aand") == {"a"=>0.5, "n"=>0.25, "d"=>0.25}
  # p histogram("Aand") == {"a"=>0.5, "n"=>0.25, "d"=>0.25}

  p histogram(contents)
end
