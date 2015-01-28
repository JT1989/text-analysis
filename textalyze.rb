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
  downcase_string = string.downcase
  result = string_to_characters(downcase_string) #returns a sanitized string
end

#[v0.4] Reading From a Hard-Coded File
#content = File.read("sample_data/great-gatsby.txt")

#[v1.0] Reading From a User-Supplied File
#if ARGV.size == 0
#  puts "Welcome! What is the filename that you want to anlayze?"
#  puts "For example, type: sample_data/great-gatsby.txt"
#  content = gets.chomp #removes the extra line
#else
#  content = ARGV[0]
#end

#[v1.1] Basic Frequency Statistics
def calculate_percentage(array) #calculates % of each item in an array
  calculate_percentage = item_counts(array.map(&:downcase)) #{"a"=>3, "b"=>2, "ZZZ"=>1}

  calculate_percentage.each do |key, value| # do |"a", 2|
    calculate_percentage[key] = value.to_f/array.length.to_f #for "a" = 2.00/6.00
  end

  calculate_percentage #return "a" => 0.333 #returns a hash containing item and frequency
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

  #p item_counts(sanitize(content))

  p calculate_percentage(["a","b","A","b","a","ZZZ"]) == {"a"=>0.5, "b"=>0.3333333333333333, "zzz"=>0.16666666666666666}
end
