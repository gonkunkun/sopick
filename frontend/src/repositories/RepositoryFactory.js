import ActorsRepository from "./actorsRepository"

const repositories = {
  actors: ActorsRepository
  // other repositories ...
}

export const RepositoryFactory = {
  get: name => repositories[name]
}
