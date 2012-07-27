# [#3] Spelling suggestions](http://puzzlenode.com/puzzles/3-spelling-suggestions)

# file = File.open("3_sample_input.txt", "rb")
file = File.open("3_input.txt", "rb")
file_input = file.read
file.close
file_input_array = file_input.split(' ')
array_out = []

(1..file_input_array[0].to_i).each do |prob_num|
  word1 = file_input_array[3 * prob_num - 2] 
  word2 = file_input_array[3 * prob_num - 1] 
  word3 = file_input_array[3 * prob_num] 
  print "problem=", prob_num, " 1=", word1, " 2=", word2, " 3=", word3
  puts 

  array1 = []
  word1.chars.each do |char1|
    array1 << char1
  end
  array2 = []
  word2.chars.each do |char2|
    array2 << char2
  end
  array3 = []
  word3.chars.each do |char3|
    array3 << char3
  end

  len1 = array1.count
  len2 = array2.count
  len3 = array3.count
  print " Len1=", len1, " Len2=", len2, " Len3=", len3
  puts

  hit2 = 0
  hit3 = 0
  start2 = 0
  start3 = 0
  (0..len1-1).each do |index1|
    (start2..len2-1).each do |index2|
      # print ">>> 1=", index1, "=", array1[index1],
      #         "! 2=", index2, "=", array2[index2],
      #         " ?=", array1[index1] == array2[index2], " "
      if array1[index1] == array2[index2]
        hit2 += 1
        # print " hit2=", hit2, " "
        start2 = index2 + 1
        break
      end
    end
    (start3..len3-1).each do |index3|
      # print ">>> 1=", index1, "=", array1[index1],
      #       ">>> 3=", index3, "=", array3[index3],
      #       " ?=", array1[index1] == array3[index3], " "
      if array1[index1] == array3[index3]
        hit3 += 1
        # print " hit3=", hit3, " "
        start3 = index3 + 1
        break
      end
    end
  end

print "hit2=", hit2, " ? hit3=", hit3
puts

if hit2 >= hit3
  print "2>=3 ", word2
  puts
  array_out << word2
else
  print "not 2>=3 ", word3
  puts
  array_out << word3
end	
end

file = File.open("3_output.txt", 'w')  
(1..file_input_array[0].to_i).each do |prob_num|
  file.puts (array_out[prob_num - 1])
end
file.close
