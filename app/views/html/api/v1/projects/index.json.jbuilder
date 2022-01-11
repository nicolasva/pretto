json.array! @projects do |project|
  json.id project[:id]
  json.name project[:project_kind]
  json.purcent project[:purcent]
end