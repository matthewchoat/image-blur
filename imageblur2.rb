#Image class and logic

class Image

#initialize image
  def initialize(image)
    @image = image
  end

#show original image array
  def output_image
    @image.each do |cell|
      puts cell.join
    end
  end

#blur image logic: if a cell is on (value=1), turn on all cells above, below, to the right, and to the left of cell. If cell on edge, do not modify the non-existant adjacent cells.

  def blur_image

#define new image array with identical length to old array
      image1 = Array.new(@image.length){
      Array.new(@image[0].length){}}

#start indexing through each cell and define values for rows and columns
      @image.each_with_index { |val, rowindex|
        val.each_with_index {|val1, colindex| 

#hardcoding 'nil' index values into zeroes          
          if  image1 [rowindex][colindex] != 1 
            then image1 [rowindex][colindex] = 0 
          end

#if currently indexed cell has a value of 1 in original array, cell value in new array will be 1
          if val1 > 0  
            then  image1 [rowindex][colindex] = 1

#define value of cell directly below currently indexed cell as 1, unless it is the last cell in a column.
          if colindex != val.length-1
            then image1 [rowindex][colindex +1] = 1
          end

#if the currently indexed cell is 1, then define value of cell directly above it as 1.
          if colindex != 0 then
          image1 [rowindex][colindex -1] = 1
          end

#define value of the cell to the RIGHT of the currently indexed cell as 1, unless it is the last cell in a row.
          if rowindex != @image.length-1 then
            image1 [rowindex +1][colindex] = 1
          end

#if the currently indexed cell is 1, then define the value of the cell to the LEFT of it as 1.
          if rowindex != 0 then
            image1 [rowindex -1][colindex] = 1
          end

  end

  }} 

#show blurred image array
      image1.each do |cell|
      puts cell.join
      end
  end      
  end

#define original image
image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])

#Run application

puts "Here's your original image:"

sleep 1

puts " "

image.output_image

puts " "

sleep 1

puts 'Blur this image? (y/n)'

blur = gets.chomp

puts " "


if blur == 'y'

  then 

  puts "Blurring your image now..."

  puts " "

  sleep 1.5

  image.blur_image

  puts " "

  sleep 1

end

puts "Thank you, good bye!"