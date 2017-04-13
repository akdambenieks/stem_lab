json.title @experiment.title
json.class_id @classroom.id
json.xaxis @experiment.plots.first.x
json.yaxis @experiment.plots.first.y
json.zaxis @experiment.plots.first.z
if @plot.plot_type == 'scatter'
  json.allData @plot.scatter_data_sets do |data|
    json.x data.x
    json.y data.y
    json.classroom_id data.classroom_id
  end
  json.classData @plot.scatter_data_sets.where(classroom: current_classroom) do |data|
    json.x data.x
    json.y data.y
    json.classroom_id data.classroom_id
  end
else
  json.allData do
    json.x 0
    json.y 0
    json.classroom_id 0
  end
  json.classData do
    json.x 0
    json.y 0
    json.classroom_id 0
  end
end

# json.allData @all_data do |data|
#   json.x data.x
#   json.y data.y
#   json.classroom_id data.classroom_id
# end
# json.classData @class_data do |data|
#   json.x data.x
#   json.y data.y
#   json.classroom_id data.classroom_id
# end
