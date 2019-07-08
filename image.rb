class Image
  attr_accessor :image

  def initialize(image)
    @image = image
  end

  def output_image
    @image.each do |array|
      puts array.join
    end
  end

  def find_ones
    ones = []
    @image.each_with_index do |row, row_number|
      row.each_with_index do |item, col_number|
        if item == 1
          ones << [row_number, col_number]
        end
      end
    end
    ones
  end

  def blur!
    ones = find_ones
      @image.each_with_index do |row, row_number|
        row.each_with_index do |item, col_number|
          ones.each do |found_row_number, found_col_number|

            if row_number == found_row_number && col_number == found_col_number
              @image[row_number -1][col_number] = 1 unless row_number == 0 #up
              @image[row_number +1][col_number] = 1 unless row_number >= 3 #down
              @image[row_number][col_number -1] = 1 unless col_number == 0 #left
              @image[row_number][col_number +1] = 1 unless col_number >= 3 #right
            end
          end
        end
      end
    end
  end


image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])

image.output_image
puts
image.blur!

image.output_image
