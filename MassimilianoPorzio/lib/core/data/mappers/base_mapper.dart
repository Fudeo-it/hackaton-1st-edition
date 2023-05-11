/*
Mappa un DTO (Model) a una Entity da passare verso la UI
*/
abstract class EntityMapper<M, E> {
  E toEntity(M model);
  M fromEntity(E entity);
}
