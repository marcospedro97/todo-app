
export function getProjects() {
    return [{name: 'hey', id: 2}, {name: 'hey', id: 1}];
}

export function getTasks() {
  return [{id: 2, name: 'ho', description: 'IDK', project: {id: 1}}, {id: 1, name: 'ho', description: 'IDK', project: {id: 1}}]
}

export function handleDestroyTask() {
  return 'ey'
}

export function handleDestroyProject() {
  return 'ey'
}

export function handleSubmitUpdateTask() {
  console.log('hoadsfasdfasdfafsdf');
}

export function handleSubmitUpdateProject() {
  console.log('hoadsfasdfasdfafsdf');
}

export function handleSubmitCreateTask() {
  console.log('hoadsfasdfasdfafsdf');
}

export function handleSubmitCreateProject() {
  console.log('hoadsfasdfasdfafsdf');
}