begin
  yml = YRM::Storage.new("examples/orm.yml")
rescue YRM::Storage::Error => e
  puts "Unable to initialize storage: #{e.message}"
  exit 1
end

yml.storage["birds"] = [
  {
    "id" => 2,
    "name" => "Woodchuck"
  }
]

yml.save!
