def bottle_song_recursive(n)
  if n == 1
    puts "1 bottle of beer on the wall, 1 bottle of beer.\ntake it down pass it around, no more bottles of beer."
  elsif n == 2
    puts "#{n} bottles of beer on the wall, #{n} bottles of beer\ntake one down pass it around, #{n-1} bottle of beer on the wall.\n1 bottle of beer on the wall, 1 bottle of beer.\ntake it down pass it around, no more bottles of beer."
  else
    puts "#{n} bottles of beer on the wall, #{n} bottles of beer\ntake one down pass it around, #{n-1} bottles of beer on the wall."
    bottle_song_lyrics(n-1)
  end
end

def bottle_song_iterative(n)
  until n == 2
    puts "#{n} bottles of beer on the wall, #{n} bottles of beer\ntake one down pass it around, #{n-1} bottles of beer on the wall."
    n -= 1
  end
  puts "2 bottles of beer on the wall, 2 bottles of beer\ntake one down pass it around, 1 bottle of beer on the wall. \n1 bottle of beer on the wall, 1 bottle of beer.\ntake it down pass it around, no more bottles of beer."
end

