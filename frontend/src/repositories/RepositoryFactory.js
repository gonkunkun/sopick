import ActorsRepository from "./actorsRepository"
import BrothelTypesRepository from "./brothelTypesRepository"

const repositories = {
  actors: ActorsRepository,
  brothelTypes: BrothelTypesRepository
  // other repositories ...
}

export const RepositoryFactory = {
  get: name => repositories[name]
}
