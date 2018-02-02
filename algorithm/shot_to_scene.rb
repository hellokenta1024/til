class Scene
  attr_accessor :shots, :value

  def initialize(shots, value)
    @value = value
    @shots = shots
  end
end

def lengthEachScene(inputList)
	# WRITE YOUR CODE HERE

  scenes = []

	inputList.each { |input|

    adding_scene = Scene.new([input], 1)
    scenes.push(adding_scene)

    scenes.take(scenes.length - 1).each_with_index { |scene, index|

      if scene.shots.include?(input)
        scenes_to_merge = scenes.drop(index)
        new_scene = merge_scenes(scenes_to_merge)
        scenes = scenes.take(index).push(new_scene)
        break
      end
    }
	}

  return scenes.map { |scene| scene.value }
end

def merge_scenes(scenes)
  result_shots = []
  value = 0
  scenes.each { |scene|
    result_shots = result_shots.concat(scene.shots).uniq
    value += scene.value
  }

  return Scene.new(result_shots, value)
end

#input_list = ["a","b","c", "a"]
input_list = ["a", 'b', 'a', 'b', 'c', 'd', 'c', 'h', 'c', 'i', 'j', 'i', 'k']

puts "#{lengthEachScene(input_list)}"
