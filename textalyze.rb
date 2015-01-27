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
Great_Gatsby_contents = File.read("sample_data/great-gatsby.txt")
Full_Moby_Dick_contents = File.read("sample_data/moby-dick.full.txt")
Moby_Dick_contents = File.read("sample_data/moby-dick.txt")
Tale_of_Two_Cities_contents = File.read("sample_data/tale-of-two-cities.txt")

# "p" prints something to the screen in a way that's friendlier
# for debugging purposes than print or puts.
if __FILE__ == $0
	#p item_counts([1,2,1,2,1]) == {1 => 3, 2 => 2}
	#p item_counts(["a","b","a","b","a","ZZZ"]) == {"a" => 3, "b" => 2, "ZZZ" => 1}
	#p item_counts([]) == {}
	#p item_counts(["hi", "hi", "hi"]) == {"hi" => 3}
	#p item_counts([true, nil, "dinosaur"]) == {true => 1, nil => 1, "dinosaur" => 1}
	#p item_counts(["a","a","A","A"]) == {"a" => 2, "A" => 2}

  #p string_to_characters("and") == {"a" => 1, "n" => 1, "d" => 1}
  #p string_to_characters("remember") == {"r" => 2, "e" => 3, "m" => 2, "b" => 1}

  #p sanitize("ReMemBEr") == {"r" => 2, "e" => 3, "m" => 2, "b" => 1}
  #p sanitize("Dog iS slEepinG!") == {"d"=>1, "o"=>1, "g"=>2, " "=>2, "i"=>2, "s"=>2, "l"=>1, "e"=>2, "p"=>1, "n"=>1, "!"=>1}

  p item_counts(sanitize(Great_Gatsby_contents))
  p item_counts(sanitize(Full_Moby_Dick_contents))
  p item_counts(sanitize(Moby_Dick_contents))
  p item_counts(sanitize(Tale_of_Two_Cities_contents))
end


# If we've reached this line of code, we know the user supplied us with at least
# one command-line argument. We'll assume it's a file for us to read.

# Each of the lines above will print out "true" or "false" and collectively
# act as a sanity check.  Remember that conceptually "x == y"
# means "are x and y equal?"
#
# That is, when you run the code, if any lines print out "false"
# then you know something is off in your code.
#
# This does *not* mean that your code is perfect if each line
# prints out "true.""  For example,
#   1. We might have missed a corner case
#   2. The code does what it should, but is conceptually confused
#   3. Something else we haven't though of
#
# Remember: Option #3 is *always* possible.