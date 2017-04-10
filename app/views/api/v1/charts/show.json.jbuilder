json.title @experiment.title
json.class_id @classroom.id
json.allData @all_data do |data|
  json.x data.x
  json.y data.y
  json.classroom_id data.classroom_id
end
json.classData @class_data do |data|
  json.x data.x
  json.y data.y
  json.classroom_id data.classroom_id
end
