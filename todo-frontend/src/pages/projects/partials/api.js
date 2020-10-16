
export function getProjects() {
    return [{name: 'hey', id: '1'}, {name: 'hey', id: '1'}];
}

export function getTasks() {
  return [{id: 1, name: 'ho', description: 'IDK', project: {id: 1}}, {id: 1, name: 'ho', description: 'IDK', project: {id: 1}}]
}

export function handleDestroyTask() {
  return 'ey'
}

export function handleDestroyProject() {
  return 'ey'
}
