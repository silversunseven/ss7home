#! /usr/bin/ruby
#
#

## Plus
pstarter=0
ptotal_sums=60

array_num = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]

while pstarter <= ptotal_sums
    x = array_num.choice
    y = array_num.choice
    ans = (x + y)
    if ans > 0  && ans <= 20
      puts "#{x} + #{y} = #{ans}"
      pstarter+=1
    end
end

## Minus
mstarter=0
mtotal_sums=60

array_num = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]

while mstarter <= mtotal_sums
    x = array_num.choice
    y = array_num.choice
    ans = (x - y)
    if ans > 0  && ans <= 20
      puts "#{x} - #{y} = #{ans}"
      mstarter+=1
    end
end

## Plus
xtstarter=0
xttotal_sums=60

array_num = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]

while xtstarter <= xttotal_sums
    x = array_num.choice
    y = array_num.choice
    ans = (x - y)
    if x > y
      puts "#{x} > #{y}"
      xtstarter+=1
    elsif x < y
      puts "#{x} < #{y}"
      xtstarter+=1
while mstarter <= mtotal_sums
    x = array_num.choice
    y = array_num.choice
    ans = (x - y)
    if ans > 0  && ans <= 20
      puts "#{x} - #{y} = #{ans}"
      mstarter+=1
    end
end

## Plus
xtstarter=0
xttotal_sums=60

array_num = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]

while xtstarter <= xttotal_sums
    x = array_num.choice
    y = array_num.choice
    ans = (x - y)
    if x > y
      puts "#{x} > #{y}"
      xtstarter+=1
    elsif x < y
      puts "#{x} < #{y}"
      xtstarter+=1
    end
end


## mix <>
mxtstarter=0
mxttotal_sums=60

array_num = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]

while mxtstarter <= mxttotal_sums
    a = array_num.choice
    b = array_num.choice
    c = array_num.choice
    d = array_num.choice
    ans_one = (a + b)
    ans_two = (c - d)
    if ans_one > 0  && ans_one <= 20
      if ans_two > 0  && ans_two <= 20
        if ans_one > ans_two
          puts "#{a} + #{b} >  #{c} - #{d}"
          mxtstarter+=1
        elsif ans_one < ans_two
          puts "#{a} + #{b} <  #{c} - #{d}"
          mxtstarter+=1
        else
        elsif ans_one < ans_two
          puts "#{a} + #{b} <  #{c} - #{d}"
          mxtstarter+=1
        else
          puts "#{a} + #{b} =  #{c} - #{d}"
          mxtstarter+=1
        end
      end
    end
end
