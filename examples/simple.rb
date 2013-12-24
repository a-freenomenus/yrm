require "yrm"

# Find Car object with id eq 1
car = Car.find(1)
puts car.title
car.title = "BMW New"
car.save!

car = Car.new title: "New Car"
car.save!

# Class Method
#
#   find
#   new

# Shared Instance Methods
#   * id
#
#   * attributes => {
#       name: String,
#       friends: Array
#     }
#
#   * save!
#   * destroy!

# Specific Instance Methods
#
#  * attribute_set
#  * attribute_get
