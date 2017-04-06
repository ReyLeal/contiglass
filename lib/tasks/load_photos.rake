desc "load conti-photos from photo-folder"
task :load_photos => :environment do

  Photo.create!
  Photo.first.glass_photos.create!
  Photo.first.metal_photos.create!

  def load_photos(file_folder,variable_class_name, class_child_name, filename, class_string, max_while)
    i = 1
    while i <= max_while do
      path = "tmp/conti-photos/conti_photo_database/#{file_folder}/#{filename}#{i}.jpg"
      puts File.open(path, "r")
      if File.open(path, "r")
        photo = variable_class_name.new(photos: File.new(path, "r"))
        class_child_name << photo
        photo.save!
        puts 'file saved'
        if i%10 == 0
          puts "#{i}"
        end
        i += 1
      end
    end
    puts "Done Loading #{class_string}"
  end

  # Loading all_photos
  # load_photos("all_photos" ,AllPhoto, Photo.first.all_photos, "all", "AllPhoto", 276)
  # Loading glass_stairs
  # load_photos("glass_photos/stairs" ,GlassStair, GlassPhoto.first.glass_stairs, "stairs", "GlassStair", 88)
  # # Loading glass_railings
  # load_photos("glass_photos/railings" ,GlassRailing, GlassPhoto.first.glass_railings, "railing", "GlassRailing", 46)
  # Loading glass_elevator
  # load_photos("glass_photos/elevators" ,GlassElevator, GlassPhoto.first.glass_elevators, "elevator", "GlassElevator", 7)
  # Loading glass_floor
  # load_photos("glass_photos/floors" ,GlassFloor, GlassPhoto.first.glass_floors, "floor", "GlassFloor", 12)
  #Loading glass_window
  # load_photos("glass_photos/windows&doors" ,GlassWindowsDoor, GlassPhoto.first.glass_windows_doors, "window_door", "GlassWindowsDoor", 28)
  #Loading glass_shower_door
  # load_photos("glass_photos/showerdoors" ,GlassShowerDoor, GlassPhoto.first.glass_shower_doors, "showerdoor", "GlassShowerDoor", 11)
  #Loading glass_wine_room
  # load_photos("glass_photos/wine_rooms" ,GlassWineRoom, GlassPhoto.first.glass_wine_rooms, "wineroom", "GlassWineRoom", 12)
  #Loading glass_other
  # load_photos("glass_photos/other" ,OtherGlassStructure, GlassPhoto.first.other_glass_structures, "other", "OtherGlassStructure", 10)
  #Loading metal_fabrication
  load_photos("metal_photos/fabrication" ,MetalFabrication, MetalPhoto.first.metal_fabrications, "fabrication", "MetalFabrication", 34)
  #Loading metal_railings
  load_photos("metal_photos/railings" ,MetalRailing, MetalPhoto.first.metal_railings, "railing", "MetalRailing", 12)

end
