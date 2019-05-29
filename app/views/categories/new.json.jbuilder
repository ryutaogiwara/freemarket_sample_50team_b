json.array! @child_categories do |child|
  json.id                child.id
  json.name              child.name
  json.parent_id         child.parent_id
end

json.array! @grandchild_categories do |grandchild|
  json.id                grandchild.id
  json.name              grandchild.name
  json.grandparent_id    grandchild.grandparent_id
end
