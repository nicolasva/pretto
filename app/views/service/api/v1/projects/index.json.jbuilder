json.array! @projects do |project|
  json.id project[:id]
  json.project_kind project[:project_kind]
  json.purcent project[:purcent]
end