

def bucket_paint(image, x, y, c)
  # Empty image case
  return if image.empty?

  # Getting height and width of the image
  height = image.length
  width = image[0].length

  # Checking x and y parameters inside the image
  return if x >= height || y >= width

  bucket_paint_recursive(image, x, y, c, image[x][y], height, width)
end


def bucket_paint_recursive(image, x, y, c, previous_color, image_height, image_width)
  # Checking x and y parameters inside the image
  return if x >= image_height || y >= image_width

  # Checking if color in the one we want to replace
  if image[x][y] == previous_color
    image[x][y] = c
    bucket_paint_recursive(image, x+1, y, c, previous_color, image_height, image_width) if x + 1 < image_height
    bucket_paint_recursive(image, x-1, y, c, previous_color, image_height, image_width) if x - 1 >= 0
    bucket_paint_recursive(image, x, y+1, c, previous_color, image_height, image_width) if y + 1 < image_width
    bucket_paint_recursive(image, x, y-1, c, previous_color, image_height, image_width) if y - 1 >= 0
  end
end


# Only for test
def print_image(image)
  image.each do |row|
    puts row.map(&:to_s).join(',')
  end
end

def create_random_image(colors, height, width)
  image = Array.new(height){[]}
  (0...height).each do |i|
    (0...width).each do |j|
      image[i][j] = colors.sample
    end
  end
  image
end


# Test Cases
top = 100
height = (1..top).to_a.sample
width = (1..top).to_a.sample
x = (1..top*2).to_a.sample
y = (1..top*2).to_a.sample
image = create_random_image([1,2,3], height, width)

print_image(image)

puts 'painting...'

bucket_paint(image, x, y, 0)

print_image(image)

