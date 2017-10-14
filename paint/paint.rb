

def paint(image, x, y, c)

  # Empty image case
  return if image.empty?

  # Getting height and width of the image
  height = image.length
  width = image[0].length

  # Checking x and y parameters inside the image
  return if x > width || y > height

  paint_recursive(image, x, y, c, image[x][y], height, width)
end


def paint_recursive(image, x, y, c, previous_color, image_height, image_width)
  # Checking x and y parameters inside the image
  return if x > image_width || y > image_height

  if image[x][y] == previous_color
    image[x][y] = c
    paint_recursive(image, x+1, y, c, previous_color, image_height, image_width) if x + 1 < image_width
    paint_recursive(image, x-1, y, c, previous_color, image_height, image_width) if x - 1 >= 0
    paint_recursive(image, x, y+1, c, previous_color, image_height, image_width) if y + 1 < image_height
    paint_recursive(image, x, y-1, c, previous_color, image_height, image_width) if y - 1 >= 0
  end
end