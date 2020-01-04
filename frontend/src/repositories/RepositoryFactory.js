import ActorsRepository from "./actorsRepository"
import BrothelTypesRepository from "./brothelTypesRepository"
import PrefecturesRepository from "./prefecturesRepository"

const repositories = {
  actors: ActorsRepository,
  brothelTypes: BrothelTypesRepository,
  prefectures: PrefecturesRepository
  // other repositories ...
}

export const RepositoryFactory = {
  get: name => repositories[name]
}
